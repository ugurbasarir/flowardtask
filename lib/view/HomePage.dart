import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:FlowardTask/Controller/user_controller.dart';
import 'package:FlowardTask/design/themes.dart';

import '../Controller/post_controller.dart';
import '../widget/UserCard.dart';

class HomePage extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final PostController postController = Get.put(PostController());

  Widget build(BuildContext context) {
    userController.getUserList();
    postController.getPostList(null);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('welcome'.tr),
        actions: <Widget>[
          OutlinedButton(
            onPressed: () {
              Get.changeTheme(
                Get.isDarkMode ? lightTheme : darkTheme,
              );
            },
            child: Text('Change Theme', style: TextStyle(color: Colors.white)),
          ),
          GestureDetector(
            onTap: () {
              if (Get.locale!.languageCode == 'en_US') {
                Get.updateLocale(Locale('ar_AR'));
              } else {
                Get.updateLocale(Locale('en_US'));
              }
            },
            child: Container(
                width: 60,
                alignment: Alignment.center,
                child: Icon(Icons.language, color: Colors.white)),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: Obx(() {
            if (userController.isLoading.value ||
                postController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: userController.users.length,
                  itemBuilder: (context, index) {
                    return UserCard(
                        userController.users[index],
                        postController.posts
                            .where((post) =>
                                post.userId ==
                                userController.users[index].userId)
                            .length);
                  });
            }
          }))
        ],
      ),
    );
  }
}
