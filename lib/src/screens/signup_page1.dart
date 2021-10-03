import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readyplates_restaurants/models/signup.dart';
import 'package:readyplates_restaurants/utils/utils.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';

String rescity = '';

class SignupPage1 extends StatefulWidget {
  //const SignupPage1({Key? key}) : super(key: key);

  @override
  _SignupPage1State createState() => _SignupPage1State();
}

class _SignupPage1State extends State<SignupPage1> {
  final userController = TextEditingController();
  final resNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ownMobileController = TextEditingController();
  var resCityController = TextEditingController();
  final pocController = TextEditingController();
  final pocNumberController = TextEditingController();

  // Signup? users;
// https://readyplates.herokuapp.com/restaurants/s1
// http://192.168.0.197:8000/restaurants/s1
  // Future<Signup?> signup(
  //   String user,
  //   String res_name,
  //   String own_name,
  //   String own_mobile,
  //   String res_city,
  //   String poc,
  //   String poc_number,
  // ) async {
  //   http.Response response;
  //   response = await http.post(
  //     Uri.parse('https://readyplates.herokuapp.com/restaurants/s1'),
  //     body: jsonEncode({
  //       'user': user,
  //       'res_name': res_name,
  //       'own_name': own_name,
  //       'own_mobile': own_mobile,
  //       'res_city': res_city,
  //       'poc': poc,
  //       'poc_number': poc_number,
  //     }),
  //     headers: {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );
  //   if (response.statusCode == 201) {
  //     print('object');
  //     return Signup(
  //         own_mobile: '',
  //         own_name: '',
  //         poc_number: '',
  //         poc: '',
  //         res_city: '',
  //         res_name: '',
  //         user: '');
  //   }
  //   //  else {
  //   //   throw Exception('Failed to create User.');
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
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
              Navigator.pushNamed(context,Routes.loginRoute);
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
                  controller: resNameController,
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
                  controller: firstNameController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    fillColor: Color(0xff00ADB5),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color(0xffE0E0E0).withOpacity(0.5)),
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
              SizedBox(
                height: 5,
              ),
              Container(
                // width: 341,
                height: 45,
                child: TextFormField(
                  controller: lastNameController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                        topRight: Radius.circular(0),
                        topLeft: Radius.circular(0),
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
                  controller: userController,
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
                  controller: ownMobileController,
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
                          left: BorderSide(color: Color(0xffE0E0E0), width: 1),
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
                      rescity = newValue.toString();

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
                  controller: pocController,
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
                  controller: pocNumberController,
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
                onTap: () 
                // async
                 {
                  // String fs = firstNameController.text;
                  // String ls = firstNameController.text;
                  // String own = fs + ' ' + ls;
                  // final String user = '26';
                  // final String res_name = resNameController.text;
                  // final String own_name = own;
                  // final String own_mobile = ownMobileController.text;
                  // final String res_city = rescity;
                  // final String poc = pocController.text;
                  // final String poc_number = pocNumberController.text;
                  // final Signup? u = await signup(user, res_name, own_name,
                  //     own_mobile, res_city, poc, poc_number);
                  // setState(() {
                  //   users = u;
                  // });
                  Navigator.pushNamed(context, Routes.signup2Route);
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
    );
  }
}
