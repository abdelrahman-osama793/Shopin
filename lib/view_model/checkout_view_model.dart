import 'dart:ui';
import 'package:get/get.dart';
import 'package:shopin/view/screens/three_main_screens/control_screen.dart';
import '../constants.dart';

class CheckoutViewModel extends GetxController {
  int _processIndex = 0;

  int get processIndex => _processIndex;

  Pages _pages = Pages.DeliveryTime;

  Pages get pages => _pages;

  DeliveryTypes _deliveryType;

  DeliveryTypes get deliveryType => _deliveryType;

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return purpleColor;
    } else {
      return todoColor;
    }
  }

  void changePageIndex(int index) {
    _processIndex = index;
    if (_processIndex == 1) {
      _pages = Pages.AddAddress;
    } else if (_processIndex == 2) {
      _pages = Pages.Summary;
    } else if (_processIndex == 3) {
      Get.to(ControlScreen());
    }
    update();
  }

  void changeDeliveryType(DeliveryTypes delivery) {
    _deliveryType = delivery;
    if (_deliveryType == DeliveryTypes.EmergencyDelivery) {
      _deliveryType = DeliveryTypes.EmergencyDelivery;
    } else if (_deliveryType == DeliveryTypes.LazyDelivery) {
      _deliveryType = DeliveryTypes.LazyDelivery;
    } else if (_deliveryType == DeliveryTypes.StandardDelivery) {
      _deliveryType = DeliveryTypes.StandardDelivery;
    }
    update();
  }
}
