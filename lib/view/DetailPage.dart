import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:FlowardTask/widget/PostCard.dart';

import '../Controller/post_controller.dart';
import '../model/user.dart';

class DetailPage extends StatelessWidget {
  User user;

  DetailPage(this.user);

  final PostController postController = Get.put(PostController());

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(user.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            user.url,
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Expanded(flex : 1, child: Obx(() {
            if (postController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              var list = postController.posts
                  .where((post) => post.userId == user.userId)
                  .toList();
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return PostCard(list[index].title ?? "title",
                        list[index].body ?? "body");
                  });
            }
          }))
        ],
      ),
    );
  }
}
