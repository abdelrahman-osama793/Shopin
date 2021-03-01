import 'package:flutter/material.dart';
import 'package:shopin/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final Function onSave;
  final Function validator;
  final IconData prefixIcon;

  const CustomTextFormField({
    this.hint,
    this.onSave,
    this.validator,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onSaved: onSave,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            size: 27,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * .05,
            horizontal: MediaQuery.of(context).size.width * .05,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: purpleColor, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          labelStyle: TextStyle(
            color: Colors.black45,
            fontSize: 16.0,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.black26,
          ),
        ),
      ),
    );
  }
}
