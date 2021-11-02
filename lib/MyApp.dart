import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  String name;
  int age;
  MyApp({required this.name, required this.age});
  @override
  Widget build(BuildContext context) {
    // MaterialApp: viết màn hình, giao diện theo chuẩn material design
    return MaterialApp(
      title: "This is MaterialApp",
      home: Scaffold(
        body: Center(
          child: Text(
            "Hello world \nName: ${name}\nAge: ${age}",
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.lightBlue),
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}