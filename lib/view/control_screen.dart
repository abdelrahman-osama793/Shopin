import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopin/view/home_screen.dart';
import 'package:shopin/view/login_screen.dart';
import 'package:shopin/view_model/auth_vm.dart';

class ControlScreen extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null)
          ? HomeScreen()
          : LoginScreen();
    });
  }
}
