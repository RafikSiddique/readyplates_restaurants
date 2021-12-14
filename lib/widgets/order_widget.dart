import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:readyplates_restaurants/models/orderitem_model.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/src/orders/order_controller.dart';
import 'package:readyplates_restaurants/src/orders/screens/customer_otp_verify_page.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';

import 'onboardingbutton.dart';

class OrderWidget extends StatelessWidget {
  final OrderModelApi element;
  OrderWidget({Key? key, required this.element}) : super(key: key);
  final controller = Get.find<OrderController>();
  final hc = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
            color: Color(0xffBCCAE0).withOpacity(0.4),
          )
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      child: Column(
        children: [
          Center(
            child: Text("Order #${element.id}",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: MyTheme.text3Color,
                  ),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          ListView(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: element.orderitems
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${e.quantity} x",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.text1Color,
                              ),
                            )),
                        SizedBox(
                          width: 9,
                        ),
                        Expanded(
                          child: Text(
                            e.menu.name,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.text3Color,
                              ),
                            ),
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("\$ ${e.price}",
                            textAlign: TextAlign.right,
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.text2Color,
                              ),
                            ))
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(element.user.first_name + " " + element.user.last_name,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: MyTheme.text1Color,
                    ),
                  )),
              if (element.no_of_table != null)
                FutureBuilder<int>(
                  future: hc.getSingleTable(
                      element.restaurant.id.toString(), element.no_of_table!),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return Text(
                          "Table " +
                              snapshot.data.toString() +
                              " for " +
                              element.no_of_people.toString() +
                              " People",
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              color: MyTheme.buttonchangeColor,
                            ),
                          ));
                    }
                    return Container();
                  },
                )
              else
                Text("Order For " + element.no_of_people.toString() + " PAX",
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: MyTheme.buttonchangeColor,
                      ),
                    ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              Text(
                  element.date +
                      " " +
                      DateFormat(DateFormat.HOUR_MINUTE).format(DateTime(
                          2021,
                          01,
                          01,
                          int.parse(element.time.split(':').first),
                          int.parse(element.time.split(':').last))),
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: MyTheme.text1Color,
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          if (element.status == OrderState.placed)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child:
                      Text("Press button to enter OTP after customer arrival",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: MyTheme.textColor,
                            ),
                          )),
                ),
                Spacer(),
                // SizedBox(
                //   width: 17,
                // ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => CustomerOtpVerify(element),
                        ));
                  },
                  child: Container(
                    height: 44,
                    width: 44,
                    child: Image(
                      image: AssetImage('assets/images/orderbutton.png'),
                    ),
                  ),
                )
              ],
            )
          else
            OnboardingButton(
              onTap: () async {
                /*             if (element.status == OrderState.inProgress) {
                  if (element.no_of_table != null)
                    await controller.updateStatus(
                        element.id, 2, element.no_of_table!);
                  else
                    controller.getOrderItems();
                } */
              },
              fontSize: 15,
              buttonbackgroundColor: element.status == OrderState.inProgress
                  ? MyTheme.inProgressOrderBackColor
                  : (element.status == OrderState.cancelled
                      ? MyTheme.cancelOrderBackColor
                      : MyTheme.completeOrderBackColor),
              text: element.status == OrderState.inProgress
                  ? 'In Progress'
                  : element.status == OrderState.cancelled
                      ? "Cancelled"
                      : "Order Completed",
              buttontextColor: element.status == OrderState.inProgress
                  ? MyTheme.inProgressOrderTextColor
                  : (element.status == OrderState.cancelled
                      ? MyTheme.cancelOrderTextColor
                      : MyTheme.completeOrderTextColor),
              fontWeight: FontWeight.w500,
            )
        ],
      ),
    );
  }
}
