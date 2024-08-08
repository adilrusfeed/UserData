import 'package:flutter/material.dart';
import 'package:user_data/model/user_model.dart';
import 'package:user_data/service/service.dart';

class UserProvider extends ChangeNotifier {
  final UserService _userService = UserService();

  List<UserData> _users = [];
  List<UserData> _filteredUsers = [];
  bool _loading = false;
  String? _errorMessage;

  List<UserData> get users => _users;
  List<UserData> get filteredUsers => _filteredUsers;
  bool get loading => _loading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchUsers() async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _users = await _userService.fetchUsers();
      _filteredUsers = _users;
    } catch (e) {
      if (e.toString().contains("No Internet connection")) {
        _errorMessage =
            "No Internet connection! Please check your internet connection and try again.";
      } else {
        _errorMessage = e.toString();
      }
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void filterUsers(String query) {
    if (query.isEmpty) {
      _filteredUsers = _users;
    } else {
      _filteredUsers = _users
          .where(
              (user) => user.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
