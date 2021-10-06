import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readyplates_restaurants/utils/utils.dart';

class OnboardingPage5 extends StatefulWidget {
  const OnboardingPage5({Key? key}) : super(key: key);

  @override
  State<OnboardingPage5> createState() => _OnboardingPage5State();
}

class _OnboardingPage5State extends State<OnboardingPage5> {
  @override
  Widget build(BuildContext context) {
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
                Navigator.pushNamed(context, Routes.onboarding5Route);
              }),
          centerTitle: true,
          title: Text(
            'Payment Setup',
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
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                    text: 'Legal Entity Account Number',
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
                          fontSize: 16,
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
                child: TextFormField(
                  cursorColor: Color(0xff00ADB5),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xffE0E0E0),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                    hintText: '511122266514782',
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
                      color: Color(0x979797).withOpacity(0.7),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3.02,
              ),
              Text(
                'Make sure it matches the name on your government ID',
                style: TextStyle(
                  fontSize: 9,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  letterSpacing: -0.229412,
                  color: Color(0xff6E6D7A),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              RichText(
                text: TextSpan(
                    text: 'Re-Enter Account Number',
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
                          fontSize: 16,
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
                child: TextFormField(
                  cursorColor: Color(0xff00ADB5),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xffE0E0E0),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                    hintText: '511122266514782',
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
                      color: Color(0x979797).withOpacity(0.7),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3.02,
              ),
              Text(
                'Both fields should match',
                style: TextStyle(
                  fontSize: 9,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  letterSpacing: -0.229412,
                  color: Color(0xff6E6D7A),
                ),
              ),
              SizedBox(
                height: 18,
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
            ],
          ),
        ),
      ),
    );
  }
}
