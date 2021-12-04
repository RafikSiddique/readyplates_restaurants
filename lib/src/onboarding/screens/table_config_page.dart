import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';

class TableConfig extends StatefulWidget {
  static const id = "/tableconfig";
  const TableConfig({Key? key}) : super(key: key);

  @override
  State<TableConfig> createState() => _TableConfigState();
}

class _TableConfigState extends State<TableConfig> {
  final controller = Get.find<OnboardingController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool add = false;

  @override
  Widget build(BuildContext context) {
    return OnBoardingWrapper(
      onboardingController: controller,
      appBarTitle: 'Table Configuration',
      buttonText: 'CONTINUE',
      onTap: () {
        formKey.currentState!.save();
        if (formKey.currentState!.validate()) ;
        controller.onboardingApi(OnBoardingMethod.api13);
      },
      textControllers: [],
      enabled: controller.capacities.isNotEmpty && controller.tables.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 27,
                ),
                for (var i = 0; i < controller.tables.length; i++)
                  Visibility(
                    visible: controller.edit[i],
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 52,
                            width: 96,
                            decoration: BoxDecoration(
                                color: Color(0xffE0E0E0),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Table  ${controller.tables[i]}',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.bottomtextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 52,
                            width: 85,
                            child: Center(
                              child: Text(
                                'Capacity',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.bottomtextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 28,
                            width: 56,
                            decoration: BoxDecoration(
                                color: Color(0xffE0E0E0),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                controller.capacities[i].toString(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.bottomtextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                controller.edit[i] = !controller.edit[i];
                              });
                            },
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  color: Color(0xffFFD000).withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: Icon(
                                  FontAwesomeIcons.pen,
                                  color: Color(0xffF5BF00),
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (controller.tables.length > 0)
                                setState(() {
                                  controller.tables.removeLast();
                                  controller.capacities.removeLast();
                                  controller.edit.removeLast();
                                  add = !add;
                                });
                            },
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  color: Color(0xffFFE2E2),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: Icon(
                                  Icons.delete_forever,
                                  color: Color(0xffEB6424),
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    replacement: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 52,
                            width: 96,
                            decoration: BoxDecoration(
                                color: Color(0xffE2F5F4),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Table ${controller.tables[i]}',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.bottomtextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Container(
                            height: 52,
                            width: 85,
                            child: Center(
                              child: Text(
                                'Select Table Capacity',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: MyTheme.bottomtextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          Container(
                            height: 28,
                            width: 56,
                            decoration: BoxDecoration(
                                color: Color(0xffE2F5F4),
                                borderRadius: BorderRadius.circular(5)),
                            child: DropdownButtonFormField<int>(
                              isExpanded: true,
                              icon: Padding(
                                padding: const EdgeInsets.only(
                                  right: 10,
                                ),
                                child: FaIcon(
                                  FontAwesomeIcons.caretDown,
                                  color: Color(0xff6E6D7A),
                                  size: 14.87,
                                ),
                              ),
                              value: controller.capacities[i] == 0
                                  ? null
                                  : controller.capacities[i],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                hintText: '0',
                                contentPadding: EdgeInsets.only(
                                  left: 14,
                                ),
                                hintStyle: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  color: MyTheme.bottomtextColor,
                                ),
                              ),
                              items: List.generate(50, (index) => index + 1)
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
                                setState(() {
                                  controller.capacities[i] = newValue!;
                                });
                              },
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              setState(() {
                                controller.edit[i] = !controller.edit[i];
                              });
                            },
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: Icon(
                                  Icons.check_circle_outline_outlined,
                                  color: MyTheme.borderchangeColor,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              setState(() {
                                controller.edit[i] = !controller.edit[i];
                              });
                            },
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.timesCircle,
                                  color: MyTheme.closeiconColor,
                                  size: 21,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      controller.tables.add(controller.tables.length + 1);
                      controller.capacities.add(0);
                      controller.edit.add(false);
                      add = !add;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(188, 202, 224, 0.4),
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            spreadRadius: 0,
                          )
                        ]),
                    margin: EdgeInsets.all(7),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: DottedBorder(
                        child: Center(
                          child: Container(
                            height: 44,
                            // width: 160,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_circle_outline_sharp,
                                    color: Color(0xff393E46),
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Add",
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff6E6D7A),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        borderType: BorderType.RRect,
                        radius: Radius.circular(6),
                        dashPattern: [10, 5, 10, 5, 10, 5],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
