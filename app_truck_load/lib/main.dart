// ignore_for_file: prefer_const_constructors

import 'package:app_truck_load/view/login_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(AppWidget(title: "test"));
}

class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: LoginPage(),
    );
  }
}
