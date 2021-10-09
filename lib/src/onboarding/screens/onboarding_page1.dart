import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/login/auth_controller.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/utils.dart';

class OnboardingPage1 extends StatefulWidget {
  static const id = "/onboarding1";
  //const SignupPage1({Key? key}) : super(key: key);

  @override
  _OnboardingPage1State createState() => _OnboardingPage1State();
}

class _OnboardingPage1State extends State<OnboardingPage1> {
  final controller = Get.find<OnboardingController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                Get.back();
              }),
          centerTitle: true,
          title: Text(
            'Partner Onboarding',
            style: TextStyle(
              fontSize: 17,
              letterSpacing: -0.226667,
              color: Color(0xff393E46),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Restaurant Name',
                        style: TextStyle(
                          fontSize: 13,
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
                      controller: controller.resNameController,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        //Color(0xff00ADB5) Color(0xffE0E0E0)
                        // fillColor: Color(0xff00ADB5),
                        // focusColor: Color(0xff00ADB5),
                        // hoverColor: Color(0xff00ADB5),
                        border: OutlineInputBorder(
                          // borderSide: new BorderSide(color: Colors.teal),
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xffE0E0E0),
                          ),

                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                        ),
                        hintText: 'Snack Shack Fast Food Restaurant',
                        contentPadding: EdgeInsets.only(
                          left: 14,
                          top: 14,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Owner Name',
                        style: TextStyle(
                          fontSize: 13,
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
                  Container(
                    // width: 341,
                    height: 45,
                    child: TextFormField(
                      controller: controller.firstNameController,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        fillColor: Color(0xff00ADB5),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffE0E0E0).withOpacity(0.5)),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                        ),
                        hintText: 'First Name',
                        contentPadding: EdgeInsets.only(
                          left: 14,
                          top: 14,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // width: 341,
                    height: 45,
                    child: TextFormField(
                      controller: controller.lastNameController,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(0),
                            topLeft: Radius.circular(0),
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                          ),
                        ),
                        hintText: 'Last Name',
                        contentPadding: EdgeInsets.only(
                          left: 14,
                          top: 14,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Make sure it matches the name on your government ID',
                    style: TextStyle(
                      fontSize: 9,
                      letterSpacing: -0.229412,
                      color: Color(0xff6E6D7A),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Owner Email ID',
                    style: TextStyle(
                      fontSize: 13,
                      letterSpacing: -0.229412,
                      color: Color(0xff2F2E41),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    // width: 341,
                    height: 45,
                    child: TextFormField(
                      // controller: controller.ownMobileController,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xffE0E0E0)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                        ),
                        hintText: 'username@aol.com',
                        contentPadding: EdgeInsets.only(
                          left: 14,
                          top: 14,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Owner Mobile Number',
                        style: TextStyle(
                          fontSize: 13,
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
                      controller: controller.ownMobileController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xffE0E0E0)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                        ),
                        hintText: '+91 XXXXXXXXXX',
                        suffixIcon: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                  color: Color(0xffE0E0E0), width: 1),
                            ),
                          ),
                          child: TextButton(
                            child: Padding(
                              padding: EdgeInsets.only(right: 20, left: 20),
                              child: Text(
                                'Verify',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                  letterSpacing: -0.264706,
                                  color: Color(0xffEB4132).withOpacity(0.7),
                                ),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 14, top: 14, right: 24),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Will be used to make all future correspondence/communications',
                    style: TextStyle(
                      fontSize: 9,
                      letterSpacing: -0.229412,
                      color: Color(0xff6E6D7A),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Restaurant City',
                        style: TextStyle(
                          fontSize: 13,
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
                    child: DropdownButtonFormField(
                      icon: Padding(
                        padding: const EdgeInsets.only(
                          right: 12.21,
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.chevronDown,
                          color: Color(0xff000000),
                          size: 14.87,
                        ),
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xffE0E0E0)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                        ),
                        hintText: 'Select City',
                        contentPadding: EdgeInsets.only(
                          left: 14,
                          top: 14,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7),
                        ),
                      ),
                      items: [
                        DropdownMenuItem(child: Text("Select City"), value: ""),
                        DropdownMenuItem(child: Text("Pune"), value: "Pune"),
                      ],
                      onChanged: (newValue) {
                        setState(() {
                          controller.rescity = newValue.toString();

                          print(newValue);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Restaurant Point of Contact (POC)',
                        style: TextStyle(
                          fontSize: 13,
                          letterSpacing: -0.229412,
                          color: Color(0xff2F2E41),
                        ),
                        children: [
                          TextSpan(
                            text: '*',
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
                      controller: controller.pocController,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xffE0E0E0)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                        ),
                        hintText: 'Owner/Co-Owner/Manager etc',
                        contentPadding: EdgeInsets.only(
                          left: 14,
                          top: 14,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Restaurant POC Mobile Number',
                        style: TextStyle(
                          fontSize: 13,
                          letterSpacing: -0.229412,
                          color: Color(0xff2F2E41),
                        ),
                        children: [
                          TextSpan(
                            text: '*',
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
                      controller: controller.pocNumberController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xffE0E0E0)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                        ),
                        hintText: '+91 XXXXXXXXXX',
                        contentPadding: EdgeInsets.only(
                          left: 14,
                          top: 14,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap: () async {
                      formKey.currentState!.save();
                      await controller.onboardingapi1();
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
                    height: 7.89,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
