import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/models/onboarding2.dart';
import 'package:readyplates_restaurants/src/onboarding/controller/auth_controller.dart';
import 'package:readyplates_restaurants/src/screens/login_page.dart';
import 'package:readyplates_restaurants/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class OnboardingPage2 extends StatefulWidget {
  static const id = "/onboarding2";
  const OnboardingPage2({Key? key}) : super(key: key);

  @override
  State<OnboardingPage2> createState() => _OnboardingPage2State();
}

class _OnboardingPage2State extends State<OnboardingPage2> {
  final controller = Get.find<AuthController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final address1Controller = TextEditingController();
//   final address2Controller = TextEditingController();
//   final nearbylandnarkController = TextEditingController();
//   final postalcodeController = TextEditingController();
//   final latitudeController = TextEditingController();
//   final longitudeController = TextEditingController();
//   Onboarding2? user2;
//   //https://readyplates.herokuapp.com/restaurants/s2/
// //http://192.168.0.194:5000/restaurants/s2/
//   Future<Onboarding2?> onbordingapi2(
//     String user,
//     String address,
//     String postal_code,
//     String latitude,
//     String longitude,
//   ) async {
//     http.Response response;
//     response = await http.post(
//       Uri.parse('https://readyplates.herokuapp.com/restaurants/s2/'),
//       body: jsonEncode({
//         'user': user,
//         'address': address,
//         'postal_code': postal_code,
//         'latitude': latitude,
//         'longitude': longitude,
//       }),
//       headers: {
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );
//     if (response.statusCode == 201) {
//       print('object');
//       print(response.body);
//     } else {
//       throw Exception('Failed to create User.');
//     }
//   }

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
                Navigator.pushNamed(context, Routes.onboarding1Route);
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
        //backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: RichText(
                    text: TextSpan(
                        text: 'Restaurant Address',
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
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(left: 17, right: 15),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: controller.address1Controller,
                    decoration: InputDecoration(
                      hintText: "Address Line 1",
                      hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7)),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, color: Color(0xffE0E0E0)),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(left: 17, right: 15),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: controller.address2Controller,
                    decoration: InputDecoration(
                      hintText: "Address Line 2",
                      hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7)),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Color(0xffE0E0E0)),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(left: 17, right: 15),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: controller.nearbylandnarkController,
                    decoration: InputDecoration(
                      hintText: "Nearby Landmark",
                      hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7)),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, color: Color(0xffE0E0E0)),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(6),
                          bottomRight: Radius.circular(6),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text(
                      "Make sure it matches the name on your government ID",
                      style: TextStyle(
                        fontSize: 9,
                        color: Color(0xff2F2E41),
                      )),
                ),
                SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: RichText(
                    text: TextSpan(
                        text: 'Postal Code',
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
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(
                    left: 17,
                    right: 17,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: controller.postalcodeController,
                    decoration: InputDecoration(
                      hintText: "xxxxxxx",
                      hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7)),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: RichText(
                    text: TextSpan(
                        text: 'Locate Restaurant on Map ',
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
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 17,
                    right: 17,
                  ),
                  height: 159,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/map.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text("Please locate restaurant on Map",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff2F2E41),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text("Latitude",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff2F2E41),
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(
                    left: 17,
                    right: 17,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: controller.latitudeController,
                    decoration: InputDecoration(
                      fillColor: Color(0xFFE6E6E6),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text("Longitude",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff2F2E41),
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(
                    left: 17,
                    right: 17,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: controller.longitudeController,
                    decoration: InputDecoration(
                      fillColor: Color(0xFFE6E6E6),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 17, right: 15),
                  child: SizedBox(
                    height: 54,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff7A7E83),
                          side: BorderSide(
                              width: 1.5,
                              color: Color.fromRGBO(255, 255, 255, 0.5)),
                        ),
                        onPressed: () async {
                          formKey.currentState!.save();
                          await controller.onboardingapi2();
                          // String a1 = address1Controller.text;
                          // String a2 = address2Controller.text;
                          // String n = nearbylandnarkController.text;
                          // String addresses = a1 + ' ' + a2 + ' ' + n;

                          // final String user = id;
                          // final String address = addresses;
                          // final String postal_code = postalcodeController.text;
                          // final String latitude = latitudeController.text;
                          // final String longitude = longitudeController.text;
                          // final Onboarding2? u1 = await onbordingapi2(
                          //     user, address, postal_code, latitude, longitude);
                          // setState(() {
                          //   user2 = u1;
                          // });
                          Navigator.pushNamed(context, Routes.onboarding3Route);
                        },
                        child: Text('CONTINUE',
                            style: TextStyle(
                              color: Color(0xffE5E5E5),
                              fontSize: 17,
                            ))),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
