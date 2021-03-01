import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double minFontSize;
  final double maxFontSize;
  final Color textColor;
  final double fontSize;
  final Alignment alignment;
  final FontWeight fontWeight;
  final double letterSpacing;
  final int maxLines;

  const CustomTextWidget({
    this.text,
    this.minFontSize = 14.0,
    this.maxFontSize = 30.0,
    this.textColor = Colors.black,
    this.fontSize = 16.0,
    this.alignment = Alignment.topLeft,
    this.fontWeight,
    this.letterSpacing,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AutoSizeText(
        text,
        maxFontSize: maxFontSize,
        minFontSize: minFontSize,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
        ),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ),
      alignment: alignment,
    );
  }
}
