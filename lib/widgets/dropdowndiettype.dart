import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';

class DropdownDietType extends StatelessWidget {
  final void Function(String?) onSelect;

  //THIS
  final String? value;
  const DropdownDietType({Key? key, required this.onSelect, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        icon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: FaIcon(
            FontAwesomeIcons.chevronDown,
            color: MyTheme.iconColor,
            size: 14.87,
          ),
        ),
        //THIS
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
            color: MyTheme.hinttextColor,
          ),
        ),
        items: [
          DropdownMenuItem(child: Text("Select Diet Type"), value: ""),
          DropdownMenuItem(child: Text("Veg"), value: "Veg"),
          DropdownMenuItem(child: Text("Non-Veg"), value: "Non-Veg"),
        ],
        onChanged: onSelect);
  }
}
