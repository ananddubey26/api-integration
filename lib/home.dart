import 'package:flutter/material.dart';

import 'post_list.dart';
import 'user_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Demo')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Posts'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PostsListScreen()));
            },
          ),
          ListTile(
            title: Text('Users'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UsersListScreen()));
            },
          ),
          // Add more ListTiles for other data types
        ],
      ),
    );
  }
}
