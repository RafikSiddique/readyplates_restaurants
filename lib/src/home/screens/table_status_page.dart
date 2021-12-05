import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/sort_by_capacity.dart';
import 'package:readyplates_restaurants/widgets/sort_by_type.dart';

class TableStatusPage extends StatefulWidget {
  const TableStatusPage({Key? key}) : super(key: key);

  @override
  _TableStatusPageState createState() => _TableStatusPageState();
}

class _TableStatusPageState extends State<TableStatusPage>
    with TickerProviderStateMixin {
  // bool isOccupied = false;
  // bool isVacant = true;

  late TabController tabController = TabController(length: 2, vsync: this);
  final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: Get.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 10,
          ),
          AnimatedBuilder(
            animation: tabController,
            builder: (context, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      tabController.animateTo(0);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: tabController.index == 0
                            ? MyTheme.buttonbackColor
                            : MyTheme.appbackgroundColor,
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
                      tabController.animateTo(1);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: tabController.index == 1
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
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
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
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
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
                    SortByType(
                      sort: (p0) {
                        if (p0) {
                          controller.getAvailTables
                              .sort((b, a) => a.capacity.compareTo(b.capacity));
                          controller.getUnavaailTables
                              .sort((b, a) => a.capacity.compareTo(b.capacity));
                        } else {
                          controller.getAvailTables
                              .sort((a, b) => a.capacity.compareTo(b.capacity));
                          controller.getUnavaailTables
                              .sort((a, b) => a.capacity.compareTo(b.capacity));
                        }
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Obx(
            () => Expanded(
                child: TabBarView(
              controller: tabController,
              children: [
                controller.getUnavaailTables.length != 0
                    ? controller.getUnavaailTables.first.id != -1
                        ? ListView(
                            children: controller.getUnavaailTables
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
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
                                                      BorderRadius.circular(5)),
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
                                                'Mark as Vacant',
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
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
                        child: Text("No Tables found"),
                      ),
                controller.getAvailTables.length != 0
                    ? controller.getAvailTables.first.id != -1
                        ? ListView(
                            children: controller.getAvailTables
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
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
                                                      BorderRadius.circular(5)),
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
                                                    e.id, false);
                                          },
                                          child: Container(
                                            height: 52,
                                            width: 90,
                                            decoration: BoxDecoration(
                                                color: MyTheme.occupiedcolor,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Center(
                                              child: Text(
                                                'Mark as Occupied',
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    color:
                                                        MyTheme.closeiconColor,
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
                        child: Text("No Tables found"),
                      ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
