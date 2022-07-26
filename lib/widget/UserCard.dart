import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../View/DetailPage.dart';
import '../model/user.dart';

class UserCard extends StatelessWidget {
  User user;
  int postCount;

  UserCard(this.user, this.postCount);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 10,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.thumbnailUrl),
              ),
              title: Text(
                user.name,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle:
              Text(
                postCount.toString(),
                style: TextStyle(
                    color: Colors.black45, fontWeight: FontWeight.normal),
              ),
              trailing: Icon(Icons.play_arrow_sharp),
              onTap: () {
                Get.to(() => DetailPage(user));
              },
            )
          ],
        ));
  }
}
