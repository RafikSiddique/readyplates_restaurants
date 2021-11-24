import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/login/screens/login_page.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/src/onboarding/screens/index.dart';
import 'package:readyplates_restaurants/utils/shared_preference_helper.dart';
import 'package:readyplates_restaurants/widgets/edit_button.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final SharedPreferenceHelper sfHelper = SharedPreferenceHelper();
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
              String userId = await sfHelper.getRestaurantId();
              c.uniqueId = userId;
              Get.toNamed(OnboardingPage1.id);
            }),
        ProfileListTile(
            title: "Restaurant Bio",
            onTap: () async {
              bool isRegistered = Get.isRegistered<OnboardingController>();
              if (!isRegistered) Get.put(OnboardingController());
              final c = Get.find<OnboardingController>();
              c.isEditing = true;

              String userId = await sfHelper.getRestaurantId();
              c.uniqueId = userId;

              Get.toNamed(OnboardingPage7.id);
            }),
        ProfileListTile(
            title: "Payment Setup",
            onTap: () async {
              bool isRegistered = Get.isRegistered<OnboardingController>();
              if (!isRegistered) Get.put(OnboardingController());
              final c = Get.find<OnboardingController>();
              c.isEditing = true;
              String userId = await sfHelper.getRestaurantId();
              c.uniqueId = userId;
              c.init3();
              Get.toNamed(OnboardingPage3.id);
            }),
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
