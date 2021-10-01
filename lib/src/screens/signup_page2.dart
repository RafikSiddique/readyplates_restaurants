import 'package:flutter/material.dart';
import 'package:readyplates_restaurants/utils/utils.dart';

class SignupPage2 extends StatelessWidget {
  const SignupPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 20),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_left,
                  ),
                  color: Color(0xff000000),
                  onPressed: () {
                    // Navigator.pushNamed(context, MyRoutes.OnbordingPage);
                  },
                ),
                SizedBox(width: 75),
                Text("Partner Onboarding",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xff393E46),
                    )),
              ],
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Text("Restaurant Address *",
                  style: TextStyle(fontSize: 13, color: Color(0xff2F2E41))),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(left: 17, right: 15),
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                // controller: firstname,
                decoration: InputDecoration(
                  labelText: "Address Line 1",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 17, right: 15),
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                //controller: lastname,
                decoration: InputDecoration(
                  labelText: "Address Line 2",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 17, right: 15),
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                //controller: lastname,
                decoration: InputDecoration(
                  labelText: "Nearby Landmark",
                  border: OutlineInputBorder(),
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
              child: Text("Postal Code *",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff2F2E41),
                  )),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 17,
                right: 17,
              ),
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                // controller: email,
                decoration: InputDecoration(
                  labelText: "xxxxxxx",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Text("Locate Restaurant on Map *",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff2F2E41),
                  )),
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
                  image: AssetImage("assets/images/map.jpeg"),
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
              margin: EdgeInsets.only(
                left: 17,
                right: 17,
              ),
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                // controller: email,
                decoration: InputDecoration(
                  fillColor: Color(0xFFE6E6E6),
                  labelText: "",
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
              margin: EdgeInsets.only(
                left: 17,
                right: 17,
              ),
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                // controller: email,
                decoration: InputDecoration(
                  fillColor: Color(0xFFE6E6E6),
                  labelText: "",
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
            Divider(
              indent: 120,
              endIndent: 120,
              thickness: 5,
              color: Color(0xff000000),
            )
          ],
        ),
      ),
    );
  }
}
