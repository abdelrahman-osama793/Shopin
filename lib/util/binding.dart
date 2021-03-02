import 'package:get/get.dart';
import 'package:shopin/util/local_storage_shared_preference.dart';
import 'package:shopin/view_model/auth_vm.dart';
import 'package:shopin/view_model/bottom_nav_bar_vm.dart';
<<<<<<< HEAD
import 'package:shopin/view_model/cart_view_model.dart';
import 'package:shopin/view_model/checkout_view_model.dart';
=======
>>>>>>> parent of 1be6d01 (Cart screen is working but didn't finish the checkout)
import 'package:shopin/view_model/home_view_model.dart';
import 'package:shopin/view_model/profile_view_model.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => BottomNavBarViewModel());
    Get.lazyPut(() => HomeViewModel());
<<<<<<< HEAD
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageSharedPreference());
    Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => CheckoutViewModel());
=======
>>>>>>> parent of 1be6d01 (Cart screen is working but didn't finish the checkout)
  }

}