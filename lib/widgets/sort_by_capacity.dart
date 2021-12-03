import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';

class SortByCapacity extends StatelessWidget {
  const SortByCapacity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 164,
      decoration: BoxDecoration(
          color: MyTheme.searchbackcolor,
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButtonFormField<int>(
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
          hintText: 'Table Capacity',
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
        items: List.generate(10, (index) => index + 1)
            .map(
              (i) => DropdownMenuItem<int>(
                  child: Text(
                    i.toString(),
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: MyTheme.bottomtextColor,
                    ),
                  ),
                  value: i),
            )
            .toList(),
        onChanged: (newValue) {
          // setState(() {
          //   // controller.capacities[i] = newValue!;
          // });
        },
      ),
    );
  }
}
