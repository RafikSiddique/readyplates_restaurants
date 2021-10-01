import 'package:flutter/material.dart';
import 'package:readyplates_restaurants/utils/utils.dart';

class SignupPage3 extends StatelessWidget {
  const SignupPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Navigator.pushNamed(context, Routes.openingscreenRoute);
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
              child: RichText(
                text: TextSpan(
                    text: 'GSTIN Present *',
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
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                // controller: email,
                decoration: InputDecoration(
                  hintText: "Yes/No/Applied/Acknowledgement Received",
                  hintStyle: TextStyle(
                      fontSize: 15,
                      letterSpacing: -0.264706,
                      color: Color(0xff2F2E41).withOpacity(0.7)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Text("Restaurant GSTIN",
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
                  hintText: "Eg.22AABCU9603R1ZX",
                  hintStyle: TextStyle(
                      fontSize: 15,
                      letterSpacing: -0.264706,
                      color: Color(0xff2F2E41).withOpacity(0.7)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Text("FSSAI License Status",
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
                  hintText: "Yes/No/Applied/Acknowledgement Received",
                  hintStyle: TextStyle(
                      fontSize: 15,
                      letterSpacing: -0.264706,
                      color: Color(0xff2F2E41).withOpacity(0.7)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Text("FSSAI Expiry Date",
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
                  hintText: "mm/dd/yyyy",
                  hintStyle: TextStyle(
                      fontSize: 15,
                      letterSpacing: -0.264706,
                      color: Color(0xff2F2E41).withOpacity(0.7)),

                  //labelText: "Yes/No/Applied/Acknowledgement Received",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today_outlined),
                    color: Color(0xff6E6D7A),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: RichText(
                text: TextSpan(
                    text:
                        'Upload KYC (Aadhar Card/ Passport/Driving License/ Voter ID',
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
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                // controller: email,
                decoration: InputDecoration(
                  hintText: "Please upload [ “png”, “jpg”, “jpeg”] images",
                  hintStyle: TextStyle(
                      fontSize: 15,
                      letterSpacing: -0.264706,
                      color: Color(0xff2F2E41).withOpacity(0.7)),
                  suffixIcon: Container(
                    height: 45,
                    width: 45,
                    color: Color(0xffEFEFEF),
                    child: IconButton(
                      icon: Icon(Icons.upload_file),
                      color: Color(0xff6E6D7A),
                      onPressed: () {},
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Text("Upload GSTIN Certificate",
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
                  hintText:
                      "Please upload [ “png”, “jpg”, “jpeg”, “pdf”] files",
                  hintStyle: TextStyle(
                      fontSize: 15,
                      letterSpacing: -0.264706,
                      color: Color(0xff2F2E41).withOpacity(0.7)),
                  suffixIcon: Container(
                    height: 45,
                    width: 45,
                    color: Color(0xffEFEFEF),
                    child: IconButton(
                      icon: Icon(Icons.upload_file),
                      color: Color(0xff6E6D7A),
                      onPressed: () {},
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Text("Upload FSSAI Certificate",
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
                  hintText:
                      "Please upload [ “png”, “jpg”, “jpeg”, “pdf”] files",
                  hintStyle: TextStyle(
                      fontSize: 15,
                      letterSpacing: -0.264706,
                      color: Color(0xff2F2E41).withOpacity(0.7)),
                  suffixIcon: Container(
                    height: 45,
                    width: 45,
                    color: Color(0xffEFEFEF),
                    child: IconButton(
                      icon: Icon(Icons.upload_file),
                      color: Color(0xff6E6D7A),
                      onPressed: () {},
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
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
                      //Navigator.pushNamed(context, MyRoutes.shopRoute);
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
