import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DropdownStandard extends StatelessWidget {
  final void Function(String?) onSelect;
  const DropdownStandard({Key? key, required this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        icon: Padding(
          padding: const EdgeInsets.only(right: 8.17),
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
            letterSpacing: -0.264706,
            color: Color(0xff979797).withOpacity(0.7),
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
