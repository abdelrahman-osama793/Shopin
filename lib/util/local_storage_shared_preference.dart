import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopin/constants.dart';
import 'package:shopin/model/user_model.dart';

class LocalStorageSharedPreference extends GetxController {
  setUserData(UserModel userModel) async {
    SharedPreferences sharedPrefInstance = await SharedPreferences.getInstance();
    await sharedPrefInstance.setString(
      CachedUserData,
      jsonEncode(
        userModel.toJson(),
      ),
    );
  }

  _getUserData() async {
    SharedPreferences sharedPrefInstance = await SharedPreferences.getInstance();
    var response = sharedPrefInstance.getString(CachedUserData);
    return UserModel.fromJson(
      json.decode(response),
    );
  }

  Future<UserModel> get getUserData async {
    try {
      UserModel userModel = await _getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void deleteUser() async {
    SharedPreferences sharedPrefInstance = await SharedPreferences.getInstance();
    sharedPrefInstance.clear();
  }
}
