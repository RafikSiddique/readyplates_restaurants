import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:readyplates_restaurants/models/orderitem_model.dart';
import 'package:readyplates_restaurants/src/home/order_controller.dart';
import 'package:readyplates_restaurants/src/home/screens/customer_otp_verify_page.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';

import 'onboardingbutton.dart';

class OrderWidget extends StatelessWidget {
  final OrderModelApi element;
  OrderWidget({Key? key, required this.element}) : super(key: key);
  final controller = Get.find<OrderController>();
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
                        Text(e.menu.name,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.text3Color,
                              ),
                            )),
                        Spacer(),
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
              Text(
                  element.no_of_table.toString() +
                      " x Table for " +
                      element.no_of_people.toString() +
                      " People",
                  textAlign: TextAlign.right,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: MyTheme.text1Color,
                    ),
                  )),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Press the below button if customer has paid for the order at restaurant",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: MyTheme.textColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                OnboardingButton(
                  onTap: () async {
                    if (element.status == OrderState.inProgress) {
                      await controller.updateStatus(element.id, 2);
                    }
                  },
                  buttonbackgroundColor: element.status == OrderState.inProgress
                      ? MyTheme.text1Color
                      : MyTheme.buttonColor,
                  text: element.status == OrderState.inProgress
                      ? 'End Order'
                      : element.status == OrderState.cancelled
                          ? "Order Cancelled"
                          : "Order Completed",
                  buttontextColor: MyTheme.appbackgroundColor,
                  fontWeight: FontWeight.bold,
                ),
              ],
            )
        ],
      ),
    );
  }
}