import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  final String text;
  final bool required;
  const FieldTitle({Key? key, required this.text, this.required = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
            text: text,
            style: TextStyle(
              fontSize: 13,
              fontFamily: 'Inter',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.229412,
              color: Color(0xff2F2E41),
            ),
            children: required
                ? [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xffEB4132),
                      ),
                    ),
                  ]
                : []),
      ),
    );
  }
}
