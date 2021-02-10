import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopin/view/login_screen.dart';

class HomeScreen extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () {
            _auth.signOut();
            Get.offAll(LoginScreen());
          },
          child: Text("logout"),
        ),
      ),
    );
  }
}
