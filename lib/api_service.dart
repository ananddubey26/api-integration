import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'data_model.dart';

class ApiService {
  Future<List<UserModel>> getUsers() async {
    final response = await http
        .get(Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint));

    log("Response Body ${response.body}");
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => UserModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse(ApiConstants.baseUrl + '/posts'));
    log("Response Body ${response.body}");
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<Map<String, dynamic>> fetchPostById(int id) async {
    final response =
        await http.get(Uri.parse(ApiConstants.baseUrl + '/posts/$id'));
    log("Response Body ${response.body}");
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<UserModel> fetchUserById(int id) async {
    final response =
        await http.get(Uri.parse(ApiConstants.baseUrl + '/users/$id'));
    log("Response Body ${response.body}");
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}
