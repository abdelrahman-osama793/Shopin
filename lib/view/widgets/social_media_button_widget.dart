import 'package:flutter/material.dart';

import 'custom_text_widget.dart';

class SocialMediaButtonWidget extends StatelessWidget {
  final String buttonText;
  final String imageName;
  final Function onPressed;

  const SocialMediaButtonWidget({
    this.buttonText,
    this.imageName,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey.shade300, width: 2),
      ),
      height: MediaQuery.of(context).size.height * .07,
      onPressed: onPressed,
      child: Row(
        children: [
          Container(
            child: Image.asset(
              imageName,
            ),
            height: 22,
            width: 22,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .13,
          ),
          CustomTextWidget(
            text: buttonText,
          ),
        ],
      ),
    );
  }
}
