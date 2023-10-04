import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/HomePage.dart';
import 'package:flutter_application_1/widgets/PlayList.dart';

void main() =>  runApp( MyApp());


class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => HomePage(),
       // "playlistPage" : (context) => PlayListPage(),
      },
    );
  }
}


