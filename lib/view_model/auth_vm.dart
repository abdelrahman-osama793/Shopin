import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopin/model/user_model.dart';
import 'package:shopin/service/firestore_user.dart';
import 'package:shopin/view/home_screen.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookSignIn = FacebookLogin();
  String email;
  String password;
  String name;
  Rx<User> _user = Rx<User>();

  String get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  //Sign in with Facebook method
  void facebookSignInMethod() async {
    FacebookLoginResult facebookLoginResult =
        await _facebookSignIn.logIn(['email']);
    if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
      final accessToken = facebookLoginResult.accessToken.token;
      //Requires access token only
      final facebookCredential = FacebookAuthProvider.credential(accessToken);
      try {
        //Add the Facebook credentials to "user" table in firebase
        await _auth.signInWithCredential(facebookCredential).then(
          (user) async {
            saveUserData(user);
            Get.offAll(HomeScreen());
          },
        );
        Get.offAll(HomeScreen());
      } catch (e) {
        Get.snackbar(
          'Error',
          e.message,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          borderRadius: 10,
          animationDuration: Duration(seconds: 2),
          duration: Duration(seconds: 4),
          margin: EdgeInsets.only(bottom: 20, right: 10, left: 10),
          isDismissible: true,
        );
      }
    }
  }

  //Sign in with Google method
  void googleSignInMethod() async {
    final GoogleSignInAccount googleUserAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUserAccount.authentication;

    final AuthCredential googleAuthCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    //Add the Google credentials to "user" table in firebase
    try {
      await _auth.signInWithCredential(googleAuthCredential).then(
        (user) async {
          saveUserData(user);
          Get.offAll(HomeScreen());
        },
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.message,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        borderRadius: 10,
        animationDuration: Duration(seconds: 2),
        duration: Duration(seconds: 4),
        margin: EdgeInsets.only(bottom: 20, right: 10, left: 10),
        isDismissible: true,
      );
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(HomeScreen());
    } catch (e) {
      Get.snackbar(
        'Error',
        e.message,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        borderRadius: 10,
        animationDuration: Duration(seconds: 2),
        duration: Duration(seconds: 4),
        margin: EdgeInsets.only(bottom: 20, right: 10, left: 10),
        isDismissible: true,
      );
    }
  }

  void registerWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (user) async {
          saveUserData(user);
          Get.offAll(HomeScreen());
        },
      );
    } catch (e) {
      print(e.message);
      Get.snackbar(
        'Error',
        e.message,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        borderRadius: 10,
        animationDuration: Duration(seconds: 2),
        duration: Duration(seconds: 4),
        margin: EdgeInsets.only(bottom: 20, right: 10, left: 10),
        isDismissible: true,
      );
    }
  }

  void saveUserData(UserCredential userCredential) async {
    UserModel userModel = UserModel(
      userId: userCredential.user.uid,
      email: userCredential.user.email,
      name: name == null ? userCredential.user.displayName : name,
      profilePic: '',
    );
    await FireStoreUser().addUsersToFireStoreDB(userModel);
  }
}
