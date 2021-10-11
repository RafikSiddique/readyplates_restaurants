import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DropdownDietType extends StatelessWidget {
  final void Function(String?) onSelect;
  const DropdownDietType({Key? key, required this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        icon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: FaIcon(
            FontAwesomeIcons.chevronDown,
            color: Color(0xff000000),
            size: 14.87,
          ),
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Color(0xffE0E0E0),
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
          ),
          hintText: 'Veg / Non-Veg',
          contentPadding: EdgeInsets.only(
            left: 14,
            top: 14,
          ),
          hintStyle: TextStyle(
            fontSize: 13,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Color(0xff979797).withOpacity(0.7),
          ),
        ),
        items: [
          DropdownMenuItem(child: Text("Select Diet Type"), value: ""),
          DropdownMenuItem(child: Text("Veg"), value: "Veg"),
          DropdownMenuItem(child: Text(" Non-Veg"), value: "Non-Veg"),
        ],
        onChanged: onSelect);
  }
}
