import 'package:flutter/material.dart';

import 'api_service.dart';
import 'data_model.dart';

class PostsListScreen extends StatefulWidget {
  @override
  _PostsListScreenState createState() => _PostsListScreenState();
}

class _PostsListScreenState extends State<PostsListScreen> {
  ApiService apiService = ApiService();
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  _fetchPosts() async {
    try {
      List<dynamic> data = await apiService.fetchPosts();
      posts = data.map((e) => Post.fromJson(e)).toList();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(posts[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailScreen(post: posts[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PostDetailScreen extends StatelessWidget {
  final Post post;

  PostDetailScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${post.title}'),
            SizedBox(height: 10),
            Text('Body: ${post.body}'),
            // Add more fields as needed
          ],
        ),
      ),
    );
  }
}
