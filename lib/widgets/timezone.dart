import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:readyplates_restaurants/utils/my_color.dart';

class TimeZone extends StatelessWidget {
  final void Function(String?) onSelect;
  final String? value;
  final Color color;
  const TimeZone({
    Key? key,
    required this.onSelect,
    this.value,
    required this.color,
  }) : super(key: key);

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
      child: DropdownButtonFormField(
          icon: Padding(
            padding: const EdgeInsets.only(right: 8.17),
            child: FaIcon(
              FontAwesomeIcons.chevronDown,
              color: MyTheme.iconColor,
              size: 14.87,
            ),
          ),
          value: value,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText: 'America - Washington DC',
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
            DropdownMenuItem(child: Text(""), value: ""),
            DropdownMenuItem(
                child: Text(
                  "America - Washington DC",
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    color: MyTheme.hinttextchangeColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: "America - Washington DC"),
            DropdownMenuItem(
                child: Text(
                  "America - Washington",
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    color: MyTheme.hinttextchangeColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: "America - Washington"),
          ],
          onChanged: onSelect),
    );
  }
}
