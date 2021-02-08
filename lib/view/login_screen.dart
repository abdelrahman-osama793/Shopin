import 'package:flutter/material.dart';
import 'package:shopin/constants.dart';
import 'package:shopin/view/widgets/custom_button_widget.dart';
import 'package:shopin/view/widgets/custom_text_widget.dart';
import 'package:shopin/view/widgets/social_media_button_widget.dart';
import 'package:shopin/view/widgets/text_form_field_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 80, left: 20, right: 20.0),
        child: Column(
          children: [
            CustomTextWidget(
              text: "Welcome",
              fontSize: 40.0,
              maxFontSize: 40.0,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
            ),
            CustomTextWidget(
              text: "Back.",
              fontSize: 40,
              maxFontSize: 40,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            CustomTextFormField(
              label: "Email Address",
              hint: "abcd@example.com",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            CustomTextFormField(
              label: "Password",
              hint: "********",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            CustomTextWidget(
              text: "Forgot password?",
              alignment: Alignment.topRight,
              fontSize: 15,
              maxFontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            CustomButtonWidget(
              buttonText: "SIGN IN",
              onPressed: null,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            CustomTextWidget(
              text: "-OR-",
              alignment: Alignment.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            SocialMediaButtonWidget(
              buttonText: "Continue with Facebook",
              imageName: "lib/assets/images/facebook.png",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            SocialMediaButtonWidget(
              imageName: "lib/assets/images/google.png",
              buttonText: "Continue with Google",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextWidget(
                  text: "Don't have an account?",
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                CustomTextWidget(
                  text: "Register",
                  textColor: purpleColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
