import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopin/view/login_screen.dart';
import 'package:shopin/view/widgets/custom_button_widget.dart';
import 'package:shopin/view/widgets/custom_text_widget.dart';
import 'package:shopin/view/widgets/text_form_field_widget.dart';
import 'package:shopin/view_model/auth_vm.dart';

class RegistrationScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Get.off(
              LoginScreen(),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .05,
              left: 20,
              right: 20.0),
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
                  height: MediaQuery.of(context).size.height * .1,
                ),
                CustomTextFormField(
                  label: "Enter your full name",
                  hint: "Enter your full name",
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
                CustomTextFormField(
                  label: "Email Address",
                  hint: "abcd@example.com",
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
                CustomTextFormField(
                  label: "Password",
                  hint: "********",
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

              ],
            ),
          ),
        ),
      ),
    );
  }
}
