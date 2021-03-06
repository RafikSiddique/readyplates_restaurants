import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:readyplates_restaurants/utils/my_color.dart';

class OnboardingButton extends StatelessWidget {
  final void Function()? onTap;
  final Color buttonbackgroundColor;
  final List<BoxShadow>? boxShadow;
  final FontWeight? fontWeight;
  final String text;
  final double fontSize;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final double? elevation;
  final Color buttontextColor;
  const OnboardingButton(
      {Key? key,
      required this.onTap,
      this.fontWeight = FontWeight.w600,
      required this.buttonbackgroundColor,
      this.height = 40.11,
      this.boxShadow,
      this.border,
      this.borderRadius,
      this.elevation = 0,
      required this.text,
      this.fontSize = 17,
      required this.buttontextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        border: border,
        borderRadius: borderRadius,
      ),
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: buttonbackgroundColor,
            elevation: elevation,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
        onPressed: onTap,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: FontStyle.normal,
            color: buttontextColor,
          ),
        ),
      ),
    );
  }
}
