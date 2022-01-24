import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readyplates_restaurants/models/restaurant_model.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/dropdowncategory.dart';
import 'package:readyplates_restaurants/widgets/dropdowndiettype.dart';
import 'package:readyplates_restaurants/widgets/dropdownstandard.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';

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
        // setState(() {});
      }
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    formKey.currentState?.save();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      setState(() {
        print("State Changed");
      });
    });
    super.initState();
  }

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
              color: MyTheme.orangeColor,
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
            color: MyTheme.orangeColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                          border: Border.all(
                            width: 1,
                            color: MyTheme.borderchangeColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              border: Border.all(
                                width: 1,
                                color: MyTheme.borderchangeColor,
                              ),
                            ),
                            child: Center(
                              child: Container(
                                child: controller.isEditing
                                    ? controller.image1.path == ""
                                        ? Image.network(
                                            getUrl(controller
                                                .foodItemModel!.image1),
                                            fit: BoxFit.cover,
                                          )
                                        : Image.file(
                                            controller.image1,
                                            fit: BoxFit.cover,
                                          )
                                    : controller.image1.path == ""
                                        ? Image.asset(
                                            'assets/images/imglogo.png',
                                            color: MyTheme.borderchangeColor,
                                            fit: BoxFit.cover,
                                            width: 60,
                                            height: 60,
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
                              color: controller.dietType.value == ""
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
                  color: controller.category.value == ""
                      ? MyTheme.borderColor
                      : MyTheme.borderchangeColor,
                  value: controller.category.value == ""
                      ? null
                      : controller.category.value,
                  onSelect: (p0) {
                    controller.category.value = p0!;
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                controller.category.value == 'Desserts'
                    ? Container()
                    : FieldTitle(
                        text: "Spice Level",
                        required: false,
                        fontFamily: 'Inter-Regular',
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                controller.category.value == 'Desserts'
                    ? Container()
                    : Padding(
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
                            activeColor: MyTheme.orangeColor,
                            thumbColor: Colors.white,
                            inactiveColor: MyTheme.sliderColor,
                          ),
                        ),
                      ),
                controller.category.value == 'Desserts'
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            5,
                            (index) => Text(
                              ("${index + 1}").toString(),
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: MyTheme.labelColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                controller.category.value == 'Desserts'
                    ? Container()
                    : SizedBox(
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
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 22,
                ),
                OnboardingButton(
                  height: 50,
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
                      ? MyTheme.verifyButtonColor
                      : MyTheme.orangeColor,
                  text: 'CONTINUE',
                  buttontextColor: (controller.image1.path.isEmpty ||
                          controller.name.text.isEmpty ||
                          controller.desc.text.isEmpty ||
                          controller.dietType.value.isEmpty ||
                          controller.cost.text.isEmpty ||
                          controller.category.value.isEmpty ||
                          controller.spiceSlider.value == '' ||
                          controller.servingSize.isEmpty)
                      ? MyTheme.verifyTextColor
                      : MyTheme.appbackgroundColor,
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
