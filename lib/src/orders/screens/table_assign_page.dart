import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/models/table_model.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/src/home/screens/home_screen.dart';
import 'package:readyplates_restaurants/src/orders/order_controller.dart';
import 'package:readyplates_restaurants/src/orders/screens/order_done.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/sort_by_capacity.dart';
import 'package:readyplates_restaurants/widgets/sort_by_type.dart';

class TableAssignPage extends StatefulWidget {
  final int orderId;
  const TableAssignPage({Key? key, required this.orderId}) : super(key: key);

  @override
  _TableAssignPageState createState() => _TableAssignPageState();
}

class _TableAssignPageState extends State<TableAssignPage> {
  bool sortByCapacity = false;
  bool accending = false;
  bool searchByCapacity = true;
  TextEditingController search = TextEditingController();
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
                  controller: search,
                  onChanged: (value) async {
                    await controller.getAvailableTables();
                    if (searchByCapacity) {
                      controller.getAvailTables.value = controller
                          .getAvailTables
                          .where((p0) => p0.capacity.toString().contains(value))
                          .toList();
                      controller.getUnavaailTables.value = controller
                          .getUnavaailTables
                          .where((p0) => p0.capacity.toString().contains(value))
                          .toList();
                    } else {
                      if (search.text != "") {
                        List<TableModel> availables = controller.getAvailTables;
                        List<TableModel> unavailable =
                            controller.getUnavaailTables;
                        List<TableModel> unavailSearch = [];
                        List<TableModel> availSearch = [];
                        for (var i = 0; i < availables.length; i++) {
                          if ((i + 1).toString().contains(search.text)) {
                            availSearch.add(availables[i]);
                          }
                        }
                        for (var i = 0; i < unavailable.length; i++) {
                          if ((i + 1).toString().contains(search.text)) {
                            unavailSearch.add(unavailable[i]);
                          }
                        }

                        controller.getAvailTables.value = availSearch;
                        controller.getUnavaailTables.value = unavailSearch;
                      }
                    }
                  },
                  keyboardType: TextInputType.number,
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
                    ),
                    suffixIcon: Obx(
                      () => DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          alignment: Alignment.bottomRight,
                          isDense: true,
                          // itemHeight: 50,

                          value: controller.searchBy.value,
                          items: ["Table Capacity", "Table Number"]
                              .map(
                                (e) => DropdownMenuItem(
                                  child: Text(
                                    e,
                                    style: GoogleFonts.nunito(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        color: MyTheme.bottomtextColor,
                                      ),
                                    ),
                                  ),
                                  value: e,
                                ),
                              )
                              .toList(),
                          onChanged: (String? value) async {
                            controller.searchBy.value =
                                value ?? "Table Capacity";
                            if (value == "Table Capacity") {
                              searchByCapacity = true;
                            } else {
                              searchByCapacity = false;
                            }
                            await controller.getAvailableTables();
                            if (searchByCapacity) {
                              controller.getAvailTables.value = controller
                                  .getAvailTables
                                  .where((p0) => p0.capacity
                                      .toString()
                                      .contains(search.text))
                                  .toList();
                              controller.getUnavaailTables.value = controller
                                  .getAvailTables
                                  .where((p0) => p0.capacity
                                      .toString()
                                      .contains(search.text))
                                  .toList();
                            } else {
                              if (search.text != "") {
                                List<TableModel> availables =
                                    controller.getAvailTables;
                                List<TableModel> unavailable =
                                    controller.getUnavaailTables;
                                List<TableModel> unavailSearch = [];
                                List<TableModel> availSearch = [];
                                for (var i = 0; i < availables.length; i++) {
                                  if ((i + 1)
                                      .toString()
                                      .contains(search.text)) {
                                    availSearch.add(availables[i]);
                                  }
                                }
                                for (var i = 0; i < unavailable.length; i++) {
                                  if ((i + 1)
                                      .toString()
                                      .contains(search.text)) {
                                    unavailSearch.add(unavailable[i]);
                                  }
                                }

                                controller.getAvailTables.value = availSearch;
                                controller.getUnavaailTables.value =
                                    unavailSearch;
                              }
                            }
                          },
                        ),
                      ),
                    ),
                  ),
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
                      SortByCapacity(
                        sort: (p0) {
                          print(p0);
                          sortByCapacity = p0;
                          if (sortByCapacity) {
                            if (accending) {
                              controller.getAvailTables.sort(
                                  (b, a) => a.capacity.compareTo(b.capacity));
                              controller.getUnavaailTables.sort(
                                  (b, a) => a.capacity.compareTo(b.capacity));
                            } else {
                              controller.getAvailTables.sort(
                                  (a, b) => a.capacity.compareTo(b.capacity));
                              controller.getUnavaailTables.sort(
                                  (a, b) => a.capacity.compareTo(b.capacity));
                            }
                          } else {
                            if (accending) {
                              controller.getAvailTables
                                  .sort((b, a) => a.id.compareTo(b.id));
                              controller.getUnavaailTables
                                  .sort((b, a) => a.id.compareTo(b.id));
                            } else {
                              controller.getAvailTables
                                  .sort((a, b) => a.id.compareTo(b.id));
                              controller.getUnavaailTables
                                  .sort((a, b) => a.id.compareTo(b.id));
                            }
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 14,
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
                          accending = p0;
                          if (sortByCapacity) {
                            if (p0) {
                              controller.getAvailTables.sort(
                                  (b, a) => a.capacity.compareTo(b.capacity));
                              controller.getUnavaailTables.sort(
                                  (b, a) => a.capacity.compareTo(b.capacity));
                            } else {
                              controller.getAvailTables.sort(
                                  (a, b) => a.capacity.compareTo(b.capacity));
                              controller.getUnavaailTables.sort(
                                  (a, b) => a.capacity.compareTo(b.capacity));
                            }
                          } else {
                            if (p0) {
                              controller.getAvailTables
                                  .sort((b, a) => a.id.compareTo(b.id));
                              controller.getUnavaailTables
                                  .sort((b, a) => a.id.compareTo(b.id));
                            } else {
                              controller.getAvailTables
                                  .sort((a, b) => a.id.compareTo(b.id));
                              controller.getUnavaailTables
                                  .sort((a, b) => a.id.compareTo(b.id));
                            }
                          }
                        },
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Obx(
                () {
                  return Expanded(
                    child: controller.getAvailTables.length != 0
                        ? controller.getAvailTables.first.id != -1
                            ? ListView(
                                physics: BouncingScrollPhysics(),
                                children: [
                                    for (var i = 0;
                                        i < controller.getAvailTables.length;
                                        i++)
                                      Padding(
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
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                child: Text(
                                                  'Table ${i + 1}',
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
                                            Column(
                                              children: [
                                                Container(
                                                  height: 24,
                                                  width: 85,
                                                  child: Center(
                                                    child: Text(
                                                      'Capacity',
                                                      textAlign:
                                                          TextAlign.center,
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
                                                      controller
                                                          .getAvailTables[i]
                                                          .capacity
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.center,
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
                                                final OrderController
                                                    orderController =
                                                    Get.find<OrderController>();
                                                orderController
                                                    .otpVerification.value = "";
                                                orderController.otp = "";
                                                for (var i = 0;
                                                    i <
                                                        orderController
                                                            .otpText.length;
                                                    i++) {
                                                  orderController.otpText[i]
                                                      .clear();
                                                }

                                                await orderController
                                                    .updateStatus(
                                                        widget.orderId,
                                                        1,
                                                        controller
                                                            .getAvailTables[i]
                                                            .id);
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          OrderInitiatedPage(),
                                                    ),
                                                    (route) =>
                                                        route.settings.name ==
                                                        HomePage.id);
                                              },
                                              child: Container(
                                                height: 52,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                    color: MyTheme.vacantcolor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
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
                                  ])
                            : Center(
                                child: CircularProgressIndicator(),
                              )
                        : Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: MyTheme.buttonbackColor),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 14, top: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.error,
                                        color: MyTheme.text3Color,
                                      ),
                                      SizedBox(width: 13),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
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
                  );
                },
              ),
            ],
          ),
        ));
  }
}
