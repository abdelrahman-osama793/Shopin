import 'package:get/get.dart';
import 'package:shopin/view_model/auth_vm.dart';
import 'package:shopin/view_model/bottom_nav_bar_vm.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => BottomNavBarViewModel());
  }

}