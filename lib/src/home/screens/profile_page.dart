import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/models/restaurant_model.dart';
import 'package:readyplates_restaurants/models/table_model.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/src/login/screens/login_page.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/index.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/table_config_page.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';
import 'package:readyplates_restaurants/widgets/edit_button.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final SharedPreferenceHelper sfHelper = SharedPreferenceHelper();

  final HomeController homeController = Get.find();
  void orderCloseUntilDate() async {
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2050),
      currentDate: DateTime.now(),
    );
    if (dt != null)
      setState(() {
        homeController.closeOrderTime = dt;
      });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProfileListTile(
            title: "Change Password",
            onTap: () {
              Get.to(() => LoginPage(
                    isChangePassword: true,
                  ));
            }),
        ProfileListTile(
            title: "Restaurant Detail",
            onTap: () async {
              bool isRegistered = Get.isRegistered<OnboardingController>();
              if (!isRegistered) Get.put(OnboardingController());
              final c = Get.find<OnboardingController>();
              c.isEditing = true;
              String? userId = await sfHelper.getUserId();
              c.uniqueId = userId!;
              if (homeController.restaurantModel == null) {
                await homeController.getRestaurant();

                RestaurantModel restaurantModel =
                    homeController.restaurantModel!;
                c.initEditControllers1n2(restaurantModel);
                Get.toNamed(OnboardingPage1.id);
              } else {
                RestaurantModel restaurantModel =
                    homeController.restaurantModel!;
                c.initEditControllers1n2(restaurantModel);
                Get.toNamed(OnboardingPage1.id);
              }
            }),
        ProfileListTile(
            title: "Restaurant Bio",
            onTap: () async {
              bool isRegistered = Get.isRegistered<OnboardingController>();
              if (!isRegistered) Get.put(OnboardingController());
              final c = Get.find<OnboardingController>();
              c.isEditing = true;
              c.fasciaImages = List.generate(4, (index) => "");
              c.ambienceImages = List.generate(4, (index) => "");
              c.foodImages = List.generate(4, (index) => "");
              c.covidProtocol = List.generate(4, (index) => "");
              c.pageController = PageController(initialPage: 0);
              c.pageIndex.value = 0;
              String? userId = await sfHelper.getUserId();
              c.uniqueId = userId!;
              final controller = Get.find<OnboardingController>();
              controller.init8();
              if (homeController.restaurantModel == null) {
                await homeController.getRestaurant();
              }
              RestaurantModel restaurantModel = homeController.restaurantModel!;
              c.initEditing7n8(restaurantModel);
              Get.toNamed(OnboardingPage7.id);
            }),
        ProfileListTile(
            title: "Payment Setup",
            onTap: () async {
              bool isRegistered = Get.isRegistered<OnboardingController>();
              if (!isRegistered) Get.put(OnboardingController());
              final c = Get.find<OnboardingController>();
              c.isEditing = true;
              String? userId = await sfHelper.getUserId();
              c.uniqueId = userId!;
              c.init3();
              Get.toNamed(OnboardingPage3.id);
            }),
        ProfileListTile(
            title: "Table Configuration",
            onTap: () async {
              bool isRegistered = Get.isRegistered<OnboardingController>();
              if (!isRegistered) Get.put(OnboardingController());
              final c = Get.find<OnboardingController>();
              c.isEditing = true;
              String? userId = await sfHelper.getUserId();
              c.uniqueId = userId!;
              await homeController.getAvailableTables();
              c.tables.clear();
              c.capacities.clear();
              c.edit.clear();
              c.available.clear();

              List<TableModel> allTables = homeController.getAvailTables +
                  homeController.getUnavaailTables;
              allTables.forEach((element) {
                c.tables.add(c.tables.length + 1);
                c.capacities.add(element.capacity);

                c.available.add(element.available);
                c.edit.add(true);
              });
              Get.toNamed(TableConfig.id);
            }),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text(
                    homeController.Switchvalue == false
                        ? 'Start Orders'
                        : 'Close Orders',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff6C757D),
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.6,
                  child: CupertinoSwitch(
                      thumbColor: Colors.white,
                      activeColor: MyTheme.borderchangeColor,
                      trackColor: MyTheme.editbuttontextColor,
                      value: homeController.Switchvalue,
                      onChanged: (newValue) {
                        if (!newValue) {
                          Get.bottomSheet(Card(
                            child: Card(
                              margin: EdgeInsets.zero,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: InkWell(
                                      onTap: () {
                                        orderCloseUntilDate();
                                      },
                                      child: Text(
                                        "Close Orders until:${homeController.closeOrderTime == null ? 'Select Date' : '${homeController.closeOrderTime!.year}/${homeController.closeOrderTime!.month}/${homeController.closeOrderTime!.day}'}",
                                        style: GoogleFonts.inter(
                                          fontSize: 17,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          color: MyTheme.appbartextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "I turn back on manually",
                                      style: GoogleFonts.inter(
                                        fontSize: 17,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        color: MyTheme.appbartextColor,
                                      ),
                                    ),
                                    onTap: () {
                                      homeController.openCloseOrders();
                                      setState(() {
                                        homeController.Switchvalue =
                                            !homeController.Switchvalue;
                                      });
                                      Get.back();
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Tomorrow morning",
                                      style: GoogleFonts.inter(
                                        fontSize: 17,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        color: MyTheme.appbartextColor,
                                      ),
                                    ),
                                    onTap: () {
                                      Get.back();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ));
                        } else {
                          homeController.openCloseOrders();
                          setState(() {
                            homeController.Switchvalue =
                                !homeController.Switchvalue;
                          });
                        }
                      }),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ProfileListTile extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const ProfileListTile({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 11.0),
              child: Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff6C757D),
                ),
              ),
            ),
            EditButton(onTap: onTap)
          ],
        ),
      ),
    );
  }
}
