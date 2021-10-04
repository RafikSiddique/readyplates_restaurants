import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:readyplates_restaurants/utils/utils.dart';

class OpeningScreen extends StatelessWidget {
  const OpeningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: Container(
          height: size.height,
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
                  padding: const EdgeInsets.only(left: 42, right: 43, top: 34),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // width: 40,
                        height: 40,
                        child: Image.asset(
                          "assets/images/spoon.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        // width: size.width * 0.6,
                        height: 39,
                        child: RichText(
                          text: TextSpan(
                              text: 'READY',
                              style: TextStyle(
                                fontSize: 30,
                                letterSpacing: -0.0769231,
                                fontFamily: 'Montserrat-Bold',
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(255, 255, 255, 0.9),
                              ),
                              children: [
                                TextSpan(
                                  text: ' Plates'.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Montserrat',
                                    letterSpacing: -0.0769231,
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromRGBO(255, 255, 255, 0.9),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.7,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.loginRoute);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        child: Container(
                          width: size.width,
                          height: 54,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.38),
                            // borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          child: Center(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 17,
                                sigmaY: 17,
                              ),
                              child: Text(
                                'LOGIN',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Inter-Bold',
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
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.signupRoute);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(34, 40, 49, 0.2),
                          border: Border.all(
                            width: 1.5,
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          child: Container(
                            width: size.width,
                            height: 54,
                            child: Center(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 15,
                                  sigmaY: 15,
                                ),
                                child: Text(
                                  'SIGN UP',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Inter-Bold',
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
      ),
    );
  }
}
