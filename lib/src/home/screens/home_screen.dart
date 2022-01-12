import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/models/orderitem_model.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/src/home/screens/table_status_page.dart';
import 'package:readyplates_restaurants/src/home/screens/add_menu_page.dart';
import 'package:readyplates_restaurants/src/orders/screens/order_complete_page1.dart';
import 'package:readyplates_restaurants/src/home/screens/performance_page.dart';
import 'package:readyplates_restaurants/src/home/screens/profile_page.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';

class HomePage extends StatelessWidget {
  static const id = "/home";
  HomePage({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();
  OrderModelApi? orderModelApi;

  final List<String> bottomBarIcons =
      List.generate(5, (index) => 'assets/images/bottombaar${index + 1}.png');
  final List<String> label = [
    "Menu",
    "Performance",
    "Orders",
    "Tables",
    "Profile",
  ];

  Widget getBody() {
    switch (controller.selectedIndex.value) {
      case 0:
        return MenuPage();

      case 1:
        return PerformancePage();

      case 2:
        return OrderCompletePage1();

      case 3:
        return TableStatusPage();

      case 4:
        return ProfilePage();

      default:
        return MenuPage();
    }
  }

  void showDialogLocal(BuildContext context) async {
    bool flag = await SharedPreferenceHelper().getOpenAutoFlag();
    if (!flag) {
      controller.switchValue.value = false;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Orders are closed"),
            content: Text(
                "You have closed the order up until you turn it back on, do you want to turn on the orders?"),
            actions: [
              TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: Text("No")),
              TextButton(
                  onPressed: () async {
                    String resid =
                        await SharedPreferenceHelper().getRestaurantId();
                    await controller.setAutoOrder(resid, 0);
                    await SharedPreferenceHelper().setOpenAutoFlag(true);
                    controller.switchValue.value = true;
                    await controller.openCloseOrders();
                    Navigator.pop(context);
                  },
                  child: Text("Yes"))
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDialogShown = false;
    if (!isDialogShown) {
      showDialogLocal(context);
      isDialogShown = true;
    }
    return Scaffold(
        backgroundColor: MyTheme.buttontextColor,
        bottomNavigationBar: Obx(
          () => Container(
            height: 60,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color(0xff000000).withOpacity(0.25),
                blurRadius: 4,
              )
            ]),
            child: BottomNavigationBar(
                elevation: 1,
                currentIndex: controller.selectedIndex.value,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Color(0xFFFFFFFF),
                // selectedFontSize: 20,
                // unselectedFontSize: 20,
                selectedItemColor: MyTheme.orangeColor,
                unselectedItemColor: MyTheme.appbartextColor,
                selectedLabelStyle: GoogleFonts.inter(
                  fontSize: 13,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                ),
                unselectedLabelStyle: GoogleFonts.inter(
                  fontSize: 13,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                ),
                onTap: controller.onChanged,
                items: [
                  for (var i = 0; i < bottomBarIcons.length; i++)
                    BottomNavigationBarItem(
                      icon: SizedBox.square(
                        dimension: 20,
                        child: Image.asset(
                          bottomBarIcons[i],
                          color: controller.selectedIndex.value == i
                              ? MyTheme.orangeColor
                              : MyTheme.appbartextColor,
                        ),
                      ),
                      label: label[i],
                    )
                ]),
          ),
        ),
        appBar: PreferredSize(
            child: Obx(
              () => AppBar(
                  elevation: 0,
                  centerTitle: true,
                  toolbarHeight: 44,
                  backgroundColor: controller.appBarColor.value,
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
                  title: Text(
                    controller.title.value,
                    style: GoogleFonts.inter(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: MyTheme.appbartextColor,
                    ),
                  )),
            ),
            preferredSize: Size.fromHeight(44)),
        body: Obx(() => getBody()));
  }
}
