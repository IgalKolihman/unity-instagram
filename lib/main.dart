import 'package:flutter/material.dart';
import 'package:unity_instagram/home.dart';
import 'package:unity_instagram/post.dart';
import 'package:unity_instagram/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unity Instagram',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: ProfilePage(),
      // initialRoute: ProfilePage.route,
      // routes: {
      //   ProfilePage.route: (context) => ProfilePage()
      // },
    );
  }
}
