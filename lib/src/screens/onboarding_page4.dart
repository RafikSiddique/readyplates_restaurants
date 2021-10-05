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
    'Pizza',
    'Chinese',
    'Pan-Asian',
    'Arab',
    'Italian',
    'Continental',
    'Fast Food',
    'Japanese',
    'Malay',
    'Korean',
    'Indonesian',
    'Seafood',
    'Barbeque',
    'Vegan',
    'South Indian',
    'North Indian',
    'Pan-Indian',
  ];

  List<String> chooseCategory = [];
  bool isChecked = false;
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
                      DropdownMenuItem(child: Text("Select City"), value: ""),
                      DropdownMenuItem(child: Text("Pune"), value: "Pune"),
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
                    ...selectCategory
                        .map((category) => Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.horizontal,
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
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
                                      color: Color(0xff2F2E41).withOpacity(0.7),
                                    ),
                                  ),
                                ),
                              ],
                            ))
                        .toList(),
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
                Container(
                  width: 162,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
