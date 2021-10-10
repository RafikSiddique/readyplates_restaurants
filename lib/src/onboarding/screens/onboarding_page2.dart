import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';

class OnboardingPage2 extends StatefulWidget {
  static const id = "/onboarding2";
  const OnboardingPage2({Key? key}) : super(key: key);

  @override
  State<OnboardingPage2> createState() => _OnboardingPage2State();
}

class _OnboardingPage2State extends State<OnboardingPage2> {
  final controller = Get.find<OnboardingController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
            'Partner Onboarding',
            style: TextStyle(
              fontSize: 17,
              letterSpacing: -0.226667,
              color: Color(0xff393E46),
            ),
          ),
        ),
        //backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: RichText(
                    text: TextSpan(
                        text: 'Restaurant Address',
                        style: TextStyle(
                          fontSize: 13,
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
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(left: 17, right: 15),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: controller.address1Controller,
                    decoration: InputDecoration(
                      hintText: "Address Line 1",
                      hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7)),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, color: Color(0xffE0E0E0)),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(left: 17, right: 15),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: controller.address2Controller,
                    decoration: InputDecoration(
                      hintText: "Address Line 2",
                      hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7)),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Color(0xffE0E0E0)),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(left: 17, right: 15),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: controller.nearbylandnarkController,
                    decoration: InputDecoration(
                      hintText: "Nearby Landmark",
                      hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7)),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, color: Color(0xffE0E0E0)),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(6),
                          bottomRight: Radius.circular(6),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text(
                      "Make sure it matches the name on your government ID",
                      style: TextStyle(
                        fontSize: 9,
                        color: Color(0xff2F2E41),
                      )),
                ),
                SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: RichText(
                    text: TextSpan(
                        text: 'Postal Code',
                        style: TextStyle(
                          fontSize: 13,
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
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(
                    left: 17,
                    right: 17,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: controller.postalcodeController,
                    decoration: InputDecoration(
                      hintText: "xxxxxxx",
                      hintStyle: TextStyle(
                          fontSize: 15,
                          letterSpacing: -0.264706,
                          color: Color(0xff2F2E41).withOpacity(0.7)),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: RichText(
                    text: TextSpan(
                        text: 'Locate Restaurant on Map ',
                        style: TextStyle(
                          fontSize: 13,
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
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 17,
                    right: 17,
                  ),
                  height: 159,
                  child: FutureBuilder<Position>(
                      future: Geolocator.getCurrentPosition(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasError && snapshot.data != null) {
                          return OpenContainer(
                            transitionDuration: Duration(milliseconds: 500),
                            closedBuilder: (context, action) {
                              return IgnorePointer(
                                child: SelectLocation(
                                  latLng: LatLng(snapshot.data!.latitude,
                                      snapshot.data!.longitude),
                                  setLocation: (p0) {},
                                ),
                              );
                            },
                            openBuilder: (context, action) {
                              return SelectLocation(
                                isOpen: true,
                                latLng: LatLng(snapshot.data!.latitude,
                                    snapshot.data!.longitude),
                                setLocation: (p0) async {
                                  GeoCode geoCode = GeoCode();
                                  controller.latitudeController.text =
                                      p0.latitude.toString();
                                  controller.longitudeController.text =
                                      p0.longitude.toString();
                                  final address =
                                      await geoCode.reverseGeocoding(
                                          latitude: p0.latitude,
                                          longitude: p0.longitude);

                                  controller.address1Controller.text =
                                      address.streetAddress.toString();
                                  controller.address2Controller.text =
                                      address.region.toString();
                                  controller.postalcodeController.text =
                                      address.postal.toString();
                                },
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text("Please locate restaurant on Map",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff2F2E41),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text("Latitude",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff2F2E41),
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(
                    left: 17,
                    right: 17,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: controller.latitudeController,
                    decoration: InputDecoration(
                      fillColor: Color(0xFFE6E6E6),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Text("Longitude",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff2F2E41),
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(
                    left: 17,
                    right: 17,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: controller.longitudeController,
                    decoration: InputDecoration(
                      fillColor: Color(0xFFE6E6E6),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 17, right: 15),
                  child: SizedBox(
                    height: 54,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff7A7E83),
                          side: BorderSide(
                              width: 1.5,
                              color: Color.fromRGBO(255, 255, 255, 0.5)),
                        ),
                        onPressed: () async {
                          formKey.currentState!.save();
                          await controller.onboardingapi2();
                        },
                        child: Text('CONTINUE',
                            style: TextStyle(
                              color: Color(0xffE5E5E5),
                              fontSize: 17,
                            ))),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SelectLocation extends StatefulWidget {
  final LatLng latLng;
  final Function(LatLng) setLocation;
  final bool isOpen;
  SelectLocation({
    Key? key,
    this.isOpen = false,
    required this.latLng,
    required this.setLocation,
  }) : super(key: key);

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  late LatLng latLng = widget.latLng;

  Widget pin() {
    return IgnorePointer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.place, size: 56),
            Container(
              decoration: ShapeDecoration(
                shadows: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black38,
                  ),
                ],
                shape: CircleBorder(
                  side: BorderSide(
                    width: 4,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SizedBox(height: 56),
          ],
        ),
      ),
    );
  }

  GoogleMapController? controller;

  Completer<GoogleMapController> completer = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: widget.latLng, zoom: 18),
            onMapCreated: (controller) {
              this.controller = controller;
              completer.complete(this.controller);
            },
            onCameraMove: (position) {
              latLng = position.target;
            },
            zoomControlsEnabled: widget.isOpen,
            zoomGesturesEnabled: widget.isOpen,
            myLocationButtonEnabled: widget.isOpen,
            rotateGesturesEnabled: widget.isOpen,
            onCameraIdle: () {},
          ),
          pin(),
          if (widget.isOpen)
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(FontAwesomeIcons.chevronLeft)),
                  IconButton(
                      onPressed: () {
                        widget.setLocation(latLng);
                        Get.back();
                      },
                      icon: Icon(Icons.check))
                ],
              ),
            )
        ],
      ),
    );
  }
}
