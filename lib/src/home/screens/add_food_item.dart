import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
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
  bool isVisible = true;
  bool isaccept = true;
  void pickImage({
    required void Function(File) imageFile,
  }) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      File? croppedFile = await ImageCropper.cropImage(
        sourcePath: file.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        aspectRatioPresets: [CropAspectRatioPreset.square],
        cropStyle: CropStyle.rectangle,
      );
      if (croppedFile != null) {
        imageFile(croppedFile);
      }
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
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
          style: GoogleFonts.inter(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: MyTheme.appbartextColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Form(
            key: formKey,
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
                Center(
                  child: InkWell(
                    onTap: () {
                      pickImage(
                        imageFile: (p0) {
                          controller.image1 = p0;
                          setState(() {});
                        },
                      );
                    },
                    child: SizedBox.square(
                      dimension: size.width * 0.9,
                      child: Container(
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
                          child: Container(
                            child: controller.isEditing
                                ? Image.network(
                                    getUrl(controller.foodItemModel!.image1),
                                    fit: BoxFit.cover,
                                  )
                                : controller.image1.path == ""
                                    ? Image(
                                        image: AssetImage(
                                          'assets/images/imglogo.png',
                                        ),
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.file(
                                        controller.image1,
                                        fit: BoxFit.cover,
                                      ),
                          ),
                        ),
                      ),
                    ),
                  ),
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
                  title: 'Description',
                  hintText: 'Food Item Description',
                  hintfontSize: 15,
                  controller: controller.desc,
                  bottomText: 'Max 20 Words',
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                                setState(() {});
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
                                  inputType: TextInputType.number,
                                  formatters: [
                                    FilteringTextInputFormatter
                                        .singleLineFormatter,
                                  ],
                                  controller: controller.cost),
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
                    children: List.generate(
                        5, (index) => Text((index + 1).toString())),
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
                  style: GoogleFonts.poppins(
                    fontSize: 9,
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
                Visibility(
                  visible: isVisible,
                  child: Container(
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
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
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
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: -0.229412,
                                  color: Color(0xff393E46),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      borderType: BorderType.RRect,
                      radius: Radius.circular(10),
                      dashPattern: [10, 5, 10, 5, 10, 5],
                    ),
                  ),
                  replacement: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: AppFormField(
                              title: 'Configration/Serving Name*',
                              hintText: 'small',
                              isRequired: false,
                              hintfontSize: 15,
                              controller: controller.servingname,
                              bottomText: 'Please type  name of configuration',
                            )),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: AppFormField(
                                title: 'Serving Cost',
                                hintText: '9.50 \$',
                                isRequired: false,
                                hintfontSize: 15,
                                controller: controller.servingcost,
                                bottomText: 'Enter Cost',
                              ),
                            ),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: isaccept,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: Size.fromHeight(45.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    side: BorderSide(
                                        width: 1,
                                        color: MyTheme.dropdownarrowColor),
                                  ),
                                  icon: Icon(
                                    Icons.check_circle_outline_outlined,
                                    color: MyTheme.borderchangeColor,
                                    size: 16,
                                  ),
                                  label: Text(
                                    'Accept',
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                      color: MyTheme.dropdownarrowColor,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: OutlinedButton.icon(
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: Size.fromHeight(45.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    side: BorderSide(
                                        width: 1,
                                        color: MyTheme.dropdownarrowColor),
                                  ),
                                  icon: FaIcon(
                                    FontAwesomeIcons.timesCircle,
                                    color: MyTheme.closeiconColor,
                                    size: 16,
                                  ),
                                  label: Text(
                                    'Cancel',
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                      color: MyTheme.dropdownarrowColor,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  },
                                ),
                              ),
                            ]),
                        // replacement: replace, TODO:
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                OnboardingButton(
                  onTap: () {
                    formKey.currentState?.save();

                    if (formKey.currentState?.validate() ?? false) {
                      if (controller.isEditing)
                        controller.editFoodItem(controller.foodItemModel!.id);
                      else
                        controller.addFoodItem();
                    }
                  },
                  buttonbackgroundColor: (controller.image1.path.isEmpty ||
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
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
