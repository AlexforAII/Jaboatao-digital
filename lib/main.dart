import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/HomePage.dart';
import 'package:flutter_application_1/pages/MusicPage.dart';
import 'package:flutter_application_1/pages/PlayListPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomePage(),
        "playlistPage": (context) => PlayListPage(),
        "musictPage": (context) => MusicPage(),
      },
    );
  }
}