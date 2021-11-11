import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/login/screens/login_page.dart';
import 'package:readyplates_restaurants/widgets/edit_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProfileListTile(
            title: "Change Password",
            onTap: () {
              Get.toNamed(LoginPage.id, arguments: true);
            }),
        ProfileListTile(title: "Restaurant Detail", onTap: () {}),
        ProfileListTile(title: "Restaurant Bio", onTap: () {}),
        ProfileListTile(title: "Payment Setup", onTap: () {}),
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
