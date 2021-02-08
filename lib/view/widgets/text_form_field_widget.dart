import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final Function onSave;
  final Function validator;

  const CustomTextFormField({
    this.label,
    this.hint,
    this.onSave,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
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
