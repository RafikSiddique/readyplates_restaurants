import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddMenuPage extends StatelessWidget {
  const AddMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    // Size size = media.size;
    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 1,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFFFFFFFF),
          selectedItemColor: Color(0xff000000),
          unselectedItemColor: Color(0xff000000),
          selectedFontSize: 20,
          unselectedFontSize: 20,
          onTap: (value) {
            // Respond to item press.
          },
          items: [
            BottomNavigationBarItem(
              title: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Inter',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  letterSpacing: -0.264706,
                  color: Color(0xff00ADB5).withOpacity(0.7),
                ),
              ),
              icon: Icon(
                Icons.flatware_outlined,
                color: Color(0xff00ADB5),
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                'Performance',
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Inter',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  letterSpacing: -0.264706,
                  color: Color(0xff393E46),
                ),
              ),
              icon: Icon(Icons.stacked_line_chart_sharp),
            ),
            BottomNavigationBarItem(
              title: Text(
                'Orders',
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Inter',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  letterSpacing: -0.264706,
                  color: Color(0xff393E46),
                ),
              ),
              icon: Icon(Icons.format_list_bulleted_sharp),
            ),
            BottomNavigationBarItem(
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Inter',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  letterSpacing: -0.264706,
                  color: Color(0xff393E46),
                ),
              ),
              icon: Icon(Icons.people_alt_outlined),
            ),
          ],
        ),
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 44,
          backgroundColor: Color(0xffE5E5E5),
          centerTitle: true,
          title: Center(
            child: Text(
              'Menu',
              style: TextStyle(
                fontFamily: 'Inter',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 17,
                letterSpacing: -0.226667,
                color: Color(0xff393E46),
              ),
            ),
          ),
        ),
        body: Column(children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 80,
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
              padding:
                  const EdgeInsets.only(left: 11, right: 11, top: 9, bottom: 9),
              child: DottedBorder(
                //color: Color(0Xff393E4),
                child: Center(
                  child: Container(
                    height: 20,
                    width: 155,
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_circle_outline_sharp,
                          color: Color(0xff393E46),
                          size: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Add Items to Menu",
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
        ]));
  }
}
