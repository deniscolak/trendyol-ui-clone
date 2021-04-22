import 'package:flutter/material.dart';
import 'package:trendyol_ui_clone/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FormLogin(),
      ],
    )));
  }
}
