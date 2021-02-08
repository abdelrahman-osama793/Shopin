import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopin/constants.dart';
import 'package:shopin/view/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shopin',
      theme: ThemeData(
        fontFamily: "Nunito",
        scaffoldBackgroundColor: Colors.white,
        cursorColor: purpleColor,
        primaryColor: purpleColor,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
