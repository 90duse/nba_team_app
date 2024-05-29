import 'package:basketballteams/homepage.dart';
import 'package:basketballteams/logic/logic_code.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basketball Teams',
      home: const Homepage(),
      routes: approutes,
    );
  }
}
