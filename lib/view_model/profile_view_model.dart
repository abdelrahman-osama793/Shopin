import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopin/model/user_model.dart';
import 'package:shopin/util/local_storage_shared_preference.dart';

class ProfileViewModel extends GetxController {
  LocalStorageSharedPreference localStorageSharedPreference = Get.find();
  UserModel _userModel;

  UserModel get userModel => _userModel;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  Future<void> signOutAll() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageSharedPreference.deleteUser();
  }

  void getCurrentUser() async {
    _loading.value = true;
    await localStorageSharedPreference.getUserData.then((value) {
      _userModel = value;
    });
    _loading.value = false;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }
}
