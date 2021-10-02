import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:readyplates_restaurants/utils/utils.dart';

class OpeningScreen extends StatelessWidget {
  const OpeningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 34,
                  left: 42,
                  right: 43,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      child: Image.asset(
                        "assets/images/spoon.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16),
                    Container(
                      // width: 234,
                      height: 39,
                      child: RichText(
                        text: TextSpan(
                            text: 'READY',
                            style: TextStyle(
                              fontSize: 30,
                              letterSpacing: -0.0769231,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(255, 255, 255, 0.9),
                            ),
                            children: [
                              TextSpan(
                                text: ' Plates'.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 30,
                                  letterSpacing: -0.0769231,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(255, 255, 255, 0.9),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    // Container(
                    //   // width: 234,
                    //   height: 39,
                    //   child: Text(
                    //     "READY PLATES",
                    //     style: TextStyle(
                    //       fontSize: 30,
                    //       fontWeight: FontWeight.bold,
                    //       letterSpacing: -0.0769231,
                    //       color: Color.fromRGBO(255, 255, 255, 0.9),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.6,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    // width: 343,
                    height: 54,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.38),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),

                    child: Center(
                      child: Text(
                        'LOGIN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.3,
                          color: Color(0xff222831),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.signup1Route);
                  },
                  child: Container(
                    // width: 343,
                    height: 54,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(34, 40, 49, 0.2),
                      border: Border.all(
                        width: 1.5,
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Center(
                      child: Text(
                        'SIGN UP',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.3,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
