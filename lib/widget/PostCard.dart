import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  String title;
  String body;

  PostCard(this.title, this.body);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)),
        elevation: 10,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              title: Text(
                title,
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                body,
                style:
                TextStyle(color: Colors.black45, fontWeight: FontWeight.normal),
              )
            )],
        ));
  }
}
