import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/home/screens/order_complete_page3.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';

class OrderCompletePage2 extends StatelessWidget {
  static const id = "/order2";
  const OrderCompletePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
        child: Column(
          children: [
            Container(
              height: 272,
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
                padding: const EdgeInsets.only(left: 16, right: 16, top: 13),
                child: Column(
                  children: [
                    Row(children: [
                      Spacer(),
                      Text("Order #210403AS",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: MyTheme.text3Color,
                            ),
                          )),
                      Spacer(),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("2 x",
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
                        Text("Sloppy Mac",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.text3Color,
                              ),
                            )),
                        Spacer(),
                        Text("\$ 24.00",
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
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("2 x",
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
                        Text("Fries",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.text3Color,
                              ),
                            )),
                        Spacer(),
                        Text("\$ 6.00",
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
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Omar Levin",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.text1Color,
                              ),
                            )),
                        Text("10:00 AM",
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
                        Text("25th Sep",
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
                      height: 8,
                    ),
                    Container(
                      width: 320,
                      child: Text(
                          "Press the below button if customer has paid for the order at restaurant",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: MyTheme.textColor,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    OnboardingButton(
                      onTap: () {
                        Navigator.pushNamed(context, OrderCompletePage3.id);
                      },
                      buttonbackgroundColor: MyTheme.text1Color,
                      text: 'End Order',
                      buttontextColor: MyTheme.appbackgroundColor,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Container(
              height: 227,
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
                padding: const EdgeInsets.only(left: 16, right: 16, top: 13),
                child: Column(
                  children: [
                    Row(children: [
                      Spacer(),
                      Text("Order #210403AS",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: MyTheme.text3Color,
                            ),
                          )),
                      Spacer(),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("2 x",
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
                        Text("Sloppy Mac",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.text3Color,
                              ),
                            )),
                        Spacer(),
                        Text("\$ 24.00",
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
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("2 x",
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
                        Text("Fries",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.text3Color,
                              ),
                            )),
                        Spacer(),
                        Text("\$ 6.00",
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
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Omar Levin",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: MyTheme.text1Color,
                              ),
                            )),
                        Text("10:00 AM",
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
                        Text("25th Sep",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 280,
                          child: Text(
                              "Press button to enter OTP after customer arrival",
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
                          onTap: () {},
                          child: Container(
                            height: 44,
                            width: 44,
                            child: Image(
                              image:
                                  AssetImage('assets/images/orderbutton.png'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
