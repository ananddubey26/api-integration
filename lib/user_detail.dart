import 'package:flutter/material.dart';

import 'api_service.dart';
import 'data_model.dart';

class UserDetailScreen extends StatefulWidget {
  final int userId;

  UserDetailScreen({required this.userId});

  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  ApiService apiService = ApiService();
  UserModel? user;

  @override
  void initState() {
    super.initState();
    _fetchUserById();
  }

  _fetchUserById() async {
    try {
      user = await apiService.fetchUserById(widget.userId);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Details')),
      body: user == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${user!.name}'),
                  SizedBox(height: 10),
                  Text('Username: ${user!.username}'),
                  SizedBox(height: 10),
                  Text('Email: ${user!.email}'),
                  // Add more fields as needed
                ],
              ),
            ),
    );
  }
}
