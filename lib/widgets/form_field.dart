import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';

// ignore: must_be_immutable
class AppFormField extends StatefulWidget {
  final int? line;
  final bool isRequired;
  final String title;
  final String? Function(String?)? validator;
  void Function(TextEditingController)? onchanged;
  void Function(bool)? onSwitch;
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
  final int? maxLength;
  final int? minLength;
  final TextEditingController? secondVal;
  AppFormField({
    Key? key,
    this.line,
    this.secondVal,
    this.matchVerification = false,
    this.isRequired = true,
    this.fontSize = 13,
    this.hintfontSize = 15,
    this.fontFamily = 'Inter-Regular',
    this.fontWeight = FontWeight.w500,
    required this.title,
    this.inputType = TextInputType.text,
    this.formatters,
    required this.hintText,
    this.isPassword = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
    this.validator,
    this.onchanged,
    required this.controller,
    this.bottomText,
    this.maxLength,
    this.onSwitch,
    this.minLength,
  })  : assert(matchVerification ? secondVal != null : true),
        super(key: key);

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  bool obSecureText = true;

  @override
  void initState() {
    widget.controller.addListener(() {
      if (widget.controller.text.length == 0 || widget.controller.text != "") {
        setState(() {});
      }
    });
    super.initState();
  }

  bool _Switchvalue = true;
  @override
  Widget build(BuildContext context) {
    Transform widgets;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != "")
            Row(
              children: [
                FieldTitle(
                  text: widget.title,
                  required: widget.isRequired,
                  fontSize: widget.fontSize,
                  fontFamily: widget.fontFamily,
                  fontWeight: widget.fontWeight,
                ),
                if (widget.title == 'Support Address')
                  Transform.scale(
                    scale: 0.6,
                    child: CupertinoSwitch(
                        thumbColor: Colors.white,
                        trackColor: MyTheme.editbuttontextColor,
                        activeColor: MyTheme.borderchangeColor,
                        value: _Switchvalue,
                        onChanged: (Value) {
                          if (widget.onSwitch != null) widget.onSwitch!(Value);
                          setState(() {
                            _Switchvalue = Value;
                          });
                        }),
                  ),
                if (widget.title == 'Support Address')
                  Text(
                    'Use Business Address',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        fontSize: 13,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                        color: MyTheme.bottomtextColor,
                      ),
                    ),
                  ),
              ],
            ),
          if (widget.title != "")
            SizedBox(
              height: 7,
            ),
          StatefulBuilder(builder: (context, setState) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: widget.controller.text != ""
                      ? MyTheme.borderchangeColor
                      : MyTheme.borderColor,
                ),
                borderRadius: widget.borderRadius,
              ),
              child: TextFormField(
                // textCapitalization: TextCapitalization.characters,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  color: MyTheme.hinttextchangeColor,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: widget.line,
                obscureText: widget.isPassword ? obSecureText : false,
                inputFormatters: widget.formatters,
                controller: widget.controller,
                maxLength: widget.maxLength,

                validator: (value) {
                  if (value == "") {
                    if (widget.isRequired) {
                      return "This Field is required";
                    }
                    if (widget.minLength != null) {
                      if (value!.length < widget.minLength!) {
                        return "Invalid, Minimum length should be ${widget.minLength} digits";
                      }
                    }
                  } else {
                    if (widget.matchVerification) {
                      if (value != widget.secondVal!.text) {
                        return "The ${widget.title} does not match";
                      }
                    }
                  }
                  if (widget.validator != null) return widget.validator!(value);
                },
                textAlign: TextAlign.left,
                keyboardType: widget.inputType,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: widget.borderRadius,
                  ),
                  counterText: "",
                  hintText: widget.hintText,
                  contentPadding: EdgeInsets.only(
                    left: 14,
                    top: 14,
                    right: 14,
                    bottom: 14,
                  ),
                  suffixIcon: widget.isPassword
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              obSecureText = !obSecureText;
                            });
                          },
                          icon:
                              Icon(obSecureText ? Icons.lock : Icons.lock_open))
                      : null,
                  hintStyle: GoogleFonts.inter(
                    fontSize: widget.hintfontSize,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: MyTheme.hinttextColor,
                  ),
                ),
              ),
            );
          }),
          if (widget.bottomText != null)
            SizedBox(
              height: 3,
            ),
          if (widget.bottomText != null)
            Text(
              widget.bottomText!,
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                fontSize: 9,
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
