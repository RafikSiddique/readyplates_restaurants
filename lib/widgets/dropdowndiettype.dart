import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DropdownDietType extends StatelessWidget {
  const DropdownDietType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 16,right: 16),
      // width: MediaQuery.of(context).size.width,
      height: 45,
      width: 163,
      child: DropdownButtonFormField(
        icon: Padding(
          padding: const EdgeInsets.only(right: 10.3),
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
            letterSpacing: -0.264706,
            color: Color(0xff979797).withOpacity(0.7),
          ),
        ),
        items: [
          DropdownMenuItem(child: Text("Select Menu"), value: ""),
          DropdownMenuItem(
              child: Text("Veg / Non-Veg"), value: "Veg / Non-Veg"),
        ],
        onChanged: (newValue) {
          // setState(() {
          //   // rescity = newValue.toString();

          //   print(newValue);
          // });
        },
      ),
    );
  }
}