import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/models/fooditem_model.dart';
import 'package:readyplates_restaurants/src/home/home_controller.dart';
import 'package:readyplates_restaurants/src/home/screens/add_food_item.dart';
import 'package:readyplates_restaurants/widgets/edit_button.dart';

class MenuPage extends StatelessWidget {
  MenuPage({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    var size = media.size;
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                controller.getFoodItems();
                Get.toNamed(AddFoodItem.id);
              },
              child: Card(
                /*               height: 80,
                width: MediaQuery.of(context).size.width, */
                elevation: 4,
                margin: EdgeInsets.all(7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                /* decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color(0xffFFFFFF),
                  ),
                ), */
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: DottedBorder(
                    child: Center(
                      child: Container(
                        height: 80,
                        width: 155,
                        child: Row(
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
                    ),
                    borderType: BorderType.RRect,
                    radius: Radius.circular(10),
                    dashPattern: [10, 5, 10, 5, 10, 5],
                  ),
                ),
              ),
            ),
            ...FoodItemModel.foodItems
                .map(
                  (e) => Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.all(7),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox.square(
                            dimension: size.width * 0.27,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        e.image,
                                        fit: BoxFit.cover,
                                        height: size.width * 0.22,
                                        width: size.width * 0.22,
                                      ),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: EditButton(
                                        widthFraction: 0.18,
                                        onTap: () {},
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      e.name,
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          fontSize: size.width * 0.05),
                                    ),
                                  ),
                                  Text(
                                    e.description,
                                    style: GoogleFonts.montserrat(
                                        fontSize: size.width * 0.03),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Image.asset((e.veg
                                          ? "assets/images/veg.png"
                                          : "assets/images/nonveg.png")),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      ...List.generate(
                                        e.spiceLevel,
                                        (index) => Image.asset(
                                          'assets/images/spice.png',
                                          color: index == 0
                                              ? Color(0xff25A244)
                                              : null,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        e.price,
                                        style: TextStyle(
                                          fontFamily: 'Inter-Bold',
                                          fontSize: size.width * 0.04,
                                          fontWeight: FontWeight.w500,
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
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
