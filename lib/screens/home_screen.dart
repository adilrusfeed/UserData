import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_data/controller/user_provider.dart';
import 'package:user_data/screens/details_screen.dart';
import 'package:user_data/service/connectivity.dart';
import 'package:user_data/widgets/error_data.dart';
import 'package:user_data/widgets/loading.dart';
import 'package:user_data/widgets/user_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final InternetService _internetService = InternetService();
  late UserProvider _userProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchUsers();
    });
  }
          //-----------------------fetching data--------------------------------

  Future<void> _fetchUsers() async {
    if (await _internetService.isConnected()) {
      await _userProvider.fetchUsers();
    } else {
      ErrorDisplay();
    }
  }

  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 38, 44, 1),

            //-----------------------Appbar--------------------------------
  
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(27, 38, 44, 1),
        title: const Text(
          "User List",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () async {
              if (await _internetService.isConnected()) {
                await _userProvider.fetchUsers();
              } else {
                ErrorDisplay();
              }
            },
          ),
        ],
      ),

            //-----------------------Body--------------------------------
  
      body: _userProvider.loading
          ? LoadingIndicator()
          : _userProvider.errorMessage != null
              ? ErrorDisplay()
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),

            //----------------------search field-------------------------
         
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                            labelText: 'Search user name',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 240, 234, 234)),
                        onChanged: (query) {
                          _userProvider.filterUsers(query);
                        },
                      ),
                    ),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          if (await _internetService.isConnected()) {
                            await _userProvider.fetchUsers();
                          } else {
                            ErrorDisplay();
                          }
                        },
            //-----------------------List item--------------------------------
            
                        child: ListView.builder(
                          itemCount: _userProvider.filteredUsers.length,
                          itemBuilder: (context, index) {
                            final user = _userProvider.filteredUsers[index];
                            return UserListItem(
                              user: user,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                      user: user,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}
