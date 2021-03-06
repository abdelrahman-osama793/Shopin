import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopin/constants.dart';
import 'package:shopin/view/screens/auth_screens/registration_screen.dart';
import 'package:shopin/view/widgets/custom_button_widget.dart';
import 'package:shopin/view/widgets/custom_text_widget.dart';
import 'package:shopin/view/widgets/social_media_button_widget.dart';
import 'package:shopin/view/widgets/text_form_field_widget.dart';
import 'package:shopin/view_model/auth_vm.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .07,
            left: MediaQuery.of(context).size.width * .05,
            right: MediaQuery.of(context).size.width * .05,
          ),
          child: Form(
            key: _formKey,
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
                  height: MediaQuery.of(context).size.height * .02,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [imageShadow],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
                    child: Column(
                      children: [
                        CustomTextWidget(
                          text: "Email Address",
                          textColor: Colors.grey,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        CustomTextFormField(
                          hint: "abcd@example.com",
                          prefixIcon: Icons.person_outline,
                          onSave: (value) {
                            controller.email = value;
                          },
                          validator: (value) {
                            if (value == null) {
                              Get.snackbar(
                                "Empty field",
                                "Please enter your email",
                                borderRadius: 10,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.black,
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .02,
                        ),
                        CustomTextWidget(
                          text: "Password",
                          textColor: Colors.grey,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        CustomTextFormField(
                          hint: "********",
                          prefixIcon: Icons.lock_outline,
                          onSave: (value) {
                            controller.password = value;
                          },
                          validator: (value) {
                            if (value == null) {
                              Get.snackbar(
                                "Empty field",
                                "Please enter your password",
                                borderRadius: 10,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.black,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
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
                    onPressed: () {
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        controller.signInWithEmailAndPassword();
                      }
                    }),
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
                  onPressed: () {
                    controller.facebookSignInMethod();
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                SocialMediaButtonWidget(
                  imageName: "lib/assets/images/google.png",
                  buttonText: "Continue with Google",
                  onPressed: () {
                    controller.googleSignInMethod();
                  },
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
                    GestureDetector(
                      onTap: (){
                        Get.to(RegistrationScreen());
                      },
                      child: CustomTextWidget(
                        text: "Register",
                        textColor: purpleColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
