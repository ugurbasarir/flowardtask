import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:FlowardTask/Network/constants.dart';
import 'package:FlowardTask/model/user.dart';

import '../model/post.dart';


class Api {
  static var client = http.Client();

  static Future<List<User>?> getUsers() async {
    var response = await client.get(Uri.parse(USERS_URL));
    if (response.statusCode == 200) {
      var json = response.body;
      var list = jsonDecode(json).map<User>((data) => User.fromJson(data)).toList();
      return list;
    } else {
      return null;
    }
  }

  static Future<List<Post>?> getPosts() async {
    var response = await client.get(Uri.parse(POSTS_URL));
    if (response.statusCode == 200) {
      var json = response.body;
      var list = jsonDecode(json).map<Post>((data) => Post.fromJson(data)).toList();
      return list;
    } else {
      return null;
    }
  }

}
