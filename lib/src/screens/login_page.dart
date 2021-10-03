import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readyplates_restaurants/utils/utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/loginimg.png'),
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
                      width: size.width * 0.6,
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
                height: size.height * 0.38,
              ),
              Container(
                width: 375,
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                   
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 37),
                        child: Row(
                          children: [
                            IconButton(
                                iconSize: 14.83,
                                icon: FaIcon(
                                  FontAwesomeIcons.chevronLeft,
                                  color: Color(0xff000000),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context,Routes.signupRoute);
                                }),
                            Spacer(
                              flex: 2,
                            ),
                            Text(
                              'Login',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Inter-Regular',
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                letterSpacing: -0.226667,
                                color: Color(0xff393E46),
                              ),
                            ),
                            Spacer(
                              flex: 3,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Email address',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter-Regular',
                          color: Color(0xff374151),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 341,
                        height: 45,
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Color(0xffBEC5D1)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                            hintText: 'Registered email id',
                            contentPadding: EdgeInsets.only(
                              left: 14,
                              top: 14,
                            ),
                            hintStyle: TextStyle(
                              fontSize: 12,
                              letterSpacing: 0.24,
                              fontFamily: 'Inter-Regular',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff9CA3AF),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter-Regular',
                          color: Color(0xff374151),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 341,
                        height: 45,
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xffBEC5D1)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            hintText: '**** **** ****',
                            contentPadding: EdgeInsets.only(
                              left: 14,
                              top: 14,
                            ),
                            hintStyle: TextStyle(
                              fontSize: 12,
                              letterSpacing: 0.24,
                              fontFamily: 'Inter-Regular',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff9CA3AF),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password ?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 10,
                              fontFamily: 'Inter-Regular',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              letterSpacing: -0.229412,
                              color: Color(0xffEB4132),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.signup1Route);
                        },
                        child: Container(
                          width: 343,
                          height: 54,
                          decoration: BoxDecoration(
                            color: Color(0xff7A7E83),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          child: Center(
                            child: Text(
                              'Verify Password',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Inter-Regular',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffE5E5E5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.signup1Route);
                        },
                        child: Container(
                          width: 343,
                          height: 54,
                          decoration: BoxDecoration(
                            color: Color(0xffF4F4F4),
                            border: Border.all(
                              width: 1,
                              color: Color(0xffB9B9B9),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 26.42,
                                height: 27,
                                child: Image.asset('assets/images/google.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Center(
                                child: Text(
                                  'Sign up with Google',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Inter-Regular',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff222222),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
