import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/home/order_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/order_widget.dart';

class OrderCompletePage1 extends GetView<OrderController> {
  const OrderCompletePage1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          Scaffold(
              backgroundColor: MyTheme.backgroundColor,
              body: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
                child: Obx(() => controller.active.isEmpty &&
                        controller.ended.isEmpty &&
                        controller.inProgress.isEmpty
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
                        child: ListView(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            children: [
                              if (controller.active.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Text(
                                    "ACTIVE",
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: MyTheme.ordertextColor,
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
                              if (controller.inProgress.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Text(
                                    "IN PROGRESS",
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: MyTheme.ordertextColor,
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
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Text(
                                    "PREVIOUS COMPLETED ORDERS",
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: MyTheme.ordertextColor,
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
                      )),
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
