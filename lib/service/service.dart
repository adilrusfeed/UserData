import 'dart:convert';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

import 'package:user_data/model/user_model.dart';
import 'package:user_data/service/api_constant.dart';

class UserService {
  Future<List<UserData>> fetchUsers() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        throw Exception(e);
      }
      final response = await http.get(Uri.parse(ApiConstant.apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => UserData.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to load users. Status code:${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load users. Error: $e');
    }
  }
}
