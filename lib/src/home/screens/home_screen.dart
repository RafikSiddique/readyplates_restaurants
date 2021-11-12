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
  OrderModelApi? orderModelApi;


  final List<String> bottomBarIcons =
      List.generate(4, (index) => 'assets/images/bottombaar${index + 1}.png');
  final List<String> label = ["Menu", "Performance", "Orders", "Profile"];
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
                for (var i = 0; i < bottomBarIcons.length; i++)
                  BottomNavigationBarItem(
                      icon: SizedBox.square(
                        dimension: 20,
                        child: Image.asset(
                          bottomBarIcons[i],
                          color: controller.selectedIndex.value == i
                              ? MyTheme.borderchangeColor
                              : null,
                        ),
                      ),
                      label: label[i])
              ]),
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
            ProfilePage(),
          ],
        ));
  }
}
