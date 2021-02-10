import 'package:flutter/material.dart';
import '../../constants.dart';
import 'custom_text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  const CustomButtonWidget({this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      height: MediaQuery.of(context).size.height * .07,
      // padding: EdgeInsets.all(
      //   MediaQuery.of(context).size.height * .025,
      // ),
      color: purpleColor,
      onPressed: onPressed,
      child: CustomTextWidget(
        text: buttonText,
        alignment: Alignment.center,
        textColor: Colors.white,
      ),
    );
  }
}
