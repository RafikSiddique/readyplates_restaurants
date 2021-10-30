import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';

class PerformanceCircle extends StatelessWidget {
  final String text;
  final String value;
  const PerformanceCircle({Key? key, required this.text, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      height: 140,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: Color(0xffF4A261),
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
          )
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    color: MyTheme.numberColor,
                  ),
                )),
            Text(value,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: MyTheme.buttonColor,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
