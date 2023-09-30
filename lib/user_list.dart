import 'package:flutter/material.dart';

import 'api_service.dart';
import 'data_model.dart';
import 'user_detail.dart';

class UsersListScreen extends StatefulWidget {
  @override
  _UsersListScreenState createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  ApiService apiService = ApiService();
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  _fetchUsers() async {
    try {
      users = await apiService.getUsers();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      UserDetailScreen(userId: users[index].id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
