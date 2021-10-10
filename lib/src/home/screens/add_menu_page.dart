import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/home/screens/add_food_item.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Get.toNamed(AddFoodItem.id);
            },
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xffFFFFFF),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 11, right: 11, top: 9, bottom: 9),
                child: DottedBorder(
                  child: Center(
                    child: Container(
                      height: 20,
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
        ],
      ),
    );
  }
}
