import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:readyplates_restaurants/models/fooditem_model.dart';
import 'package:readyplates_restaurants/models/restaurant_model.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/src/home/screens/add_food_item.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/edit_button.dart';

class MenuPage extends StatelessWidget {
  MenuPage({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();
  List<String> categories = ["Starter", "Main Course", "Desserts", "Sides"];
  bool loading = false;

/*   void createProducts() async {
    Directory path = await getApplicationDocumentsDirectory();

    final folderPath = path.path + "/images";
    await Directory(folderPath).create();
    FoodItemModel foodItemModel = controller.foodItems.first;
    final res = await get(Uri.parse(getUrl(foodItemModel.image1)));

    File image1 = File(path.path + "/pic1.png");
    await image1.writeAsBytes(res.bodyBytes);

    for (var i = 0; i < 100; i++) {
      controller.name.text = "${i * 31}";
      controller.desc.text = "${i * 45}";
      controller.image1 = image1;
      controller.dietType.value = "Veg";
      controller.category.value = "Desserts";
      controller.servingSize = "Small";
      controller.servingcost.text = "";
      controller.servingname.text = "";
      controller.spiceSlider.value = 5;
      controller.cost.text = "45";
      controller.addFoodItem();
    }
  } */

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    var size = media.size;
    return Obx(
      () => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            InkWell(
              onTap: () async {
                //createProducts();
                controller.isEditing = false;
                controller.clearController();
                Get.toNamed(AddFoodItem.id);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(188, 202, 224, 0.4),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          spreadRadius: 0,
                        )
                      ]),
                  margin: EdgeInsets.all(7),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: DottedBorder(
                      child: Center(
                        child: Container(
                          height: 80,
                          // width: 160,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_circle_outline_sharp,
                                  color: Color(0xff393E46),
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Add Items to Menu",
                                  style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xff393E46),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      borderType: BorderType.RRect,
                      radius: Radius.circular(10),
                      dashPattern: [10, 5, 10, 5, 10, 5],
                    ),
                  ),
                ),
              ),
            ),
            if (controller.foodItems.length == 0)
              Center(
                child: Text(
                  "No FoodItem added yet",
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff393E46),
                  ),
                ),
              )
            else if (controller.foodItems.first.id == -1)
              Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            else
              for (var i = 0; i < categories.length; i++)
                Builder(
                  builder: (context) {
                    List<FoodItemModel> foods = controller.foodItems
                        .where((p0) => p0.category == categories[i])
                        .toList();
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (controller.foodItems
                              .any((p0) => p0.category == categories[i]))
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 16,
                                left: 16,
                              ),
                              child: Text(
                                categories[i].toUpperCase(),
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  color: MyTheme.text3Color,
                                ),
                              ),
                            ),
                          ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: foods
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color.fromRGBO(
                                                        188, 202, 224, 0.5),
                                                    offset: Offset(0, 4),
                                                    blurRadius: 6,
                                                    spreadRadius: 1,
                                                  )
                                                ]),
                                            margin: EdgeInsets.all(7),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox.square(
                                                    dimension:
                                                        size.width * 0.27,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              child:
                                                                  Image.network(
                                                                getUrl(
                                                                    e.image1),
                                                                fit: BoxFit
                                                                    .cover,
                                                                height:
                                                                    size.width *
                                                                        0.22,
                                                                width:
                                                                    size.width *
                                                                        0.22,
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                              alignment: Alignment
                                                                  .bottomCenter,
                                                              child: EditButton(
                                                                widthFraction:
                                                                    0.18,
                                                                onTap: () {
                                                                  controller
                                                                          .isEditing =
                                                                      true;
                                                                  controller
                                                                      .foodItemModel = e;
                                                                  controller
                                                                      .setEditing();
                                                                  Get.toNamed(
                                                                      AddFoodItem
                                                                          .id);
                                                                },
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: SizedBox(
                                                      height: size.width * 0.25,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          FittedBox(
                                                            fit: BoxFit
                                                                .scaleDown,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 16,
                                                                      top: 5),
                                                              child: Container(
                                                                width:
                                                                    size.width *
                                                                        0.5,
                                                                child: Text(
                                                                  e.name,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .montserrat(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontSize:
                                                                          16,
                                                                      color: MyTheme
                                                                          .text1Color,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 4,
                                                          ),
                                                          Container(
                                                            height: 45,
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            16),
                                                                child: Text(
                                                                  e.description,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .montserrat(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontSize:
                                                                          9,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .clip,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Row(
                                                            children: [
                                                              e.diet_type == "1"
                                                                  ? SvgPicture
                                                                      .asset(
                                                                      "assets/images/vegan.svg",
                                                                      height:
                                                                          20,
                                                                      width: 20,
                                                                    )
                                                                  : Image.asset(
                                                                      ("assets/images/veg.png"),
                                                                      color: e.diet_type ==
                                                                              "2"
                                                                          ? Color(
                                                                              0xffBC580B)
                                                                          : null,
                                                                      height:
                                                                          20,
                                                                      width: 20,
                                                                    ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              ...List.generate(
                                                                double.parse(e
                                                                        .spice_level)
                                                                    .toInt(),
                                                                (index) =>
                                                                    Image.asset(
                                                                  'assets/images/spice.png',
                                                                ),
                                                              ),
                                                              Spacer(),
                                                              Text(
                                                                "\$ " + e.cost,
                                                                style:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontSize:
                                                                      size.width *
                                                                          0.04,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  color: MyTheme
                                                                      .priceColor,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 20,
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          StatefulBuilder(
                                              builder: (context, st) {
                                            return Align(
                                              alignment: Alignment.topRight,
                                              child: InkWell(
                                                onTap: () async {
                                                  loading = true;
                                                  st(() {});
                                                  await controller.delete(e.id);

                                                  loading = false;
                                                  st(() {});
                                                },
                                                child: loading
                                                    ? Container(
                                                        decoration: ShapeDecoration(
                                                            color: Colors.red,
                                                            shape:
                                                                CircleBorder()),
                                                        height: 20,
                                                        width: 20,
                                                        padding:
                                                            EdgeInsets.all(3),
                                                        child:
                                                            CircularProgressIndicator(
                                                          strokeWidth: 2,
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                      Color>(
                                                                  Colors.white),
                                                        ),
                                                      )
                                                    : Container(
                                                        padding:
                                                            EdgeInsets.all(2),
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color:
                                                                    Colors.red),
                                                        child: Icon(
                                                          Icons.delete_forever,
                                                          color: Colors.white,
                                                          size: 15,
                                                        ),
                                                      ),
                                              ),
                                            );
                                          })
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList()),
                        ]);
                  },
                )
            /*  ...controller.foodItems
                        .where((p0) => p0.category == categories[i])
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              188, 202, 224, 0.5),
                                          offset: Offset(0, 4),
                                          blurRadius: 6,
                                          spreadRadius: 1,
                                        )
                                      ]),
                                  margin: EdgeInsets.all(7),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox.square(
                                          dimension: size.width * 0.27,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      getUrl(e.image1),
                                                      fit: BoxFit.cover,
                                                      height: size.width * 0.22,
                                                      width: size.width * 0.22,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: EditButton(
                                                      widthFraction: 0.18,
                                                      onTap: () {
                                                        controller.isEditing =
                                                            true;
                                                        controller
                                                            .foodItemModel = e;
                                                        controller.setEditing();
                                                        Get.toNamed(
                                                            AddFoodItem.id);
                                                      },
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            height: size.width * 0.25,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 16, top: 5),
                                                    child: Container(
                                                      width: size.width * 0.5,
                                                      child: Text(
                                                        e.name,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 16,
                                                            color: MyTheme
                                                                .text1Color,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Container(
                                                  height: 45,
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 16),
                                                      child: Text(
                                                        e.description,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 9,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                Row(
                                                  children: [
                                                    e.diet_type == "1"
                                                        ? SvgPicture.asset(
                                                            "assets/images/vegan.svg",
                                                            height: 20,
                                                            width: 20,
                                                          )
                                                        : Image.asset(
                                                            ("assets/images/veg.png"),
                                                            color: e.diet_type ==
                                                                    "2"
                                                                ? Color(
                                                                    0xffBC580B)
                                                                : null,
                                                            height: 20,
                                                            width: 20,
                                                          ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    ...List.generate(
                                                      double.parse(
                                                              e.spice_level)
                                                          .toInt(),
                                                      (index) => Image.asset(
                                                        'assets/images/spice.png',
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Text(
                                                      "\$ " + e.cost,
                                                      style: GoogleFonts.inter(
                                                        fontSize:
                                                            size.width * 0.04,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color:
                                                            MyTheme.priceColor,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () async {
                                      await controller.delete(e.id);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red),
                                      child: Icon(
                                        Icons.delete_forever,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ), */
          ],
        ),
      ),
    );
  }
}
