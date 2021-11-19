// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';

// import 'package:readyplates_restaurants/utils/my_color.dart';

// class TableDropDown extends StatelessWidget {
//   final void Function(String?) onSelect;
//   final String? value;
//   const TableDropDown({
//     Key? key,
//     required this.onSelect,
//     this.value,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<OnboardingController>();

//     return Container(
//       height: 28,
//       width: 56,
//       decoration: BoxDecoration(
//           color: Color(0xffE2F5F4), borderRadius: BorderRadius.circular(5)),
//       child: DropdownButtonFormField(
//           isExpanded: true,
//           icon: Padding(
//             padding: const EdgeInsets.only(
//               right: 10,
//             ),
//             child: FaIcon(
//               FontAwesomeIcons.caretDown,
//               color: Color(0xff6E6D7A),
//               size: 14.87,
//             ),
//           ),
//           value: value,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderSide: BorderSide.none,
//             ),
//             hintText: '00',
//             contentPadding: EdgeInsets.only(
//               left: 14,
//             ),
//             hintStyle: GoogleFonts.inter(
//               fontSize: 13,
//               fontStyle: FontStyle.normal,
//               fontWeight: FontWeight.w500,
//               color: MyTheme.bottomtextColor,
//             ),
//           ),
//           items: controller.noOfTable
//               .map(
//                 (e) => DropdownMenuItem(
//                     child: Text(
//                       e,
//                       style: GoogleFonts.inter(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w500,
//                         fontStyle: FontStyle.normal,
//                         color: MyTheme.bottomtextColor,
//                       ),
//                     ),
//                     value: e),
//               )
//               .toList(),
//           onChanged: onSelect),
//     );
//   }
// }
