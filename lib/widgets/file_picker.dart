import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';

class PickFiles extends StatelessWidget {
  final Color uploadborderColor;
  final String uploadText;
  final Color uploadtextColor;

  PickFiles({
    Key? key,
    required this.uploadborderColor,
    required this.uploadText,
    required this.uploadtextColor,
  }) : super(key: key);
  final controller = Get.find<OnboardingController>();

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }
  // '${controller.kycimg.path.split('/').last}'

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.68,
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
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Inter',
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
              // openFile(file);

              print('Name: ${file.name}');
              print('Bytes: ${file.bytes}');
              print('Size: ${file.size}');
              print('Extension: ${file.extension}');

              controller.kycimg = File(file.path!);
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
