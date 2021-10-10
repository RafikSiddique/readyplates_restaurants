import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/src/home/screens/add_menu_page.dart';

class HomePage extends StatelessWidget {
  static const id = "/home";
  HomePage({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
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
          toolbarHeight: 44,
          backgroundColor: Color(0xffE5E5E5),
          centerTitle: true,
          title: Center(
            child: Text(
              'Menu',
              style: TextStyle(
                fontFamily: 'Inter',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 17,
                letterSpacing: -0.226667,
                color: Color(0xff393E46),
              ),
            ),
          ),
        ),
        body: PageView(
          controller: controller.pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            MenuPage(),
            Container(),
            Container(),
            Container(),
          ],
        ));
  }
}
