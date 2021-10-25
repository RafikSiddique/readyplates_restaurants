import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:readyplates_restaurants/utils/my_color.dart';

class DropdownCategory extends StatelessWidget {
  final void Function(String?) onSelect;
  final String? value;
  final Color color;
  const DropdownCategory({
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
              // borderRadius: BorderRadius.all(
              //   Radius.circular(6.0),
              // ),
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
          onChanged: onSelect),
    );
  }
}
