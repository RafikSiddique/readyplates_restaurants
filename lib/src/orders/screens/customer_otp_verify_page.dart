import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/models/orderitem_model.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/src/orders/order_controller.dart';
import 'package:readyplates_restaurants/src/orders/screens/table_assign_page.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';

class CustomerOtpVerify extends GetView<OrderController> {
  final OrderModelApi orderModelApi;
  const CustomerOtpVerify(this.orderModelApi, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int j = 0;
    return Scaffold(
      backgroundColor: MyTheme.buttontextColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 44,
        backgroundColor: Colors.transparent,
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
      body: Container(
        margin: EdgeInsets.all(14),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: Image(
                  image: AssetImage('assets/images/otpverify.png'),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Container(
                width: 250,
                child:
                    Text("Enter PIN sent to customer to complete verification",
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
                height: 10,
              ),
              AnimatedBuilder(
                  animation: Listenable.merge([
                    controller.otpText[j],
                  ]),
                  builder: (context, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < controller.otpFields.length; i++)
                          Container(
                            width: 40,
                            // height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: (controller.otpText[j].text.isEmpty)
                                    ? MyTheme.borderColor
                                    : MyTheme.borderchangeColor,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            margin: EdgeInsets.all(8),
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                              controller: controller.otpText[i],
                              textAlignVertical: TextAlignVertical.center,
                              focusNode: controller.otpFields[i],
                              maxLength: 1,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                counterText: "",
                                hintText: (i + 1).toString(),
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade300,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                              ),
                              onChanged: (value) {
                                print(value);
                                print(controller.otp);
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
                                  } else {
                                    controller.otp = "";
                                  }
                                }
                              },
                            ),
                          )
                      ],
                    );
                  }),
              Obx(() => controller.otpVerification.value != ""
                  ? Spacer(
                      flex: 1,
                    )
                  : Container()),
              Obx(() => Text(controller.otpVerification.value,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: controller.otpVerification.value ==
                              controller.otpVerified
                          ? MyTheme.switchButtonColor
                          : MyTheme.errorIcon))),
              Spacer(
                flex: 1,
              ),
              AnimatedBuilder(
                  animation: Listenable.merge([
                    controller.otpText[j],
                  ]),
                  builder: (context, child) {
                    return OnboardingButton(
                      height: 44,
                      // boxShadow: [
                      //   BoxShadow(
                      //     offset: Offset(0, 2),
                      //     blurRadius: 4,
                      //     spreadRadius: 0,
                      //     color: Color(0xff000000).withOpacity(0.25),
                      //   )
                      // ],

                      fontWeight: FontWeight.bold,
                      onTap: () async {
                        if (controller.otpVerification.value ==
                            controller.otpVerified) {
                          Get.find<HomeController>().getAvailableTables();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => TableAssignPage(
                                        orderId: orderModelApi.id,
                                      )));
                        }
                      },
                      buttonbackgroundColor: controller.otpText[j].text.isEmpty
                          ? MyTheme.verifyButtonColor
                          : MyTheme.orangeColor,
                      text: 'Confirm',
                      buttontextColor: controller.otpText[j].text.isEmpty
                          ? MyTheme.verifyTextColor
                          : MyTheme.appbackgroundColor,
                    );
                  }),
              Spacer(
                flex: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
