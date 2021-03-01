import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopin/constants.dart';
import 'package:shopin/view/screens/auth_screens/login_screen.dart';
import 'package:shopin/view/widgets/back_button_widget.dart';
import 'package:shopin/view/widgets/custom_button_widget.dart';
import 'package:shopin/view/widgets/custom_text_widget.dart';
import 'package:shopin/view/widgets/text_form_field_widget.dart';
import 'package:shopin/view_model/auth_vm.dart';

class RegistrationScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .05,
                left: MediaQuery.of(context).size.width * .05,
              ),
              child: BackButtonWidget(
                onPressed: () {
                  Get.off(
                    LoginScreen(),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .05,
                left: MediaQuery.of(context).size.width * .05,
                right: MediaQuery.of(context).size.width * .05,
                bottom: MediaQuery.of(context).size.width * .05,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextWidget(
                      text: "Welcome,",
                      fontSize: 40.0,
                      maxFontSize: 40.0,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                    ),
                    CustomTextWidget(
                      text: "Let's register you in.",
                      fontSize: 30,
                      maxFontSize: 40,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomTextWidget(
                              text: "Full Name",
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            CustomTextFormField(
                              hint: "Enter your full name",
                              prefixIcon: Icons.person_outline,
                              onSave: (value) {
                                controller.name = value;
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
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .03,
                            ),
                            CustomTextWidget(
                              text: "Email Address",
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            CustomTextFormField(
                              hint: "abcd@example.com",
                              prefixIcon: Icons.email_outlined,
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
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            CustomTextFormField(
                              hint: "********",
                              prefixIcon: Icons.lock_outlined,
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
                      height: MediaQuery.of(context).size.height * .08,
                    ),
                    CustomButtonWidget(
                      buttonText: "REGISTER",
                      onPressed: () {
                        _formKey.currentState.save();
                        if (_formKey.currentState.validate()) {
                          controller.registerWithEmailAndPassword();
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextWidget(
                          text: "Already has an account?",
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.to(LoginScreen());
                          },
                          child: CustomTextWidget(
                            text: "Login",
                            textColor: purpleColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
