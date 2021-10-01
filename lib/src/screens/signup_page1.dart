import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readyplates_restaurants/utils/utils.dart';

class SignupPage1 extends StatelessWidget {
  const SignupPage1({Key? key}) : super(key: key);

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
            onPressed: () {}),
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
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                width: 343,
                height: 698.11,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Restaurant Name *',
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
                      width: 341,
                      height: 45,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xffE0E0E0)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(6.0),
                            ),
                          ),
                          hintText: 'Male',
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
                    Text(
                      'Owner Name *',
                      style: TextStyle(
                        fontSize: 13,
                        letterSpacing: -0.229412,
                        color: Color(0xff2F2E41),
                      ),
                    ),
                    Container(
                      width: 341,
                      height: 45,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xffE0E0E0)),
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
                      width: 341,
                      height: 45,
                      child: TextFormField(
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
                      width: 341,
                      height: 45,
                      child: TextFormField(
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
                    Text(
                      'Owner Mobile Number *',
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
                      width: 341,
                      height: 45,
                      child: TextFormField(
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
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(6),
                                topRight: Radius.circular(6),
                                topLeft: Radius.circular(0),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 14, right: 36.5),
                              child: Text(
                                'Verify',
                                style: TextStyle(
                                  fontSize: 15,
                                  letterSpacing: -0.264706,
                                  color: Color(0xffEB4132).withOpacity(0.7),
                                ),
                              ),
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
                    Text(
                      'Restaurant City *',
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
                      width: 341,
                      height: 45,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xffE0E0E0)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(6.0),
                            ),
                          ),
                          hintText: 'Select City',
                          suffixIcon: IconButton(
                              iconSize: 14.83,
                              icon: FaIcon(
                                FontAwesomeIcons.chevronDown,
                                color: Color(0xff000000),
                              ),
                              onPressed: () {}),
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
                    Text(
                      'Restaurant Point of Contact (POC)*',
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
                      width: 341,
                      height: 45,
                      child: TextFormField(
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
                    Text(
                      'Restaurant POC Mobile Number *',
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
                      width: 341,
                      height: 45,
                      child: TextFormField(
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
                      onTap: () {
                        Navigator.pushNamed(context, Routes.signup2Route);
                      },
                      child: Container(
                        width: 343,
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
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
