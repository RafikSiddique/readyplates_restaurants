import 'package:flutter/material.dart';
import 'package:readyplates_restaurants/utils/utils.dart';

class OpeningScreen extends StatelessWidget {
  const OpeningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              scale: 1,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 34,
                  left: 42,
                  right: 43,
                ),
                child: Row(
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        child: Image.asset("assets/images/spoon.png")),
                    SizedBox(width: 16),
                    Container(
                      width: 234,
                      height: 39,
                      child: Text(
                        "READY PLATES",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.0769231,
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 595,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 343,
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
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.signup1Route);
                  },
                  child: Container(
                    width: 343,
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
