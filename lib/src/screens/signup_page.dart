import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readyplates_restaurants/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();
  // https://readyplates.herokuapp.com/restaurants/register/
// http://192.168.0.197:8000/restaurants/register/
  Future signup(
    String email,
    String password,
    String password2,
  ) async {
    http.Response response;
    print('object');
    response = await http.post(
      Uri.parse('https://readyplates.herokuapp.com/restaurants/register/'),
      body: jsonEncode(
        {
          'email': email,
          'password': password,
          'password2': password2,
        },
      ),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print('object1');
    setState(() {
      if (response.statusCode == 201) {
        return print(response.body);
      } else {
        throw Exception('Failed to create User.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/signupimg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 34,
                ),
                Row(
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
                SizedBox(
                  height: size.height * 0.4,
                ),
                Container(
                  width: size.width,
                  height: 583,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  iconSize: 14.83,
                                  icon: FaIcon(
                                    FontAwesomeIcons.chevronLeft,
                                    color: Color(0xff000000),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Routes.openingscreenRoute);
                                  }),
                              Spacer(),
                              Text(
                                'Sign-up',
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
                              Spacer(),
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
                            fontFamily: 'Inter-Regular',
                            color: Color(0xff374151),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: size.width,
                          height: 45,
                          child: TextFormField(
                            controller: emailController,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0xffE0E0E0).withOpacity(0.5)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              ),
                              hintText: 'Eg aatef.sayyed@fladdra.com',
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
                          width: size.width,
                          height: 45,
                          child: TextFormField(
                            controller: passwordController,
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
                        Text(
                          'Atleast 8 characters (Caps, Small & Special Characters)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 9,
                            fontFamily: 'Inter-Regular',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            letterSpacing: -0.229412,
                            color: Color(0xff6E6D7A),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Re-confirm Password',
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
                          width: size.width,
                          height: 45,
                          child: TextFormField(
                            controller: password2Controller,
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
                        Text(
                          'Please re-enter password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 9,
                            fontFamily: 'Inter-Regular',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            letterSpacing: -0.229412,
                            color: Color(0xff6E6D7A),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () async {
                            final String email = emailController.text;
                            final String password = passwordController.text;
                            final String password2 = password2Controller.text;

                            await signup(email, password, password2);

                            Navigator.pushNamed(context, Routes.loginRoute);
                          },
                          child: Container(
                            width: size.width,
                            height: 54,
                            decoration: BoxDecoration(
                              color: Color(0xff7A7E83),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
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
                            Navigator.pushNamed(context, Routes.loginRoute);
                          },
                          child: Container(
                            width: size.width,
                            height: 54,
                            decoration: BoxDecoration(
                              color: Color(0xffF4F4F4),
                              border: Border.all(
                                width: 1,
                                color: Color(0xffB9B9B9),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 26.42,
                                  height: 27,
                                  child:
                                      Image.asset('assets/images/google.png'),
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
                      ],
                    ),
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
