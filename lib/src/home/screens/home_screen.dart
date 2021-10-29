import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/src/home/screens/add_menu_page.dart';
import 'package:readyplates_restaurants/src/home/screens/profile_page.dart';

class HomePage extends StatelessWidget {
  static const id = "/home";
  HomePage({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                icon: Icon(
                  Icons.flatware_outlined,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Performance',
                icon: Icon(Icons.stacked_line_chart_sharp),
              ),
              BottomNavigationBarItem(
                label: 'Orders',
                icon: Icon(Icons.format_list_bulleted_sharp),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(Icons.people_alt_outlined),
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
            Container(),
            Container(),
            ProfilePage(),
          ],
        ));
  }
}
