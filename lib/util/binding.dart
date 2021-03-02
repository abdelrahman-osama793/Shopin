import 'package:get/get.dart';
import 'package:shopin/util/local_storage_shared_preference.dart';
import 'package:shopin/view_model/auth_vm.dart';
import 'package:shopin/view_model/bottom_nav_bar_vm.dart';
import 'package:shopin/view_model/cart_view_model.dart';
import 'package:shopin/view_model/home_view_model.dart';
import 'package:shopin/view_model/profile_view_model.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => BottomNavBarViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageSharedPreference());
    Get.lazyPut(() => ProfileViewModel());
  }

}