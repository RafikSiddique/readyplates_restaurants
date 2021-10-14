import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';

class DropdownCategory extends StatelessWidget {
  final void Function(String?) onSelect;
  const DropdownCategory({Key? key, required this.onSelect}) : super(key: key);

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
          hintText: 'Starter / Main Course / Desserts / Slides',
          contentPadding: EdgeInsets.only(
            left: 14,
            top: 14,
          ),
          hintStyle: TextStyle(
            fontSize: 13,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.264706,
            color: MyTheme.hinttextColor,
          ),
        ),
        items: [
          DropdownMenuItem(child: Text("Select Category"), value: ""),
          DropdownMenuItem(child: Text("Starter"), value: "Starter"),
          DropdownMenuItem(child: Text("Main Course"), value: "Main Course"),
          DropdownMenuItem(child: Text("Desserts"), value: "Desserts"),
          DropdownMenuItem(child: Text("Slides"), value: "Slides"),
        ],
        onChanged: onSelect);
  }
}
