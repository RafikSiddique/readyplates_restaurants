import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/models/orderitem_model.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/src/home/screens/add_menu_page.dart';
import 'package:readyplates_restaurants/src/home/screens/order_complete_page1.dart';
import 'package:readyplates_restaurants/src/home/screens/performance_page.dart';
import 'package:readyplates_restaurants/src/home/screens/profile_page.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';

class HomePage extends StatelessWidget {
  static const id = "/home";
  HomePage({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());
  final orderPageController = PageController();
  OrderModelApi? orderModelApi;
  void moveToOTP(OrderModelApi orderModel) {
    orderPageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.backgroundColor,
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            elevation: 1,
            currentIndex: controller.selectedIndex.value,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFFFFFFFF),
            selectedFontSize: 20,
            unselectedFontSize: 20,
            onTap: controller.onChanged,
            items: [
              BottomNavigationBarItem(
                label: 'Menu',
                icon: Container(
                  height: 20,
                  width: 20.78,
                  child: Image.asset(
                    'assets/images/bottombaar1.png',
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Performance',
                icon: Container(
                  height: 20,
                  width: 20.78,
                  child: Image.asset(
                    'assets/images/bottombaar2.png',
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Orders',
                icon: Container(
                  height: 20.72,
                  width: 18,
                  child: Image.asset(
                    'assets/images/bottombaar3.png',
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Container(
                  height: 20,
                  width: 20.78,
                  child: Image.asset(
                    'assets/images/bottombaar4.png',
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          toolbarHeight: 44,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                controller.logout();
              },
              icon: Icon(
                Icons.power_settings_new,
                color: Colors.black,
              ),
            )
          ],
          title: Obx(() => Text(
                controller.title.value,
                style: GoogleFonts.inter(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: Color(0xff393E46),
                ),
              )),
        ),
        body: PageView(
          controller: controller.pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            MenuPage(),
            PerformancePage(),
            OrderCompletePage1(),
            /*           PageView(
              allowImplicitScrolling: false,
              controller: orderPageController,
              
              children: [
                OrderCompletePage1(
                ),
                CustomerOtpVerify(
                  orderModelApi!,
                  moveToOtp: () {},
                ),
                OrderCompletePage2(),
                OrderCompletePage3(),
              ],
            ), */
            ProfilePage(),
          ],
        ));
  }
}
