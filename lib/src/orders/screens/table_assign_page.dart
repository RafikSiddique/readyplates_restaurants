import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/sort_by_capacity.dart';
import 'package:readyplates_restaurants/widgets/sort_by_type.dart';

class TableAssignPage extends StatefulWidget {
  const TableAssignPage({Key? key}) : super(key: key);

  @override
  _TableAssignPageState createState() => _TableAssignPageState();
}

class _TableAssignPageState extends State<TableAssignPage> {
  final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyTheme.appbackgroundColor,
          elevation: 0,
          leading: IconButton(
              iconSize: 14.83,
              icon: FaIcon(
                FontAwesomeIcons.chevronLeft,
                color: MyTheme.iconColor,
              ),
              onPressed: () {
                Get.back();
              }),
          centerTitle: true,
          title: Text(
            'Assign Table',
            style: GoogleFonts.inter(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: MyTheme.appbartextColor,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyTheme.searchbackcolor,
                ),
                child: TextFormField(
                  style: GoogleFonts.nunito(
                    fontSize: 15,
                    color: MyTheme.hinttextchangeColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: MyTheme.bordersColor,
                      ),
                      hintText: 'Search for Table, Capacity....',
                      hintStyle: GoogleFonts.nunito(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: MyTheme.bordersColor,
                      )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Image.asset(
                              'assets/images/ArrowLineUpRight.png',
                              height: 20,
                              width: 20,
                            ),
                          ),
                          Text(
                            'Sort By :',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.bottomtextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SortByCapacity(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Image.asset(
                              'assets/images/ArrowsDownUp.png',
                              height: 20,
                              width: 20,
                            ),
                          ),
                          Text(
                            'Sort Type :',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.bottomtextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SortByType()
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Obx(
                () => Expanded(
                  child: controller.getTables.length != 0
                      ? controller.getTables.first.id != -1
                          ? ListView(
                              children: controller.getTables
                                  .where((p0) => p0.available)
                                  .map(
                                    (e) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 52,
                                            width: 96,
                                            decoration: BoxDecoration(
                                                color: Color(0xffE0E0E0),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                              child: Text(
                                                'Table ${e.id}',
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    color:
                                                        MyTheme.bottomtextColor,
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color: MyTheme
                                                            .bottomtextColor,
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Center(
                                                  child: Text(
                                                    e.capacity.toString(),
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color: MyTheme
                                                            .bottomtextColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              await controller
                                                  .switchTableAvailability(
                                                      e.id, true);
                                            },
                                            child: Container(
                                              height: 52,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                  color: MyTheme.vacantcolor,
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Center(
                                                child: Text(
                                                  'Assign Table',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.inter(
                                                    textStyle: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color: MyTheme
                                                          .borderchangeColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList())
                          : Center(
                              child: CircularProgressIndicator(),
                            )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: MyTheme.buttonbackColor),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14, top: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.error,
                                  color: MyTheme.text3Color,
                                ),
                                SizedBox(width: 13),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.65,
                                  child: Text(
                                      "There are no vacant tables available to assign at the moment.",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.nunito(
                                          fontSize: 15,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal)),
                                )
                              ],
                            ),
                          )),
                ),
              ),
            ],
          ),
        ));
  }
}
