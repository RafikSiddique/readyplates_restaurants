import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:readyplates_restaurants/utils/my_color.dart';

class Business extends StatelessWidget {
  final void Function(String?) onSelect;
  final String? value;
  final Color color;
  const Business({
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
            hintText: 'Type of Business',
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
                child: Text(
                  "Corporation",
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    color: MyTheme.hinttextchangeColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: "Corporation"),
            DropdownMenuItem(
              child: Text(
                "Individual, sole proprietor, or single-member LLC",
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  color: MyTheme.hinttextchangeColor,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                ),
              ),
              value: "Indiviual, sole proprietor, or single-member LLC",
            ),
            DropdownMenuItem(
                child: Text(
                  "Limited liability company (LLC)",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    color: MyTheme.hinttextchangeColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: "Limited liability company (LLC)"),
            DropdownMenuItem(
                child: Text(
                  "Nonprofit organization",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    color: MyTheme.hinttextchangeColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: "Nonprofit organization"),
            DropdownMenuItem(
                child: Text(
                  "Partnership",
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    color: MyTheme.hinttextchangeColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: "Partnership"),
          ],
          onChanged: onSelect),
    );
  }
}
