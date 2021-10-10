import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';

class OnboardingPage6 extends StatefulWidget {
  const OnboardingPage6({Key? key}) : super(key: key);

  @override
  State<OnboardingPage6> createState() => _OnboardingPage6State();
}

class _OnboardingPage6State extends State<OnboardingPage6> {
  final dobController = TextEditingController();
  final controller = Get.find<OnboardingController>();
  String dob = '';
  DateTime? _selectedEventDate;
  void showEventDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
      currentDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      controller.recurrenceTime = pickedDate;
      setState(() {
        _selectedEventDate = pickedDate;
      });
    });
  }

/* 
  void showMonthlyDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
      currentDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedMonthlyDate = pickedDate;
      });
    });
  }
 */
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 44,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              iconSize: 14.83,
              icon: FaIcon(
                FontAwesomeIcons.chevronLeft,
                color: Color(0xff000000),
              ),
              onPressed: () {
                Get.back();
              }),
          centerTitle: true,
          title: Text(
            'Restaurant Bio',
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Inter',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.226667,
              color: Color(0xff393E46),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Restaurant Description',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.229412,
                        color: Color(0xff2F2E41),
                      ),
                      children: [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffEB4132),
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  maxLines: 4,
                  controller: controller.resDescript,
                  cursorColor: Color(0xff00ADB5),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xffE0E0E0),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                    hintText:
                        'Founded in 1954, Burger King is the second largest fast food hamburger chain in the world. The original Home of the Whopper, our commitment to premium ingredients, signature recipes, and family-friendly dining experiences is what has defined our brand for more than 50 successful years.',
                    contentPadding: EdgeInsets.all(14),
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.264706,
                      color: Color(0x979797).withOpacity(0.7),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Max 50 words',
                  style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    letterSpacing: -0.229412,
                    color: Color(0xff6E6D7A),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Table Information',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.229412,
                        color: Color(0xff2F2E41),
                      ),
                      children: [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffEB4132),
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              border: Border.all(
                                width: 1,
                                color: Color(0xffE0E0E0),
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Obx(
                                  () => Text(
                                    (controller.noOfTables.value
                                                .toString()
                                                .length ==
                                            1
                                        ? controller.noOfTables.value
                                            .toString()
                                            .padLeft(2, "0")
                                        : controller.noOfTables.value
                                            .toString()),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.264706,
                                      color: Color(0xff979797).withOpacity(0.7),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox.square(
                                        dimension: 15,
                                        child: InkWell(
                                          onTap: () {
                                            controller.noOfTables++;
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            alignment: Alignment.center,
                                            child: FaIcon(
                                              FontAwesomeIcons.chevronUp,
                                              color: Color(0xff6E6D7A),
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox.square(
                                        dimension: 15,
                                        child: InkWell(
                                          onTap: () {
                                            controller.noOfTables--;
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            alignment: Alignment.center,
                                            child: FaIcon(
                                              FontAwesomeIcons.chevronDown,
                                              color: Color(0xff6E6D7A),
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Enter No of tables present',
                            style: TextStyle(
                              fontSize: 9,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              letterSpacing: -0.229412,
                              color: Color(0xff6E6D7A),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              border: Border.all(
                                width: 1,
                                color: Color(0xffE0E0E0),
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Obx(
                                  () => Text(
                                    (controller.noOfSeats.value
                                                .toString()
                                                .length ==
                                            1
                                        ? controller.noOfSeats.value
                                            .toString()
                                            .padLeft(2, "0")
                                        : controller.noOfSeats.value
                                            .toString()),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.264706,
                                      color: Color(0xff979797).withOpacity(0.7),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox.square(
                                        dimension: 15,
                                        child: InkWell(
                                          onTap: () {
                                            controller.noOfSeats++;
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            alignment: Alignment.center,
                                            child: FaIcon(
                                              FontAwesomeIcons.chevronUp,
                                              color: Color(0xff6E6D7A),
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox.square(
                                        dimension: 15,
                                        child: InkWell(
                                          onTap: () {
                                            controller.noOfSeats--;
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            alignment: Alignment.center,
                                            child: FaIcon(
                                              FontAwesomeIcons.chevronDown,
                                              color: Color(0xff6E6D7A),
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Max table size (No of persons)',
                            style: TextStyle(
                              fontSize: 9,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              letterSpacing: -0.229412,
                              color: Color(0xff6E6D7A),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Cost for two',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'Inter',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.229412,
                                  color: Color(0xff2F2E41),
                                ),
                                children: [
                                  TextSpan(
                                    text: ' *',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffEB4132),
                                    ),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Get.bottomSheet(BottomSheet(
                                onClosing: () {},
                                builder: (context) {
                                  return Card(
                                      margin: EdgeInsets.zero,
                                      child: ListView(
                                        shrinkWrap: true,
                                        children: List.generate(20, (index) {
                                          return (index + 1) * 50;
                                        })
                                            .map((e) => ListTile(
                                                  title: Text(e.toString()),
                                                  onTap: () {
                                                    controller.costFor2.value =
                                                        e;
                                                    Get.back();
                                                  },
                                                ))
                                            .toList(),
                                      ));
                                },
                              ));
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xffE0E0E0),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Obx(
                                    () => Text(
                                      controller.costFor2.value.toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.264706,
                                        color:
                                            Color(0xff979797).withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    '₹',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.264706,
                                      color: Color(0xff979797).withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Enter No of tables present',
                            style: TextStyle(
                              fontSize: 9,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              letterSpacing: -0.229412,
                              color: Color(0xff6E6D7A),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Serving time',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'Inter',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.229412,
                                  color: Color(0xff2F2E41),
                                ),
                                children: [
                                  TextSpan(
                                    text: ' *',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffEB4132),
                                    ),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Get.bottomSheet(BottomSheet(
                                onClosing: () {},
                                builder: (context) {
                                  return Card(
                                      margin: EdgeInsets.zero,
                                      child: ListView(
                                        shrinkWrap: true,
                                        children: List.generate(5, (index) {
                                          return (index + 1) * 30;
                                        })
                                            .map((e) => ListTile(
                                                  title: Text(e.toString() +
                                                      " Minutes"),
                                                  onTap: () {
                                                    controller
                                                        .servingTime.value = e;
                                                    Get.back();
                                                  },
                                                ))
                                            .toList(),
                                      ));
                                },
                              ));
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xffE0E0E0),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Obx(
                                    () => Text(
                                      controller.servingTime.value.toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.264706,
                                        color:
                                            Color(0xff979797).withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'mins',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.264706,
                                      color: Color(0xff979797).withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Enter average serving time for two',
                            style: TextStyle(
                              fontSize: 9,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              letterSpacing: -0.229412,
                              color: Color(0xff6E6D7A),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Recurring events (optional)',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.229412,
                    color: Color(0xff2F2E41),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              border: Border.all(
                                width: 1,
                                color: Color(0xffE0E0E0),
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 14),
                                    child: Text(
                                      _selectedEventDate == null
                                          ? 'Event Dates'
                                          : '${_selectedEventDate!.year}/${_selectedEventDate!.month}/${_selectedEventDate!.day}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Inter',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.264706,
                                        color:
                                            Color(0xff979797).withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 7.5),
                                    child: InkWell(
                                      onTap: () {
                                        showEventDate();
                                      },
                                      child: Container(
                                        width: 15,
                                        height: 15,
                                        child: Image(
                                            image: AssetImage(
                                                'assets/images/calendar.png')),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Enter No of tables present',
                            style: TextStyle(
                              fontSize: 9,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              letterSpacing: -0.229412,
                              color: Color(0xff6E6D7A),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              border: Border.all(
                                width: 1,
                                color: Color(0xffE0E0E0),
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.bottomSheet(BottomSheet(
                                  onClosing: () {},
                                  builder: (context) {
                                    return Card(
                                        margin: EdgeInsets.zero,
                                        child: ListView(
                                          shrinkWrap: true,
                                          children:
                                              ["Yearly", "Monthly", "Weekly"]
                                                  .map((e) => ListTile(
                                                        title: Text(e),
                                                        onTap: () {
                                                          controller
                                                              .selectedRecurrence
                                                              .value = e;
                                                          Get.back();
                                                        },
                                                      ))
                                                  .toList(),
                                        ));
                                  },
                                ));
                              },
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 14),
                                      child: Obx(
                                        () => Text(
                                          controller.selectedRecurrence.value
                                          /* _selectedMonthlyDate == null
                                              ? 'Monthly'
                                              : '${_selectedMonthlyDate!.year}/${_selectedMonthlyDate!.month}/${_selectedMonthlyDate!.day}' */
                                          ,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Inter',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.264706,
                                            color: Color(0xff979797)
                                                .withOpacity(0.7),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 7.5),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: 15,
                                          height: 15,
                                          child: Image(
                                              image: AssetImage(
                                                  'assets/images/calendar.png')),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Recurrance frequency',
                            style: TextStyle(
                              fontSize: 9,
                              fontFamily: 'Poppins',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              letterSpacing: -0.229412,
                              color: Color(0xff6E6D7A),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                //hgf

                Obx(
                  () => Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xffE0E0E0),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    (controller.eventstartHour
                                                    .toString()
                                                    .length ==
                                                1
                                            ? controller.eventstartHour
                                                .toString()
                                                .padLeft(2, "0")
                                            : controller.eventstartHour
                                                .toString()) +
                                        ":" +
                                        (controller.eventstartMinute
                                                    .toString()
                                                    .length ==
                                                1
                                            ? controller.eventstartMinute
                                                .toString()
                                                .padLeft(2, "0")
                                            : controller.eventstartMinute
                                                .toString()),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.264706,
                                      color: Color(0xff979797).withOpacity(0.7),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox.square(
                                        dimension: 15,
                                        child: InkWell(
                                          onTap: () {
                                            if (controller.eventstartMinute ==
                                                30) {
                                              if (controller.eventstartHour !=
                                                  12) {
                                                controller.eventstartHour + 1;
                                              }
                                              controller
                                                  .eventstartMinute.value = 00;
                                            } else {
                                              if (controller.eventstartHour !=
                                                  12)
                                                controller.eventstartMinute
                                                    .value = 30;
                                            }
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            alignment: Alignment.center,
                                            child: FaIcon(
                                              FontAwesomeIcons.chevronUp,
                                              color: Color(0xff6E6D7A),
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox.square(
                                        dimension: 15,
                                        child: InkWell(
                                          onTap: () {
                                            if (controller.eventstartMinute ==
                                                30) {
                                              controller
                                                  .eventstartMinute.value = 00;
                                            } else {
                                              if (controller.eventstartHour !=
                                                  0) {
                                                controller.eventstartMinute
                                                    .value = 30;
                                                controller.eventstartHour - 1;
                                              }
                                            }
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            alignment: Alignment.center,
                                            child: FaIcon(
                                              FontAwesomeIcons.chevronDown,
                                              color: Color(0xff6E6D7A),
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 35,
                                    width: 0,
                                    decoration: BoxDecoration(
                                      color: Color(0xffE0E0E0),
                                      border: Border.all(
                                        width: 1,
                                        color: Color(0xffE0E0E0),
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 19,
                                    child: Text(
                                      controller.eventendAmPm.value,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.264706,
                                        color:
                                            Color(0xff979797).withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(bottom: 4, top: 4),
                                        child: FaIcon(
                                          controller.eventstartAmPm.value ==
                                                  "AM"
                                              ? FontAwesomeIcons.chevronDown
                                              : FontAwesomeIcons.chevronUp,
                                          size: 13,
                                          color: Color(0xff6E6D7A),
                                        ),
                                      ),
                                      onTap: () {
                                        if (controller.eventstartAmPm.value ==
                                            "AM") {
                                          controller.eventstartAmPm.value =
                                              "PM";
                                        } else {
                                          controller.eventstartAmPm.value =
                                              "AM";
                                        }
                                      }),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Select start time  (hh:mm AM/PM)',
                              style: TextStyle(
                                fontSize: 9,
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                letterSpacing: -0.229412,
                                color: Color(0xff6E6D7A),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xffE0E0E0),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    (controller.eventendHour
                                                    .toString()
                                                    .length ==
                                                1
                                            ? controller.eventendHour
                                                .toString()
                                                .padLeft(2, "0")
                                            : controller.eventendHour
                                                .toString()) +
                                        ":" +
                                        (controller.eventendMinute
                                                    .toString()
                                                    .length ==
                                                1
                                            ? controller.eventendMinute
                                                .toString()
                                                .padLeft(2, "0")
                                            : controller.eventendMinute
                                                .toString()),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.264706,
                                      color: Color(0xff979797).withOpacity(0.7),
                                    ),
                                  ),

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox.square(
                                        dimension: 15,
                                        child: InkWell(
                                          onTap: () {
                                            if (controller.eventendMinute ==
                                                30) {
                                              if (controller.eventendHour !=
                                                  12) {
                                                controller.eventendHour + 1;
                                              }
                                              controller.eventendMinute.value =
                                                  00;
                                            } else {
                                              controller.eventendMinute.value =
                                                  30;
                                            }
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            alignment: Alignment.center,
                                            child: FaIcon(
                                              FontAwesomeIcons.chevronUp,
                                              color: Color(0xff6E6D7A),
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox.square(
                                        dimension: 15,
                                        child: InkWell(
                                          onTap: () {
                                            if (controller.eventendMinute ==
                                                30) {
                                              controller.eventendMinute.value =
                                                  00;
                                            } else {
                                              if (controller.eventendHour !=
                                                  0) {
                                                controller
                                                    .eventendMinute.value = 30;
                                                controller.eventendHour - 1;
                                              }
                                            }
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            alignment: Alignment.center,
                                            child: FaIcon(
                                              FontAwesomeIcons.chevronDown,
                                              color: Color(0xff6E6D7A),
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   width: 6,
                                  // ),
                                  Container(
                                    height: 35,
                                    width: 0,
                                    decoration: BoxDecoration(
                                      color: Color(0xffE0E0E0),
                                      border: Border.all(
                                        width: 1,
                                        color: Color(0xffE0E0E0),
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    height: 19,
                                    child: Text(
                                      controller.eventendAmPm.value,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.264706,
                                        color:
                                            Color(0xff979797).withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(bottom: 4, top: 4),
                                        child: FaIcon(
                                          controller.eventendAmPm.value == "AM"
                                              ? FontAwesomeIcons.chevronDown
                                              : FontAwesomeIcons.chevronUp,
                                          size: 13,
                                          color: Color(0xff6E6D7A),
                                        ),
                                      ),
                                      onTap: () {
                                        if (controller.eventendAmPm.value ==
                                            "AM") {
                                          controller.eventendAmPm.value = "PM";
                                        } else {
                                          controller.eventendAmPm.value = "AM";
                                        }
                                      }),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Event end time (hh:mm AM/PM)',
                              style: TextStyle(
                                fontSize: 9,
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                letterSpacing: -0.229412,
                                color: Color(0xff6E6D7A),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  child: TextFormField(
                    maxLines: 5,
                    controller: controller.eventDesc,
                    cursorColor: Color(0xff00ADB5),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xffE0E0E0),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                      ),
                      hintText: 'Event Description',
                      contentPadding: EdgeInsets.all(14),
                      hintStyle: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.264706,
                        color: Color(0x979797).withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Max 20 words',
                  style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    letterSpacing: -0.229412,
                    color: Color(0xff6E6D7A),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    controller.onboardingApi6();
                  },
                  child: Container(
                    // width: 343,
                    height: 40.11,
                    decoration: BoxDecoration(
                      color: Color(0xff7A7E83),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Center(
                      child: Text(
                        'CONTINUE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.28,
                          color: Color(0xffE5E5E5),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6.89,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
