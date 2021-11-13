import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';

class CitySelectorSheet extends GetView<OnboardingController> {
  CitySelectorSheet({Key? key}) : super(key: key);
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                onChanged: (value) {
                  controller.searchState(value);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Search Any State",
                    hintStyle: GoogleFonts.inter(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: const EdgeInsets.only(top: 27, left: 10),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 22,
                      ),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(
            () => Expanded(
              child: Scrollbar(
                controller: scrollController,
                hoverThickness: 15,
                interactive: true,
                isAlwaysShown: true,
                child: ListView.builder(
                  controller: scrollController,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.rxStates.length,
                  itemBuilder: (context, index) {
                    return Obx(() => ExpansionTile(
                          childrenPadding: EdgeInsets.symmetric(horizontal: 10),
                          maintainState: false,
                          title: Text(
                            controller.rxStates[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          children: controller.rxStates[index].city.isNotEmpty
                              ? [
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextField(
                                        onChanged: (value) {
                                          controller.search(
                                              controller.rxStates[index].id,
                                              value);
                                        },
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            hintText:
                                                "Search cities in ${controller.rxStates[index].name}",
                                            hintStyle: GoogleFonts.inter(
                                              fontSize: 15,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    top: 27, left: 10),
                                            suffixIcon: Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              child: Icon(
                                                Icons.search,
                                                color: Colors.grey,
                                                size: 22,
                                              ),
                                            )),
                                      ),
                                    ),
                                  ),
                                  ...controller.rxStates[index].city
                                      .map((e) => ListTile(
                                            title: Text(e.name),
                                            onTap: () {
                                              controller.rescity = e.name +
                                                  ", " +
                                                  controller
                                                      .rxStates[index].name;
                                              Get.back();
                                            },
                                          ))
                                      .toList()
                                ]
                              : [
                                  ListTile(
                                    onTap: () {
                                      controller.rescity =
                                          controller.rxStates[index].name;
                                      Get.back();
                                    },
                                    title:
                                        Text(controller.rxStates[index].name),
                                  )
                                ],
                        ));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
