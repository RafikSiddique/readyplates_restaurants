import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';

// ignore: must_be_immutable
class AppFormField extends StatelessWidget {
  final int? line;
  final bool isRequired;
  final String title;
  final String? Function(String?)? validator;
  final String hintText;
  final BorderRadius borderRadius;
  final TextEditingController controller;
  final String? bottomText;
  final bool isPassword;
  final List<TextInputFormatter>? formatters;
  final TextInputType inputType;
  final double fontSize;
  final double hintfontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final bool matchVerification;
  final TextEditingController? secondVal;
  AppFormField({
    Key? key,
    this.line,
    this.secondVal,
    this.matchVerification = false,
    this.isRequired = true,
    this.fontSize = 13,
    this.hintfontSize = 12,
    this.fontFamily = 'Inter-Bold',
    this.fontWeight = FontWeight.w500,
    required this.title,
    this.inputType = TextInputType.text,
    this.formatters,
    required this.hintText,
    this.isPassword = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
    this.validator,
    required this.controller,
    this.bottomText,
  })  : assert(matchVerification ? secondVal != null : true),
        super(key: key);

  bool obSecureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != "")
            FieldTitle(
              text: title,
              required: isRequired,
              fontSize: fontSize,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
            ),
          if (title != "")
            SizedBox(
              height: 7,
            ),
          StatefulBuilder(builder: (context, setState) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: controller.text != ""
                      ? MyTheme.buttonchangeColor
                      : MyTheme.buttonColor,
                ),
                borderRadius: borderRadius,
              ),
              child: TextFormField(
                maxLines: line,
                obscureText: isPassword ? obSecureText : false,
                inputFormatters: formatters,
                controller: controller,
                validator: (value) {
                  if (value == "") {
                    if (isRequired) {
                      return "This Field is required";
                    }
                  } else {
                    if (matchVerification) {
                      if (value != secondVal!.text) {
                        return "The ${title} does not match";
                      }
                    }
                  }
                  if (validator != null) return validator!(value);
                },
                textAlign: TextAlign.left,
                keyboardType: inputType,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: borderRadius,
                  ),
                  hintText: hintText,
                  contentPadding: EdgeInsets.only(
                    left: 14,
                    top: 14,
                    right: 14,
                    bottom: 14,
                  ),
                  suffixIcon: isPassword
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              obSecureText = !obSecureText;
                            });
                          },
                          icon:
                              Icon(obSecureText ? Icons.lock : Icons.lock_open))
                      : null,
                  hintStyle: TextStyle(
                    fontSize: hintfontSize,
                    letterSpacing: 0.24,
                    fontFamily: 'Inter-Regular',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    color: controller.text != ''
                        ? MyTheme.hinttextColor
                        : MyTheme.hinttextchangeColor,
                  ),
                ),
              ),
            );
          }),
          if (bottomText != null)
            SizedBox(
              height: 3,
            ),
          if (bottomText != null)
            Text(
              bottomText!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 9,
                fontFamily: 'Poppins',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                color: MyTheme.bottomtextColor,
              ),
            ),
        ],
      ),
    );
  }
}
