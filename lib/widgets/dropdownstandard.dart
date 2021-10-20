import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:readyplates_restaurants/utils/my_color.dart';

class DropdownStandard extends StatelessWidget {
  final void Function(String?) onSelect;
  final String? value;
  const DropdownStandard({
    Key? key,
    required this.onSelect,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
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
            borderSide: BorderSide(
              width: 1,
              color: MyTheme.borderColor,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
          ),
          hintText: 'Full / Half / Quarter / Other',
          contentPadding: EdgeInsets.only(
            left: 14,
            top: 14,
          ),
          hintStyle: TextStyle(
            fontSize: 13,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: MyTheme.hinttextColor,
          ),
        ),
        items: [
          DropdownMenuItem(
              child: Text("Select Standard Serving Size"), value: ""),
          DropdownMenuItem(child: Text("Full"), value: "Full"),
          DropdownMenuItem(child: Text("Half"), value: "Half"),
          DropdownMenuItem(child: Text("Quarter"), value: "Quarter"),
          DropdownMenuItem(child: Text("Other"), value: "Other"),
        ],
        onChanged: onSelect);
  }
}
