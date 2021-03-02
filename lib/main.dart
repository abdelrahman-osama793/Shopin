import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopin/constants.dart';
import 'package:shopin/util/binding.dart';
<<<<<<< HEAD
import 'package:shopin/view/screens/three_main_screens/control_screen.dart';
import 'package:shopin/view_model/cart_view_model.dart';
=======
import 'package:shopin/view/control_screen.dart';
>>>>>>> parent of 1be6d01 (Cart screen is working but didn't finish the checkout)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      title: 'Shopin',
      theme: ThemeData(
        fontFamily: "Nunito",
        scaffoldBackgroundColor: Colors.white,
        cursorColor: purpleColor,
        primaryColor: purpleColor,
      ),
      home: Scaffold(
        body: ControlScreen(),
      ),
    );
  }
}
