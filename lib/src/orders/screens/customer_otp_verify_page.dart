import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/models/orderitem_model.dart';
import 'package:readyplates_restaurants/src/orders/order_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';

class CustomerOtpVerify extends GetView<OrderController> {
  final OrderModelApi orderModelApi;
  const CustomerOtpVerify(this.orderModelApi, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 44,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              //controller.logout();
            },
            icon: Icon(
              Icons.power_settings_new,
              color: Colors.black,
            ),
          )
        ],
        automaticallyImplyLeading: false,
        title: Text(
          "Order #${orderModelApi.id}",
          style: GoogleFonts.inter(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Color(0xff393E46),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 3),
        child: Container(
          width: MediaQuery.of(context).size.width,
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
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.58,
                      // width: MediaQuery.of(context).size.width * 0.7,
                      child: Image(
                        image: AssetImage('assets/images/otpverify.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 250,
                    child: Text(
                        "Enter PIN sent to customer to complete verification",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            color: MyTheme.textColor,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < controller.otpFields.length; i++)
                        Container(
                          width: 40,
                          height: 50,
                          margin: EdgeInsets.all(8),
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                fontSize: 18, fontWeight: FontWeight.w600),
                            controller: controller.otpText[i],
                            textAlignVertical: TextAlignVertical.bottom,
                            focusNode: controller.otpFields[i],
                            maxLength: 1,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              counterText: "",
                              hintText: (i + 1).toString(),
                              hintStyle: TextStyle(
                                color: Colors.grey.shade300,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: MyTheme.borderColor,
                                ),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                            ),
                            onChanged: (value) {
                              if (value.length == 1) {
                                controller.otp += value;
                                if (i < 3) {
                                  controller.otpFields[i + 1].requestFocus();
                                } else {
                                  if (orderModelApi.pin.toString() ==
                                      controller.otp) {
                                    controller.otpVerification.value =
                                        controller.otpVerified;
                                  } else {
                                    controller.otpVerification.value =
                                        controller.incorrect;
                                  }
                                }
                              } else {
                                if (i != 0) {
                                  controller.otp =
                                      controller.otp.substring(0, i);
                                  controller.otpFields[i - 1].requestFocus();
                                }
                              }
                            },
                          ),
                        )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Obx(() => Text(controller.otpVerification.value,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: controller.otpVerification.value ==
                                controller.otpVerified
                            ? MyTheme.borderchangeColor
                            : Colors.red,
                      ))),
                  SizedBox(
                    height: 15,
                  ),
                  OnboardingButton(
                    height: 44,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        spreadRadius: 0,
                        color: Color(0xff000000).withOpacity(0.25),
                      )
                    ],
                    fontWeight: FontWeight.bold,
                    onTap: () async {
                      if (controller.otpVerification.value ==
                          controller.otpVerified) {
                        await controller.updateStatus(orderModelApi.id, 1);
                        controller.otpVerification.value = "";
                        controller.otp = "";
                        for (var i = 0; i < controller.otpText.length; i++) {
                          controller.otpText[i].clear();
                        }

                        Navigator.pop(context);
                      }
                    },
                    buttonbackgroundColor: MyTheme.text1Color,
                    text: 'Confirm',
                    buttontextColor: MyTheme.appbackgroundColor,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
