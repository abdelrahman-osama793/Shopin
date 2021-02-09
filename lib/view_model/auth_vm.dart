import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController{
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookSignIn = FacebookLogin();

  //Sign in with Facebook method
  void facebookSignInMethod() async{
    FacebookLoginResult facebookLoginResult = await _facebookSignIn.logIn(['email']);
    if(facebookLoginResult.status == FacebookLoginStatus.loggedIn){
      final accessToken = facebookLoginResult.accessToken.token;
      //Requires access token only
      final facebookCredential = FacebookAuthProvider.credential(accessToken);
      //Add the Facebook credentials to "user" table in firebase
      await _auth.signInWithCredential(facebookCredential);
    }
  }


  //Sign in with Google method
  void googleSignInMethod() async{
    final GoogleSignInAccount googleUserAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleUserAccount.authentication;

    final AuthCredential googleAuthCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    //Add the Google credentials to "user" table in firebase
    await _auth.signInWithCredential(googleAuthCredential);
  }

}