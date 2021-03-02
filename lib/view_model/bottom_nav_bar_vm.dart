import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopin/view/cart_screen.dart';
import 'package:shopin/view/home_screen.dart';
import 'package:shopin/view/profile_screen.dart';

class BottomNavBarViewModel extends GetxController{
  int _navigationIndex = 0;
  Widget _currentScreen = HomeScreen();
  get navigationIndex => _navigationIndex;
  get currentScreen => _currentScreen;

  void changeNavigationIndex(int selectedScreenValue){
    _navigationIndex = selectedScreenValue;
    switch (selectedScreenValue) {
      case 0:
        {
          _currentScreen = HomeScreen();
          break;
        }
      case 1:
        {
          _currentScreen = CartScreen();
          break;
        }
      case 2:
        {
          _currentScreen = ProfileScreen();
          break;
        }
    }
    update();
  }
}