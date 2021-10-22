import 'dart:async';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';

class OnboardingPage2 extends StatefulWidget {
  static const id = "/onboarding2";
  OnboardingPage2({Key? key}) : super(key: key);

  @override
  State<OnboardingPage2> createState() => _OnboardingPage2State();
}

class _OnboardingPage2State extends State<OnboardingPage2> {
  final controller = Get.find<OnboardingController>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    controller.address1.addListener(() {
      setState(() {});
    });
    controller.address2.addListener(() {
      setState(() {});
    });
    controller.nearbylandnark.addListener(() {
      setState(() {});
    });
    controller.postalcode.addListener(() {
      setState(() {});
    });
    controller.latitude.addListener(() {
      setState(() {});
    });
    controller.longitude.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.address1.dispose();
    controller.address2.dispose();
    controller.nearbylandnark.dispose();
    controller.postalcode.dispose();
    controller.latitude.dispose();
    controller.latitude.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OnBoardingWrapper(
      onboardingController: controller,
      child: Scaffold(
        backgroundColor: MyTheme.appbackgroundColor,
        appBar: AppBar(
          backgroundColor: MyTheme.appbackgroundColor,
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
            'Partner Onboarding',
            style: TextStyle(
              fontSize: 17,
              letterSpacing: -0.226667,
              color: MyTheme.appbartextColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),

                  AppFormField(
                    title: "Restaurant Address",
                    hintText: "Address Line 1",
                    controller: controller.address1,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(6)),
                  ),

                  AppFormField(
                    title: '',
                    hintText: "Address Line 2",
                    controller: controller.address2,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(0)),
                  ),
                  AppFormField(
                    title: '',
                    hintText: "Nearby Landmark",
                    controller: controller.nearbylandnark,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(6)),
                    bottomText:
                        'Make sure it matches the name on your government ID',
                  ),

                  SizedBox(height: 20),

                  AppFormField(
                    title: "Postal Code",
                    hintText: "+91 XXXXXXXXXX",
                    controller: controller.postalcode,
                    inputType: TextInputType.number,
                    formatters: [FilteringTextInputFormatter.digitsOnly],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  FieldTitle(text: 'Locate Restaurant on Map'),

                  // RichText(

                  SizedBox(
                    height: 5,
                  ),
                  Container(
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
                                    controller.latitude.text =
                                        p0.latitude.toString();
                                    controller.longitude.text =
                                        p0.longitude.toString();
                                    final address =
                                        await geoCode.reverseGeocoding(
                                            latitude: p0.latitude,
                                            longitude: p0.longitude);

                                    controller.address1.text =
                                        address.streetAddress.toString();
                                    controller.address2.text =
                                        address.region.toString();
                                    controller.postalcode.text =
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
                  SizedBox(
                    height: 3,
                  ),
                  Text("Please locate restaurant on Map",
                      style: TextStyle(
                        fontSize: 9,
                        color: Color(0xff2F2E41),
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                      )),
                  SizedBox(
                    height: 20,
                  ),

                  AppFormField(
                    title: 'Latitude',
                    hintText: "Latitude",
                    isRequired: false,
                    controller: controller.latitude,
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  AppFormField(
                    title: 'Longitute',
                    hintText: "Longitute",
                    isRequired: false,
                    controller: controller.longitude,
                  ),

                  SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      formKey.currentState!.save();

                      if (formKey.currentState!.validate())
                        controller.onboardingApi(OnBoardingMethod.api2);
                    },
                    child: Container(
                      height: 40.11,
                      decoration: BoxDecoration(
                        color: (controller.address1.text.isEmpty ||
                                controller.address2.text.isEmpty ||
                                controller.nearbylandnark.text.isEmpty ||
                                controller.latitude.text.isEmpty ||
                                controller.longitude.text.isEmpty)
                            ? MyTheme.buttonColor
                            : MyTheme.buttonchangeColor,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Center(
                        child: Text(
                          'CONTINUE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.28,
                            color: MyTheme.buttontextColor,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 5.89,
                  ),
                ],
              ),
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
