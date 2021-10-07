import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readyplates_restaurants/models/onboarding3.dart';
import 'package:readyplates_restaurants/src/screens/login_page.dart';
import 'package:readyplates_restaurants/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class OnboardingPage3 extends StatefulWidget {
  const OnboardingPage3({Key? key}) : super(key: key);

  @override
  State<OnboardingPage3> createState() => _OnboardingPage3State();
}

class _OnboardingPage3State extends State<OnboardingPage3> {
  final gstController = TextEditingController();
  final resgstController = TextEditingController();
  final fssaistatusController = TextEditingController();
  final fssaidateController = TextEditingController();
  final uploadkycController = TextEditingController();
  final uploadgstController = TextEditingController();
  final uploadfssaiController = TextEditingController();
  Onboarding3? user3;
  //https://readyplates.herokuapp.com/restaurants/s3/
//http://192.168.0.194:5000/restaurants/s3/
  Future<Onboarding3?> onbordingapi3(
    String user,
    String gstin_present,
    String gstin_num,
    String fssai_status,
    String fssai_expiry,
  ) async {
    http.Response response;
    response = await http.post(
      Uri.parse('https://readyplates.herokuapp.com/restaurants/s3/'),
      body: jsonEncode({
        'user': user,
        'gstin_present': gstin_present,
        'gstin_num': gstin_num,
        'fssai_status': fssai_status,
        'fssai_expiry': fssai_expiry,
      }),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 201) {
      print('object');
      print(response.body);
      print('end!!!!!!!');
    } else {
      throw Exception('Failed to create User.');
    }
  }

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
                Navigator.pushNamed(context, Routes.onboarding2Route);
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: RichText(
                  text: TextSpan(
                      text: 'GSTIN Present ',
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
              ),
              SizedBox(
                height: 5,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                margin: EdgeInsets.only(
                  left: 17,
                  right: 17,
                ),
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
                    hintText: 'Yes/No/Applied/Acknowledgement Received',
                    contentPadding: EdgeInsets.only(
                      left: 14,
                      top: 14,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.264706,
                      color: Color(0x979797).withOpacity(0.7),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Text("Restaurant GSTIN",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.229412,
                      color: Color(0xff2F2E41),
                    )),
              ),
              SizedBox(
                height: 5,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                margin: EdgeInsets.only(
                  left: 17,
                  right: 17,
                ),
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
                    hintText: 'Eg.22AABCU9603R1ZX',
                    contentPadding: EdgeInsets.only(
                      left: 14,
                      top: 14,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.264706,
                      color: Color(0x979797).withOpacity(0.7),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Text("FSSAI License Status",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.229412,
                      color: Color(0xff2F2E41),
                    )),
              ),

              SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                margin: EdgeInsets.only(
                  left: 17,
                  right: 17,
                ),
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
                    hintText: 'Yes/No/Applied/Acknowledgement Received',
                    contentPadding: EdgeInsets.only(
                      left: 14,
                      top: 14,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.264706,
                      color: Color(0x979797).withOpacity(0.7),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Text("FSSAI Expiry Date",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.229412,
                      color: Color(0xff2F2E41),
                    )),
              ),

              SizedBox(
                height: 5,
              ),
              Container(
                height: 45.68,
                margin: EdgeInsets.only(
                  left: 17,
                  right: 17,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(0xffE0E0E0),
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.5),
                      child: Text(
                        'mm/dd/yyyy',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.264706,
                          color: Color(0xff979797).withOpacity(0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 45,
                        decoration: BoxDecoration(
                          color: Color(0xffEFEFEF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(6.0),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(6.0),
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 15,
                            height: 15,
                            child: Image(
                              image: AssetImage(
                                'assets/images/calender.jpeg',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //

              SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: RichText(
                  text: TextSpan(
                      text:
                          'Upload KYC (Aadhar Card/ Passport/Driving License/ \nVoter ID',
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
                height: 45.68,
                margin: EdgeInsets.only(
                  left: 17,
                  right: 17,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(0xffE0E0E0),
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.5),
                      child: Text(
                        'Please upload [ “png”, “jpg”, “jpeg”] images',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.264706,
                          color: Color(0xff979797).withOpacity(0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 45,
                        decoration: BoxDecoration(
                          color: Color(0xffEFEFEF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(6.0),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(6.0),
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image(
                              image: AssetImage(
                                'assets/images/upload.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

//

              SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Text("Upload GSTIN Certificate",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.229412,
                      color: Color(0xff2F2E41),
                    )),
              ),
              SizedBox(
                height: 5,
              ),

              SizedBox(
                height: 5.08,
              ),
              Container(
                height: 45.68,
                margin: EdgeInsets.only(
                  left: 17,
                  right: 17,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(0xffE0E0E0),
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.5),
                      child: Text(
                        'Please upload [ “png”, “jpg”, “jpeg”, “pdf”] files',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.264706,
                          color: Color(0xff979797).withOpacity(0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 45,
                        decoration: BoxDecoration(
                          color: Color(0xffEFEFEF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(6.0),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(6.0),
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image(
                              image: AssetImage(
                                'assets/images/upload.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //
              SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Text("Upload FSSAI Certificate",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.229412,
                      color: Color(0xff2F2E41),
                    )),
              ),

              SizedBox(
                height: 5.08,
              ),
              Container(
                height: 45.68,
                margin: EdgeInsets.only(
                  left: 17,
                  right: 17,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(0xffE0E0E0),
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.5),
                      child: Text(
                        'Please upload [ “png”, “jpg”, “jpeg”, “pdf”] files',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.264706,
                          color: Color(0xff979797).withOpacity(0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 45,
                        decoration: BoxDecoration(
                          color: Color(0xffEFEFEF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(6.0),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(6.0),
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 20,
                            height: 20,
                            child: Image(
                              image: AssetImage(
                                'assets/images/upload.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 15),
                child: SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff7A7E83),
                        side: BorderSide(
                            width: 1.5,
                            color: Color.fromRGBO(255, 255, 255, 0.5)),
                      ),
                      onPressed: () async {
                        final String user = id;
                        final String gstin_present = gstController.text;
                        final String gstin_num = resgstController.text;
                        final String fssai_status = fssaistatusController.text;
                        final String fssai_expiry = fssaidateController.text;
                        final Onboarding3? u3 = await onbordingapi3(
                            user,
                            gstin_present,
                            gstin_num,
                            fssai_status,
                            fssai_expiry);
                        setState(() {
                          user3 = u3;
                        });

                        // Navigator.pushNamed(context, Routes.onboarding4Route);
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
    );
  }
}
