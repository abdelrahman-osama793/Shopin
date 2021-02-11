import 'package:get/get.dart';

class BottomNavBarViewModel extends GetxController{
  int _navigationIndex = 0;
  get navigationIndex => _navigationIndex;

  void changeNavigationIndex(int selectedScreenValue){
    _navigationIndex = selectedScreenValue;
    update();
  }
}