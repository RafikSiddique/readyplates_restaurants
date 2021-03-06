import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';

class EditButton extends StatelessWidget {
  final double widthFraction;
  final void Function() onTap;
  const EditButton({Key? key, required this.onTap, this.widthFraction = 0.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * widthFraction,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: MyTheme.editbuttonColor,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/edit@3x.png',
                  height: 16,
                  width: 16,
                ),
                Text(
                  'EDIT',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: MyTheme.editbuttontextColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
