import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readyplates_restaurants/utils/utils.dart';

class OnboardingPage4 extends StatefulWidget {
  const OnboardingPage4({Key? key}) : super(key: key);

  @override
  State<OnboardingPage4> createState() => _OnboardingPage4State();
}

class _OnboardingPage4State extends State<OnboardingPage4> {
  List<String> selectCategory = [
    'Burgers',
    'Pan-Asian',
    'Continental',
    'Malay',
    'Seafood',
    'South Indian',
    'Pizza',
    'Arab',
    'Fast Food',
    'Korean',
    'Barbeque',
    'North Indian',
    'Chinese',
    'Italian',
    'Japanese',
    'Indonesian',
    'Vegan',
    'Pan-Indian',
  ];

  List<String> chooseCategory = [];
  List<String> selectDays = [
    'Monday',
    'Thursday',
    'Sunday',
    'Tuesday',
    'Friday',
    'Wednesday',
    'Saturday',
  ];
  List<String> chooseDays = [];
  bool isChecked = false;
  bool isDays = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 44,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              iconSize: 14.83,
              icon: FaIcon(
                FontAwesomeIcons.chevronLeft,
                color: Color(0xff000000),
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.onboarding3Route);
              }),
          centerTitle: true,
          title: Text(
            'Partner Onboarding',
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Inter',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.226667,
              color: Color(0xff393E46),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 29,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Type of Establishment',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.229412,
                        color: Color(0xff2F2E41),
                      ),
                      children: [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Inter',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.229412,
                            color: Color(0xffEB4132),
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  // width: 341,
                  height: 45,
                  child: DropdownButtonFormField(
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
                      hintText: 'Dineout only / Dineout & Delivery Both',
                      contentPadding: EdgeInsets.only(
                        left: 14,
                        top: 14,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.264706,
                        color: Color(0xff979797).withOpacity(0.7),
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                          child: Text("Select Type of Establishment"),
                          value: ""),
                      DropdownMenuItem(
                          child: Text("Dineout only"), value: "Dineout only"),
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        // rescity = newValue.toString();

                        print(newValue);
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 29,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Type of Cuisines',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.229412,
                      color: Color(0xff2F2E41),
                    ),
                    children: [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.229412,
                          color: Color(0xffEB4132),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.05,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        ...selectCategory
                            .sublist(0, 6)
                            .map((category) => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(
                                            color: Color(0xffE0E0E0),
                                            width: 1,
                                            style: BorderStyle.solid,
                                          )),
                                      value: chooseCategory.contains(category),
                                      onChanged: (value) {
                                        if (chooseCategory.contains(category)) {
                                          chooseCategory.remove(category);
                                        } else {
                                          chooseCategory.add(category);
                                        }
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 85,
                                      child: Text(
                                        category,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          letterSpacing: -0.264706,
                                          color: Color(0xff2F2E41)
                                              .withOpacity(0.7),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                            .toList(),
                      ],
                    ),
                    Column(
                      children: [
                        ...selectCategory
                            .sublist(6, 12)
                            .map((category) => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(
                                            color: Color(0xffE0E0E0),
                                            width: 1,
                                            style: BorderStyle.solid,
                                          )),
                                      value: chooseCategory.contains(category),
                                      onChanged: (value) {
                                        if (chooseCategory.contains(category)) {
                                          chooseCategory.remove(category);
                                        } else {
                                          chooseCategory.add(category);
                                        }
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 85,
                                      child: Text(
                                        category,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          letterSpacing: -0.264706,
                                          color: Color(0xff2F2E41)
                                              .withOpacity(0.7),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                            .toList(),
                      ],
                    ),
                    Column(
                      children: [
                        ...selectCategory
                            .sublist(12, 18)
                            .map((category) => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(
                                            color: Color(0xffE0E0E0),
                                            width: 1,
                                            style: BorderStyle.solid,
                                          )),
                                      value: chooseCategory.contains(category),
                                      onChanged: (value) {
                                        if (chooseCategory.contains(category)) {
                                          chooseCategory.remove(category);
                                        } else {
                                          chooseCategory.add(category);
                                        }
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 85,
                                      child: Text(
                                        category,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          letterSpacing: -0.264706,
                                          color: Color(0xff2F2E41)
                                              .withOpacity(0.7),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                            .toList(),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 9.95,
                ),
                Text(
                  '* Select 2 cusinies which constitute majority of your menu',
                  style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    letterSpacing: -0.229412,
                    color: Color(0xffEB4132),
                  ),
                ),
                SizedBox(
                  height: 29,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Restaurant Operational Hours',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.229412,
                      color: Color(0xff2F2E41),
                    ),
                    children: [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.229412,
                          color: Color(0xffEB4132),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 175,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            border: Border.all(
                              width: 1,
                              color: Color(0xffE0E0E0),
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  '10:00',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.264706,
                                    color: Color(0xff979797).withOpacity(0.7),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 13,
                                      child: IconButton(
                                          iconSize: 12,
                                          icon: FaIcon(
                                            FontAwesomeIcons.chevronUp,
                                            color: Color(0xff6E6D7A),
                                          ),
                                          onPressed: () {}),
                                    ),
                                    Container(
                                      height: 13,
                                      child: IconButton(
                                          iconSize: 12,
                                          icon: FaIcon(
                                            FontAwesomeIcons.chevronDown,
                                            color: Color(0xff6E6D7A),
                                          ),
                                          onPressed: () {}),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   width: 6,
                              // ),
                              Container(
                                height: 35,
                                width: 0,
                                decoration: BoxDecoration(
                                  color: Color(0xffE0E0E0),
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xffE0E0E0),
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Container(
                                height: 19,
                                child: Text(
                                  'AM',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.264706,
                                    color: Color(0xff979797).withOpacity(0.7),
                                  ),
                                ),
                              ),
                              IconButton(
                                  iconSize: 12,
                                  padding: EdgeInsets.only(bottom: 4, top: 4),
                                  icon: FaIcon(
                                    FontAwesomeIcons.chevronDown,
                                    color: Color(0xff6E6D7A),
                                  ),
                                  onPressed: () {}),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Select start time (hh:mm AM/PM)',
                          style: TextStyle(
                            fontSize: 9,
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            letterSpacing: -0.229412,
                            color: Color(0xff6E6D7A),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 175,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            border: Border.all(
                              width: 1,
                              color: Color(0xffE0E0E0),
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  '10:00',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.264706,
                                    color: Color(0xff979797).withOpacity(0.7),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 13,
                                      child: IconButton(
                                          iconSize: 12,
                                          icon: FaIcon(
                                            FontAwesomeIcons.chevronUp,
                                            color: Color(0xff6E6D7A),
                                          ),
                                          onPressed: () {}),
                                    ),
                                    Container(
                                      height: 13,
                                      child: IconButton(
                                          iconSize: 12,
                                          icon: FaIcon(
                                            FontAwesomeIcons.chevronDown,
                                            color: Color(0xff6E6D7A),
                                          ),
                                          onPressed: () {}),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   width: 6,
                              // ),
                              Container(
                                height: 35,
                                width: 0,
                                decoration: BoxDecoration(
                                  color: Color(0xffE0E0E0),
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xffE0E0E0),
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Container(
                                height: 19,
                                child: Text(
                                  'PM',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.264706,
                                    color: Color(0xff979797).withOpacity(0.7),
                                  ),
                                ),
                              ),
                              IconButton(
                                  iconSize: 12,
                                  padding: EdgeInsets.only(bottom: 4, top: 4),
                                  icon: FaIcon(
                                    FontAwesomeIcons.chevronDown,
                                    color: Color(0xff6E6D7A),
                                  ),
                                  onPressed: () {}),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Event end time (hh:mm AM/PM)',
                          style: TextStyle(
                            fontSize: 9,
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            letterSpacing: -0.229412,
                            color: Color(0xff6E6D7A),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 29,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Restaurant Operational Days',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.229412,
                      color: Color(0xff2F2E41),
                    ),
                    children: [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.229412,
                          color: Color(0xffEB4132),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        ...selectDays
                            .sublist(0, 3)
                            .map((days) => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(
                                            color: Color(0xffE0E0E0),
                                            width: 1,
                                            style: BorderStyle.solid,
                                          )),
                                      value: chooseDays.contains(days),
                                      onChanged: (value) {
                                        if (chooseDays.contains(days)) {
                                          chooseDays.remove(days);
                                        } else {
                                          chooseDays.add(days);
                                        }
                                        setState(() {
                                          isDays = value!;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 85,
                                      child: Text(
                                        days,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          letterSpacing: -0.264706,
                                          color: Color(0xff2F2E41)
                                              .withOpacity(0.7),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                            .toList(),
                      ],
                    ),
                    Column(
                      children: [
                        ...selectDays
                            .sublist(3, 5)
                            .map((days) => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(
                                            color: Color(0xffE0E0E0),
                                            width: 1,
                                            style: BorderStyle.solid,
                                          )),
                                      value: chooseDays.contains(days),
                                      onChanged: (value) {
                                        if (chooseDays.contains(days)) {
                                          chooseDays.remove(days);
                                        } else {
                                          chooseDays.add(days);
                                        }
                                        setState(() {
                                          isDays = value!;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 85,
                                      child: Text(
                                        days,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          letterSpacing: -0.264706,
                                          color: Color(0xff2F2E41)
                                              .withOpacity(0.7),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                            .toList(),
                      ],
                    ),
                    Column(
                      children: [
                        ...selectDays
                            .sublist(5, 7)
                            .map((days) => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(
                                            color: Color(0xffE0E0E0),
                                            width: 1,
                                            style: BorderStyle.solid,
                                          )),
                                      value: chooseDays.contains(days),
                                      onChanged: (value) {
                                        if (chooseDays.contains(days)) {
                                          chooseDays.remove(days);
                                        } else {
                                          chooseDays.add(days);
                                        }
                                        setState(() {
                                          isDays = value!;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 85,
                                      child: Text(
                                        days,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          letterSpacing: -0.264706,
                                          color: Color(0xff2F2E41)
                                              .withOpacity(0.7),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                            .toList(),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 29,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.onboarding2Route);
                  },
                  child: Container(
                    // width: 343,
                    height: 40.11,
                    decoration: BoxDecoration(
                      color: Color(0xff7A7E83),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Center(
                      child: Text(
                        'CONTINUE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.28,
                          color: Color(0xffE5E5E5),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.89,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
