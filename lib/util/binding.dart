import 'package:get/get.dart';
import 'package:shopin/view_model/auth_vm.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
  }

}