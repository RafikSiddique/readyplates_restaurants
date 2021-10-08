import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readyplates_restaurants/utils/utils.dart';

class OnboardingPage8 extends StatefulWidget {
  const OnboardingPage8({Key? key}) : super(key: key);

  @override
  _OnboardingPage8State createState() => _OnboardingPage8State();
}

class _OnboardingPage8State extends State<OnboardingPage8> {
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
                Navigator.pushNamed(context, Routes.onboarding6Route);
              }),
          centerTitle: true,
          title: Text(
            'Restaurant Bio',
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
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 14,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Restaurant Ambience Images',
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
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: Container(
                    height: 228,
                    // width: 343,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      // color: Color.fromRGBO(34, 40, 49, 0.2),
                      border: Border.all(
                        width: 1,
                        color: Color(0xffE0E0E0),
                      ),
                      // borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Image(
                      image:
                          AssetImage('assets/images/Restaurant ambience.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          child: Container(
                            height: 49,
                            // width: 74,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.5,
                                color: Color(0xffE0E0E0),
                              ),
                            ),
                            child: Image(
                              image: AssetImage('assets/images/ambience1.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          'Ambience 1',
                          style: TextStyle(
                            fontSize: 9,
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            letterSpacing: -0.229412,
                            color: Color(0xff6E6D7A),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          child: Container(
                            height: 49,
                            // width: 74,
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              border: Border.all(
                                width: 0.5,
                                color: Color(0xffE0E0E0),
                              ),
                            ),
                            child: Image(
                              image: AssetImage('assets/images/ambience2.png'),
                            ),
                          ),
                        ),
                        Text(
                          'Ambience 2',
                          style: TextStyle(
                            fontSize: 9,
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            letterSpacing: -0.229412,
                            color: Color(0xff6E6D7A),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          child: Container(
                            height: 49,
                            // width: 74,
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              border: Border.all(
                                width: 0.5,
                                color: Color(0xffE0E0E0),
                              ),
                            ),
                            child: Image(
                              image: AssetImage('assets/images/ambience1.png'),
                            ),
                          ),
                        ),
                        Text(
                          'Ambience 3',
                          style: TextStyle(
                            fontSize: 9,
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            letterSpacing: -0.229412,
                            color: Color(0xff6E6D7A),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          child: Container(
                            height: 49,
                            // width: 74,
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              border: Border.all(
                                width: 0.5,
                                color: Color(0xffE0E0E0),
                              ),
                            ),
                            child: Image(
                              image: AssetImage('assets/images/ambience4.png'),
                            ),
                          ),
                        ),
                        Text(
                          'Ambience 4',
                          style: TextStyle(
                            fontSize: 9,
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            letterSpacing: -0.229412,
                            color: Color(0xff6E6D7A),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 11),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Color(0xffE0E0E0),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        // child: Icon(
                        //   Icons.fiber_manual_record,
                        //   color: Color(0xffE0E0E0),
                        //   size: 10,
                        // ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Color(0xffE0E0E0),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        // child: Icon(
                        //   Icons.fiber_manual_record,
                        //   color: Color(0xffE0E0E0),
                        //   size: 10,
                        // ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Color(0xff00ADB5),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        // child: Icon(
                        //   Icons.fiber_manual_record,
                        //   color: Color(0xffE0E0E0),
                        //   size: 10,
                        // ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0xffE0E0E0),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        // child: Icon(
                        //   Icons.fiber_manual_record,
                        //   color: Color(0xffE0E0E0),
                        //   size: 10,
                        // ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 164,
                          height: 138,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color(0xffE0E0E0),
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 38,
                                height: 38,
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/imglogo.png',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 36,
                              ),
                              Container(
                                height: 27,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xffE0E0E0),
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(6),
                                      bottomRight: Radius.circular(6)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12.5),
                                      child: Text(
                                        'Ambience 1',
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontFamily: 'Poppins',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          letterSpacing: -0.229412,
                                          color: Color(0xff6E6D7A),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        // final result = await FilePicker.platform
                                        //     .pickFiles(allowMultiple: true);
                                        // if (result == null) return;
                                        // final file = result.files.first;
                                        // // openFile(file);

                                        // print('Name: ${file.name}');
                                        // print('Bytes: ${file.bytes}');
                                        // print('Size: ${file.size}');
                                        // print('Extension: ${file.extension}');
                                        // print('Path: ${file.path}');
                                        // final newFile = await saveFilePermanently(file);
                                        // print('From Path: ${file.path!}');
                                        // print('To Path: ${newFile.path}');
                                      },
                                      child: Container(
                                        width: 27,
                                        height: 27,
                                        decoration: BoxDecoration(
                                          color: Color(0xffEFEFEF),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(0),
                                            topRight: Radius.circular(0),
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(6.0),
                                          ),
                                        ),
                                        child: Center(
                                          child: Container(
                                            width: 16,
                                            height: 16,
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
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 164,
                          height: 138,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color(0xffE0E0E0),
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 38,
                                height: 38,
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/imglogo.png',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 36,
                              ),
                              Container(
                                height: 27,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xffE0E0E0),
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(6),
                                      bottomRight: Radius.circular(6)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12.5),
                                      child: Text(
                                        'Ambience 3',
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontFamily: 'Poppins',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          letterSpacing: -0.229412,
                                          color: Color(0xff6E6D7A),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        // final result = await FilePicker.platform
                                        //     .pickFiles(allowMultiple: true);
                                        // if (result == null) return;
                                        // final file = result.files.first;
                                        // // openFile(file);

                                        // print('Name: ${file.name}');
                                        // print('Bytes: ${file.bytes}');
                                        // print('Size: ${file.size}');
                                        // print('Extension: ${file.extension}');
                                        // print('Path: ${file.path}');
                                        // final newFile = await saveFilePermanently(file);
                                        // print('From Path: ${file.path!}');
                                        // print('To Path: ${newFile.path}');
                                      },
                                      child: Container(
                                        width: 27,
                                        height: 27,
                                        decoration: BoxDecoration(
                                          color: Color(0xffEFEFEF),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(0),
                                            topRight: Radius.circular(0),
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(6.0),
                                          ),
                                        ),
                                        child: Center(
                                          child: Container(
                                            width: 16,
                                            height: 16,
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
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 164,
                          height: 138,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color(0xffE0E0E0),
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 38,
                                height: 38,
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/imglogo.png',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 36,
                              ),
                              Container(
                                height: 27,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xffE0E0E0),
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(6),
                                      bottomRight: Radius.circular(6)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12.5),
                                      child: Text(
                                        'Ambience 2',
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontFamily: 'Poppins',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          letterSpacing: -0.229412,
                                          color: Color(0xff6E6D7A),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        // final result = await FilePicker.platform
                                        //     .pickFiles(allowMultiple: true);
                                        // if (result == null) return;
                                        // final file = result.files.first;
                                        // // openFile(file);

                                        // print('Name: ${file.name}');
                                        // print('Bytes: ${file.bytes}');
                                        // print('Size: ${file.size}');
                                        // print('Extension: ${file.extension}');
                                        // print('Path: ${file.path}');
                                        // final newFile = await saveFilePermanently(file);
                                        // print('From Path: ${file.path!}');
                                        // print('To Path: ${newFile.path}');
                                      },
                                      child: Container(
                                        width: 27,
                                        height: 27,
                                        decoration: BoxDecoration(
                                          color: Color(0xffEFEFEF),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(0),
                                            topRight: Radius.circular(0),
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(6.0),
                                          ),
                                        ),
                                        child: Center(
                                          child: Container(
                                            width: 16,
                                            height: 16,
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
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 164,
                          height: 138,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color(0xffE0E0E0),
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 38,
                                height: 38,
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/imglogo.png',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 36,
                              ),
                              Container(
                                height: 27,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xffE0E0E0),
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(6),
                                      bottomRight: Radius.circular(6)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12.5),
                                      child: Text(
                                        'Ambience 4',
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontFamily: 'Poppins',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          letterSpacing: -0.229412,
                                          color: Color(0xff6E6D7A),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        // final result = await FilePicker.platform
                                        //     .pickFiles(allowMultiple: true);
                                        // if (result == null) return;
                                        // final file = result.files.first;
                                        // // openFile(file);

                                        // print('Name: ${file.name}');
                                        // print('Bytes: ${file.bytes}');
                                        // print('Size: ${file.size}');
                                        // print('Extension: ${file.extension}');
                                        // print('Path: ${file.path}');
                                        // final newFile = await saveFilePermanently(file);
                                        // print('From Path: ${file.path!}');
                                        // print('To Path: ${newFile.path}');
                                      },
                                      child: Container(
                                        width: 27,
                                        height: 27,
                                        decoration: BoxDecoration(
                                          color: Color(0xffEFEFEF),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(0),
                                            topRight: Radius.circular(0),
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(6.0),
                                          ),
                                        ),
                                        child: Center(
                                          child: Container(
                                            width: 16,
                                            height: 16,
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
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 11,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.onboarding2Route);
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
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.28,
                          color: Color(0xffE5E5E5),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.89,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
