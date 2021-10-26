import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/dropdowncategory.dart';
import 'package:readyplates_restaurants/widgets/dropdowndiettype.dart';
import 'package:readyplates_restaurants/widgets/dropdownstandard.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';

String getUrl(String url) {
  // // http://202.53.174.5:8000/
  return "http://202.53.174.5:8000" + url;
}

class AddFoodItem extends StatefulWidget {
  static const id = "/addfoodItem";
  AddFoodItem({Key? key}) : super(key: key);

  @override
  State<AddFoodItem> createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
  final controller = Get.find<HomeController>();

  void pickImage({
    required void Function(File) imageFile,
  }) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      imageFile(File(file.path));
    }
  }

  // @override
  // void initState() {
  //   controller.name.addListener(() {
  //     setState(() {});
  //   });
  //   controller.desc.addListener(() {
  //     setState(() {});
  //   });
  //   controller.cost.addListener(() {
  //     setState(() {});
  //   });
  //   if (controller.isEditing) {
  //     controller.setEditing();
  //     setState(() {});
  //   } else {
  //     controller.clearController();
  //   }
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   controller.name.dispose();
  //   controller.desc.dispose();
  //   controller.cost.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 44,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            iconSize: 14.83,
            icon: FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: MyTheme.iconColor,
            ),
            onPressed: () {
              Get.back();
            }),
        centerTitle: true,
        title: Text(
          'Add Food Item',
          style: TextStyle(
            fontSize: 17,
            fontFamily: 'Inter-Regular',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: MyTheme.appbartextColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              FieldTitle(
                text: "Add Food Item",
                fontFamily: 'Inter-Regular',
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 164,
                    width: size.width * 0.42,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      border: Border.all(
                        width: 1,
                        color: controller.image1.path.isEmpty
                            ? MyTheme.borderColor
                            : MyTheme.borderchangeColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          pickImage(
                            imageFile: (p0) {
                              controller.image1 = p0;
                            },
                          );
                          setState(() {});
                        },
                        child: Container(
                          child: controller.image1.path == ""
                              ? Image(
                                  image: AssetImage(
                                    'assets/images/imglogo.png',
                                  ),
                                  fit: BoxFit.cover,
                                  width: 60,
                                  height: 60,
                                )
                              : Image.file(controller.image1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 164,
                    width: size.width * 0.42,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      border: Border.all(
                        width: 1,
                        color: controller.image2.path.isEmpty
                            ? MyTheme.borderColor
                            : MyTheme.borderchangeColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          pickImage(
                            imageFile: (p0) {
                              controller.image2 = p0;
                            },
                          );
                          setState(() {});
                        },
                        child: Container(
                          child: controller.isEditing
                              ? Image.network(
                                  getUrl(controller.foodItemModel!.image2))
                              : controller.image2.path == ""
                                  ? Image(
                                      image: AssetImage(
                                        'assets/images/imglogo.png',
                                      ),
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.file(controller.image2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              AppFormField(
                title: 'Name of the Item',
                hintText: 'Name',
                hintfontSize: 15,
                controller: controller.name,
                bottomText: 'Max 5 Words',
              ),
              SizedBox(
                height: 16,
              ),
              AppFormField(
                title: 'Description of the Item',
                hintText: 'Food of the description',
                hintfontSize: 15,
                controller: controller.desc,
                bottomText: 'Max 20 Words',
              ),
              SizedBox(
                height: 16,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FieldTitle(
                        text: 'Diet Type',
                        fontFamily: 'Inter-Regular',
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      DropdownDietType(
                        //THIS
                        color: controller.dietType == ""
                            ? MyTheme.borderColor
                            : MyTheme.borderchangeColor,
                        value: controller.dietType.value == ""
                            ? null
                            : controller.dietType.value,
                        onSelect: (p0) {
                          controller.dietType.value = p0!;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppFormField(
                            title: 'Cost',
                            hintText: '000.00 \$',
                            hintfontSize: 15,
                            controller: controller.cost),
                        // FieldTitle(
                        //   text: "Cost",
                        //   fontFamily: 'Inter-Regular',
                        //   fontSize: 13,
                        //   fontWeight: FontWeight.w500,
                        // ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // TextFormField(
                        //   controller: controller.cost,
                        //   decoration: InputDecoration(
                        //     contentPadding: EdgeInsets.symmetric(
                        //         horizontal: 12, vertical: 0),
                        //     hintText: '000.00 \$',
                        //     hintStyle: TextStyle(
                        //       fontSize: 13,
                        //       fontFamily: 'Inter',
                        //       fontStyle: FontStyle.normal,
                        //       fontWeight: FontWeight.w500,
                        //       color: MyTheme.hinttextColor,
                        //     ),
                        //     border: OutlineInputBorder(
                        //       borderSide: BorderSide(
                        //         width: 0,
                        //         color: MyTheme.borderColor,
                        //       ),
                        //       borderRadius: BorderRadius.circular(6),
                        //     ),
                        //   ),
                        // )
                      ]),
                ),
              ]),
              SizedBox(
                height: 16,
              ),
              FieldTitle(
                text: "Category",
                fontFamily: 'Inter-Regular',
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 5,
              ),
              DropdownCategory(
                color: controller.category == ""
                    ? MyTheme.borderColor
                    : MyTheme.borderchangeColor,
                value: controller.category.value == ""
                    ? null
                    : controller.category.value,
                onSelect: (p0) {
                  controller.category.value = p0!;
                },
              ),
              SizedBox(
                height: 16,
              ),
              FieldTitle(
                text: "Spice Level",
                required: false,
                fontFamily: 'Inter-Regular',
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Obx(
                  () => Slider(
                    value: controller.spiceSlider.value,
                    onChanged: (value) {
                      controller.spiceSlider.value = value;
                    },
                    label: controller.spiceSlider.value.toString(),
                    divisions: 4,
                    max: 5,
                    min: 1,
                    activeColor: Color(0xffFF6E42),
                    thumbColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                      List.generate(5, (index) => Text((index + 1).toString())),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              FieldTitle(
                text: "Standard Serving Size",
                fontFamily: 'Inter-Regular',
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 5,
              ),
              DropdownStandard(
                color: controller.servingSize == ''
                    ? MyTheme.borderColor
                    : MyTheme.borderchangeColor,
                value: controller.servingSize == ""
                    ? null
                    : controller.servingSize,
                onSelect: (p0) {
                  controller.servingSize = p0!;
                },
              ),
              SizedBox(height: 3),
              Text(
                "Please Type in case of Other",
                style: TextStyle(
                  fontSize: 9,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  color: MyTheme.bottomtextColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Other Serving Configurations",
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.bottomtextColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: MyTheme.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(8),
                child: DottedBorder(
                  //color: Color(0Xff393E4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_outline_sharp,
                          color: Color(0xff393E46),
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Add ",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Inter ',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            letterSpacing: -0.229412,
                            color: Color(0xff393E46),
                          ),
                        ),
                      ],
                    ),
                  ),

                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  dashPattern: [10, 5, 10, 5, 10, 5],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              OnboardingButton(
                onTap: () {
                  if (controller.isEditing)
                    controller.editFoodItem(controller.foodItemModel!.id);
                  else
                    controller.addFoodItem();
                },
                buttonbackgroundColor: (controller.image1.path.isEmpty ||
                        controller.image2.path.isEmpty ||
                        controller.name.text.isEmpty ||
                        controller.desc.text.isEmpty ||
                        controller.dietType.value.isEmpty ||
                        controller.cost.text.isEmpty ||
                        controller.category.value.isEmpty ||
                        controller.spiceSlider.value == '' ||
                        controller.servingSize.isEmpty)
                    ? MyTheme.buttonColor
                    : MyTheme.buttonchangeColor,
                text: 'CONTINUE',
                buttontextColor: (controller.image1.path.isEmpty ||
                        controller.image2.path.isEmpty ||
                        controller.name.text.isEmpty ||
                        controller.desc.text.isEmpty ||
                        controller.dietType.value.isEmpty ||
                        controller.cost.text.isEmpty ||
                        controller.category.value.isEmpty ||
                        controller.spiceSlider.value == '' ||
                        controller.servingSize.isEmpty)
                    ? MyTheme.buttontextColor
                    : MyTheme.buttontextchangeColor,
              ),
              // InkWell(
              //   onTap: () {
              //     if (controller.isEditing)
              //       controller.editFoodItem(controller.foodItemModel!.id);
              //     else
              //       controller.addFoodItem();
              //   },
              //   child: Container(
              //     height: 40.11,
              //     decoration: BoxDecoration(
              //       color: Color(0xff7A7E83),
              //       borderRadius: BorderRadius.all(Radius.circular(6)),
              //     ),
              //     child: Center(
              //       child: Text(
              //         'CONTINUE',
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           fontSize: 17,
              //           fontWeight: FontWeight.w600,
              //           letterSpacing: -0.28,
              //           color: Color(0xffE5E5E5),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 5.89,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
