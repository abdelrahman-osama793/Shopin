import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopin/constants.dart';
import 'package:shopin/util/binding.dart';
import 'package:shopin/view/control_screen.dart';
import 'package:shopin/view/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      title: 'Shopin',
      theme: ThemeData(
        fontFamily: "Nunito",
        scaffoldBackgroundColor: Colors.white,
        cursorColor: purpleColor,
        primaryColor: purpleColor,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ControlScreen(),
      ),
    );
  }
}
