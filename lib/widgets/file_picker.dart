import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';

class PickFiles extends StatelessWidget {
  final Color uploadborderColor;
  final String uploadText;
  final Color uploadtextColor;
  final double fontSize;
  final void Function(File) onFilePicked;

  PickFiles({
    Key? key,
    this.fontSize = 13,
    required this.uploadborderColor,
    required this.uploadText,
    required this.uploadtextColor,
    required this.onFilePicked,
  }) : super(key: key);
  final controller = Get.find<OnboardingController>();

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: uploadborderColor,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(6.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12.5),
              child: Text(
                uploadText,
                style: GoogleFonts.inter(
                  fontSize: fontSize,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  color: uploadtextColor,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              final result =
                  await FilePicker.platform.pickFiles(allowMultiple: true);
              if (result == null) return;
              final file = result.files.first;
              onFilePicked(File(file.path!));
            },
            child: Container(
              width: 45,
              decoration: BoxDecoration(
                color: Color(0xffEFEFEF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(6.0),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(6.0),
                ),
              ),
              child: Center(
                child: Container(
                  width: 20,
                  height: 20,
                  child: Image(
                    image: AssetImage(
                      'assets/images/upload.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
