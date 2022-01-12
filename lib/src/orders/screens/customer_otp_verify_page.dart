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
                          controller.otpText[i] = controller.otpText[j];
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
                              controller.otp = controller.otp.substring(0, i);
                              controller.otpFields[i - 1].requestFocus();
                            } else {
                              controller.otp = "";
                            }
                          }
                        },
                      ),
                    )
                ],
              ),
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
                        : Colors.red,
                  ))),
              Spacer(
                flex: 1,
              ),
              Obx(
                () => OnboardingButton(
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
                  buttonbackgroundColor: controller.otpText[j] == ''
                      ? MyTheme.verifyButtonColor
                      : MyTheme.orangeColor,
                  text: 'Confirm',
                  buttontextColor: controller.otpText[j] == ''
                      ? MyTheme.verifyTextColor
                      : MyTheme.appbackgroundColor,
                ),
              ),
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
