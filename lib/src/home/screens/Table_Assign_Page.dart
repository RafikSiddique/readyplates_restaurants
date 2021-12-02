import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';

class TableAssignPage extends StatefulWidget {
  const TableAssignPage({Key? key}) : super(key: key);

  @override
  _TableAssignPageState createState() => _TableAssignPageState();
}

class _TableAssignPageState extends State<TableAssignPage> {
  bool isOccupied = false;
  bool isVacant = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isOccupied = !isOccupied;
                      isVacant = !isVacant;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isOccupied == false
                          ? MyTheme.appbackgroundColor
                          : MyTheme.buttonbackColor,
                      border: Border.all(
                        width: 1.0,
                        color: MyTheme.bordersColor,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        bottomLeft: Radius.circular(6),
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    height: 40.11,
                    width: 120,
                    child: Center(
                      child: Text(
                        'Occupied',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: MyTheme.dropdownarrowColor,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isVacant = !isVacant;
                      isOccupied = !isOccupied;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: isVacant == true
                            ? MyTheme.buttonbackColor
                            : MyTheme.appbackgroundColor,
                        border: Border.all(
                          width: 1.0,
                          color: Color(0xffC4C4C4),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          topRight: Radius.circular(6),
                          bottomRight: Radius.circular(6),
                        )),
                    height: 40.11,
                    width: 120,
                    child: Center(
                      child: Text(
                        'Vacant',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: MyTheme.dropdownarrowColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Visibility(
              visible: isVacant == false ? isVacant : isVacant,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 52,
                    width: 96,
                    decoration: BoxDecoration(
                        color: Color(0xffE0E0E0),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'Table 1',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: MyTheme.bottomtextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 24,
                        width: 85,
                        child: Center(
                          child: Text(
                            'Capacity',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.bottomtextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 28,
                        width: 56,
                        decoration: BoxDecoration(
                            color: Color(0xffE0E0E0),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            '01',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.bottomtextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 52,
                    width: 90,
                    decoration: BoxDecoration(
                        color: MyTheme.vacantcolor,
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Text(
                        'Mark as Vacant',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: MyTheme.borderchangeColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              replacement: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 52,
                    width: 96,
                    decoration: BoxDecoration(
                        color: Color(0xffE0E0E0),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'Table 2',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: MyTheme.bottomtextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 24,
                        width: 85,
                        child: Center(
                          child: Text(
                            'Capacity',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.bottomtextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 28,
                        width: 56,
                        decoration: BoxDecoration(
                            color: Color(0xffE0E0E0),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            '02',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.bottomtextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 52,
                    width: 90,
                    decoration: BoxDecoration(
                        color: MyTheme.occupiedcolor,
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Text(
                        'Mark as Occupied',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: MyTheme.closeiconColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
