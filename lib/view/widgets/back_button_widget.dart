import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final Function onPressed;

  const BackButtonWidget({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height * .05,
      child: RaisedButton(
        padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * .005),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.arrow_back_ios_outlined,
          size: MediaQuery.of(context).size.width * .05,
        ),
        elevation: 6.0,
        color: Colors.white,
        onPressed: onPressed,
      ),
    );
  }
}
