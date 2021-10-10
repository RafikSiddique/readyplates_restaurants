import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';

class AppFormField extends StatelessWidget {
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
  AppFormField({
    Key? key,
    this.isRequired = true,
    required this.title,
    this.inputType = TextInputType.text,
    this.formatters,
    required this.hintText,
    this.isPassword = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
    this.validator,
    required this.controller,
    this.bottomText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FieldTitle(
            text: title,
            required: isRequired,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            inputFormatters: formatters,
            controller: controller,
            validator: (value) {
              if (isRequired) {
                if (value == "") {
                  return "This Field is required";
                }
              }
              if (validator != null) return validator!(value);
            },
            textAlign: TextAlign.left,
            keyboardType: inputType,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xffBEC5D1)),
                borderRadius: borderRadius,
              ),
              hintText: hintText,
              contentPadding: EdgeInsets.only(
                left: 14,
                top: 14,
              ),
              hintStyle: TextStyle(
                fontSize: 12,
                letterSpacing: 0.24,
                fontFamily: 'Inter-Regular',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                color: Color(0xff9CA3AF),
              ),
            ),
          ),
          if (bottomText != null)
            SizedBox(
              height: 3,
            ),
          if (bottomText != null)
            Text(
              'Atleast 8 characters (Caps, Small & Special Characters)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 9,
                fontFamily: 'Poppins',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                letterSpacing: -0.229412,
                color: Color(0xff6E6D7A),
              ),
            ),
        ],
      ),
    );
  }
}
