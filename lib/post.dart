import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:unity_instagram/home.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});
  static const String route = '/post';

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(HomePage.route);
            },
            child: Text("Back Home")),
      ),
    );
  }
}
