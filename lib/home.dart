import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:unity_instagram/post.dart';
import 'package:unity_instagram/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ProfilePage.route);
                },
                child: Text("Profile")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(PostPage.route);
                },
                child: Text("Post")),
          ],
        ),
      ),
    );
  }
}
