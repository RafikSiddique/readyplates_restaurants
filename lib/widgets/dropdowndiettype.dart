import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';

class DropdownDietType extends StatelessWidget {
  final void Function(String?) onSelect;

  //THIS
  final String? value;
  final Color color;
  const DropdownDietType(
      {Key? key, required this.onSelect, this.value, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6.0),
        ),
        border: Border.all(
          width: 1,
          color: color,
          style: BorderStyle.solid,
        ),
      ),
      child: DropdownButtonFormField<String>(
          icon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FaIcon(
              FontAwesomeIcons.chevronDown,
              color: MyTheme.iconColor,
              size: 14.83,
            ),
          ),
          //THIS
          value: value,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              // borderRadius: BorderRadius.all(
              //   Radius.circular(6.0),
              // ),
            ),
            hintText: 'Vegan/Meat/Vegetarian',
            contentPadding: EdgeInsets.only(
              left: 14,
              top: 14,
            ),
            hintStyle: GoogleFonts.inter(
              fontSize: 15,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              color: MyTheme.hinttextColor,
            ),
          ),
          items: [
            DropdownMenuItem(
              child: Text("Vegetarian"),
              value: "0",
            ),
            DropdownMenuItem(child: Text("Vegan"), value: "1"),
            DropdownMenuItem(child: Text("Meat"), value: "2"),
          ],
          onChanged: onSelect),
    );
  }
}
