import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readyplates_restaurants/widgets/dropdowncategory.dart';
import 'package:readyplates_restaurants/widgets/dropdowndiettype.dart';
import 'package:readyplates_restaurants/widgets/dropdownstandard.dart';

class OnbordingPage13 extends StatelessWidget {
  const OnbordingPage13({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                //Navigator.pushNamed(context, Routes.onboarding4Route);
              }),
          centerTitle: true,
          title: Text(
            'Add Food Item',
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: RichText(
                  text: TextSpan(
                      text: 'Add Food Item',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.normal,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 164,
                    height: 164,
                    child: Image(
                      image: AssetImage(
                        'assets/images/imglogo.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: 164,
                    height: 164,
                    child: Image(
                      image: AssetImage(
                        'assets/images/imglogo.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: RichText(
                  text: TextSpan(
                      text: 'Name of the Item',
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
                margin: EdgeInsets.only(left: 16, right: 16),
                // width: 341,
                height: 45,
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
                    hintText: 'Name',
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
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: RichText(
                  text: TextSpan(
                      text: 'Name of the Item',
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
                height: 45,
                margin: EdgeInsets.only(left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
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
                    hintText: 'Food of the description',
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
              SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.only(left: 18.5),
                child: Text(
                  "Max 20 word",
                  style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    letterSpacing: -0.2297412,
                    color: Color(0xff6E6D7A),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'Diet Type',
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
                      DropdownDietType(),
                    ],
                  ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'Cost',
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
                      Container(
                        width: 163,
                        height: 45,
                        margin: EdgeInsets.only(right: 16),
                        child: TextFormField(
                          //controller: address1Controller,
                          decoration: InputDecoration(
                            hintText: '000.00 \$',
                            contentPadding: EdgeInsets.only(
                              left: 30,
                              top: 14,
                            ),
                            hintStyle: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.264706,
                              color: Color(0xff979797).withOpacity(0.7),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0, color: Color(0xffE0E0E0)),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                                bottomLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
              ]),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: RichText(
                  text: TextSpan(
                      text: 'Category',
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
              DropdownCategory(),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: RichText(
                  text: TextSpan(
                      text: 'Standard Serving Size',
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
              DropdownStandard(),
              SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.only(left: 18.5),
                child: Text(
                  "Please Type in case of Other",
                  style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    letterSpacing: -0.2297412,
                    color: Color(0xff6E6D7A),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Other Serving Configurations",
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Monstserrat',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.2297412,
                    color: Color(0xff6E6D7A),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xffFFFFFF),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 11, right: 11, top: 9, bottom: 9),
                  child: DottedBorder(
                    //color: Color(0Xff393E4),
                    child: Center(
                      child: Container(
                        height: 20,
                        width: 155,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outline_sharp,
                              color: Color(0xff393E46),
                              size: 18,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Add ",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Inter ',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                letterSpacing: -0.229412,
                                color: Color(0xff393E46),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    borderType: BorderType.RRect,
                    radius: Radius.circular(10),
                    dashPattern: [10, 5, 10, 5, 10, 5],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  //Navigator.pushNamed(context, Routes.onboarding2Route);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 16, right: 16),

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
                height: 5.89,
              ),
            ],
          ),
        ));
  }
}
