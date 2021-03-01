import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopin/view/screens/auth_screens/login_screen.dart';
import 'package:shopin/view_model/auth_vm.dart';
import 'package:shopin/view_model/bottom_nav_bar_vm.dart';

class ControlScreen extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<BottomNavBarViewModel>(
              init: BottomNavBarViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: _bottomNavBarWidget(),
              ),
            );
    });
  }

  // Bottom navigation bar widget
  Widget _bottomNavBarWidget() {
    return GetBuilder<BottomNavBarViewModel>(
      init: Get.find(),
      builder: (controller) => BottomNavigationBar(
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'My Cart',
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.person_outlined,
            ),
          ),
        ],
        currentIndex: controller.navigationIndex,
        onTap: (index) {
          controller.changeNavigationIndex(index);
        },
        // elevation: 0,
        backgroundColor: Colors.white,
      ),
    );
  }
}
