import 'dart:developer';

import 'package:get/state_manager.dart';
import 'package:FlowardTask/model/user.dart';

import '../model/post.dart';
import '../network/api.dart';

class PostController extends GetxController {
  var isLoading = true.obs;
  var posts = <Post>[].obs;

  void getPostList(int? userId) async {
    try {
      isLoading(true);
      var res = await Api.getPosts();
      if (res != null) {
        if (userId == null) {
          posts.assignAll(res);
        } else {
          var usersPost = res.where((post) => post.userId == userId);
          posts.assignAll(usersPost);
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
