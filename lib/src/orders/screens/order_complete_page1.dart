import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/orders/order_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/order_widget.dart';

class OrderCompletePage1 extends StatefulWidget {
  const OrderCompletePage1({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderCompletePage1> createState() => _OrderCompletePage1State();
}

class _OrderCompletePage1State extends State<OrderCompletePage1> {
  final controller = Get.find<OrderController>();
  String dropdownValue = 'Default';
  String changeValue = '';
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          Scaffold(
              backgroundColor: MyTheme.buttontextColor,
              body: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
                child: Obx(
                  () => controller.active.isEmpty &&
                          controller.ended.isEmpty &&
                          controller.inProgress.isEmpty &&
                          controller.Served.isEmpty
                      ? Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart_outlined,
                                size: MediaQuery.of(context).size.width * 0.2,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "No Orders at the moment",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        )
                      : RefreshIndicator(
                          onRefresh: () async {
                            await controller.getOrderItems();
                          },
                          child: Container(
                            height: Get.height,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, right: 16),
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: MyTheme.appbackgroundColor,
                                    ),
                                    child: TextFormField(
                                      style: GoogleFonts.nunito(
                                        fontSize: 15,
                                        color: MyTheme.hinttextchangeColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      onChanged: (value) {},
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: MyTheme.bordersColor,
                                        ),
                                        contentPadding: EdgeInsets.only(top: 4),
                                        hintText:
                                            'Search for Orders, Order number....',
                                        hintStyle: GoogleFonts.nunito(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: MyTheme.bordersColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Row(
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
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Container(
                                    height: 35,
                                    width: 164,
                                    decoration: BoxDecoration(
                                        color: MyTheme.appbackgroundColor,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: DropdownButtonFormField<String>(
                                      isExpanded: true,
                                      icon: Padding(
                                        padding: const EdgeInsets.only(
                                          right: 10,
                                        ),
                                        child: FaIcon(
                                          FontAwesomeIcons.chevronDown,
                                          color: MyTheme.chevrondowncolor,
                                          size: 15,
                                        ),
                                      ),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        hintText: 'Default',
                                        contentPadding: EdgeInsets.only(
                                          left: 14,
                                        ),
                                        hintStyle: GoogleFonts.nunito(
                                          fontSize: 13,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w600,
                                          color: MyTheme.bordersColor,
                                        ),
                                      ),
                                      value: dropdownValue,
                                      items: <String>[
                                        'Default',
                                        'placed',
                                        'inProgress',
                                        'Served',
                                        'Ended',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: GoogleFonts.nunito(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13,
                                              color: MyTheme.chevrondowncolor,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          changeValue = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                if (changeValue == '' ||
                                    changeValue == 'Default')
                                  Expanded(
                                    child: ListView(
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          if (controller.active.isNotEmpty)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 6),
                                              child: Text(
                                                "ACTIVE",
                                                style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    color:
                                                        MyTheme.ordertextColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ...controller.active
                                              .map((element) =>
                                                  OrderWidget(element: element))
                                              .toList(),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          if (controller.Served.isNotEmpty)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 6),
                                              child: Text(
                                                "FOOD SERVED",
                                                style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    color:
                                                        MyTheme.ordertextColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ...controller.Served.map((element) =>
                                                  OrderWidget(element: element))
                                              .toList(),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          if (controller.inProgress.isNotEmpty)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 6),
                                              child: Text(
                                                "IN PROGRESS",
                                                style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    color:
                                                        MyTheme.ordertextColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ...controller.inProgress
                                              .map((element) =>
                                                  OrderWidget(element: element))
                                              .toList(),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          if (controller.ended.isNotEmpty)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 6),
                                              child: Text(
                                                "PREVIOUS COMPLETED ORDERS",
                                                style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    color:
                                                        MyTheme.ordertextColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ...controller.ended
                                              .map((element) =>
                                                  OrderWidget(element: element))
                                              .toList(),
                                        ]),
                                  ),
                                if (changeValue == 'placed')
                                  Expanded(
                                    child: ListView(
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          if (controller.active.isNotEmpty)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 6),
                                              child: Text(
                                                "ACTIVE",
                                                style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    color:
                                                        MyTheme.ordertextColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ...controller.active
                                              .map((element) =>
                                                  OrderWidget(element: element))
                                              .toList(),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ]),
                                  ),
                                if (changeValue == 'inProgress')
                                  Expanded(
                                    child: ListView(
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          if (controller.inProgress.isNotEmpty)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 6),
                                              child: Text(
                                                "IN PROGRESS",
                                                style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    color:
                                                        MyTheme.ordertextColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ...controller.inProgress
                                              .map((element) =>
                                                  OrderWidget(element: element))
                                              .toList(),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ]),
                                  ),
                                if (changeValue == 'Served')
                                  Expanded(
                                    child: ListView(
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          if (controller.Served.isNotEmpty)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 6),
                                              child: Text(
                                                "FOOD SERVED",
                                                style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    color:
                                                        MyTheme.ordertextColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ...controller.Served.map((element) =>
                                                  OrderWidget(element: element))
                                              .toList(),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ]),
                                  ),
                                if (changeValue == 'Ended')
                                  Expanded(
                                    child: ListView(
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          if (controller.ended.isNotEmpty)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 6),
                                              child: Text(
                                                "PREVIOUS COMPLETED ORDERS",
                                                style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    color:
                                                        MyTheme.ordertextColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ...controller.ended
                                              .map((element) =>
                                                  OrderWidget(element: element))
                                              .toList(),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ]),
                                  ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              )),
          if (controller.loading.value)
            IgnorePointer(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Center(child: CircularProgressIndicator()),
              ),
            )
        ],
      );
    });
  }
}
