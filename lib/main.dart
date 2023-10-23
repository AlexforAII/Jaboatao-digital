import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/pages/HomePage.dart';
import 'package:flutter_application_1/pages/MusicPage.dart';
import 'package:flutter_application_1/pages/PlayListPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const LoginScreen(),
        "/home": (context) => const HomePage(),
        "/playlistPage": (context) => PlayListPage(),
      },
    );
  }
}
