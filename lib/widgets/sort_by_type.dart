import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';

class SortByType extends StatelessWidget {
  final Function(bool) sort;
  const SortByType({Key? key, required this.sort}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Highest to Lowest';
    return Container(
      height: 30,
      width: 164,
      decoration: BoxDecoration(
          color: MyTheme.searchbackcolor,
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        icon: Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: FaIcon(
            FontAwesomeIcons.chevronDown,
            color: MyTheme.chevrondowncolor,
            size: 15,
          ),
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: 'Highest to Lowest',
          contentPadding: EdgeInsets.only(
            left: 14,
          ),
          hintStyle: GoogleFonts.nunito(
            fontSize: 13,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: MyTheme.chevrondowncolor,
          ),
        ),
        value: dropdownValue,
        items: <String>[
          'Highest to Lowest',
          'Lowest to Highest',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: GoogleFonts.nunito(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: MyTheme.chevrondowncolor,
              ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          dropdownValue = newValue!;
          if (newValue == "Highest to Lowest") {
            sort(true);
          } else {
            sort(false);
          }
        },
      ),
    );
  }
}
