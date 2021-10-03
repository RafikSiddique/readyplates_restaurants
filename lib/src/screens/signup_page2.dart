import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readyplates_restaurants/utils/utils.dart';

class SignupPage2 extends StatelessWidget {
  const SignupPage2({Key? key}) : super(key: key);

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
              Navigator.pushNamed(context,Routes.signup1Route);
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
                // controller: firstname,
                decoration: InputDecoration(
                  hintText: "Address Line 1",
                  hintStyle: TextStyle(
                      fontSize: 15,
                      letterSpacing: -0.264706,
                      color: Color(0xff2F2E41).withOpacity(0.7)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Color(0xffE0E0E0)),
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
                //controller: lastname,
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
                //controller: lastname,
                decoration: InputDecoration(
                  hintText: "Nearby Landmark",
                  hintStyle: TextStyle(
                      fontSize: 15,
                      letterSpacing: -0.264706,
                      color: Color(0xff2F2E41).withOpacity(0.7)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Color(0xffE0E0E0)),
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
              child: Text("Make sure it matches the name on your government ID",
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
                // controller: email,
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
                // controller: email,
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
                // controller: email,
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
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.signup3Route);
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
    );
  }
}
