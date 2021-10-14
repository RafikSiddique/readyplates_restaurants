import 'package:flutter/material.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';

class FieldTitle extends StatelessWidget {
  final String text;
  final bool required;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  const FieldTitle({
    Key? key,
    required this.text,
    this.required = true,
    this.fontWeight = FontWeight.w500,
    this.fontSize = 13,
    this.fontFamily = 'Inter',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
            text: text,
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: fontFamily,
              fontStyle: FontStyle.normal,
              fontWeight: fontWeight,
              color: MyTheme.labelColor,
            ),
            children: required
                ? [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        fontSize: fontSize + 3,
                        color: MyTheme.starColor,
                      ),
                    ),
                  ]
                : []),
      ),
    );
  }
}
