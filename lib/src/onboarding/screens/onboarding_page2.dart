import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_geocoding/google_geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/utils/place_search.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';
import 'package:uuid/uuid.dart';

class OnboardingPage2 extends StatefulWidget {
  static const id = "/onboarding2";
  final LatLng latLng;
  OnboardingPage2({Key? key, required this.latLng}) : super(key: key);

  @override
  State<OnboardingPage2> createState() => _OnboardingPage2State();
}

class _OnboardingPage2State extends State<OnboardingPage2> {
  final controller = Get.find<OnboardingController>();
  GeoCode geoCode = GeoCode();
  String googleApiKey = "AIzaSyDR2to-aBls8N4Wqa4xt3Et5vk2GkVF2Do";
  late GoogleGeocoding _geoCoding = GoogleGeocoding(googleApiKey);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isMapKeyboard = false;
  int a = 0;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    if (a == 0) if (media.viewInsets.bottom == 0) {
      isMapKeyboard = false;
    }
    return OnBoardingWrapper(
      appBarTitle: 'Partner Onboarding',
      onboardingController: controller,
      child: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),

                FieldTitle(
                  text: 'Locate Restaurant on Map',
                ),

                // RichText(

                SizedBox(
                  height: 5,
                ),
                Container(
                  height: Get.height * 0.4,
                  child: SelectLocation(
                    isOpen: true,
                    latLng: widget.latLng,
                    setLocation: (p0) async {
                      controller.latitude.text = p0.latitude.toStringAsFixed(6);
                      controller.longitude.text =
                          p0.longitude.toStringAsFixed(6);
                      try {
                        GeocodingResponse? results = await _geoCoding.geocoding
                            .getReverse(LatLon(p0.latitude, p0.longitude));
                        if (results != null &&
                            results.results != null &&
                            results.results!.isNotEmpty) {
                          GeocodingResult res = results.results![0];
                          String? currentAddress = res.formattedAddress;
                          if (currentAddress == null) {
                            final address = await geoCode.reverseGeocoding(
                                latitude: p0.latitude, longitude: p0.longitude);
                            controller.address1.text =
                                address.streetAddress.toString();
                            controller.address2.text =
                                address.region.toString();
                            controller.postalcode.text =
                                address.postal.toString();
                          } else {
                            print(res);
                            if (res.addressComponents != null) {
                              res.addressComponents!.forEach((element) {
                                print(element.longName);
                                print(element.types);
                              });
                              List<String?> address1Text = res
                                  .addressComponents!
                                  .where((element) =>
                                      element.types!.contains('sublocality') ||
                                      element.types!.contains('premise') ||
                                      element.types!.contains('plus_code') ||
                                      element.types!.contains('neighborhood'))
                                  .toList()
                                  .map((e) => e.longName)
                                  .toList();
                              String data = address1Text.join(', ');
                              controller.address1.text = data;

                              List<String?> address2Text = res
                                  .addressComponents!
                                  .where((element) =>
                                      element.types!.contains('locality') ||
                                      element.types!.any((element) => element
                                          .contains('administrative_area')))
                                  .map((e) => e.longName)
                                  .toList();
                              controller.address2.text =
                                  address2Text.join(', ');
                              controller.postalcode.text = res
                                  .addressComponents!
                                  .firstWhere((element) =>
                                      element.types!.contains('postal_code'))
                                  .longName
                                  .toString();
                            } else {
                              controller.address1.text = currentAddress;
                            }

                            print(res.postcodeLocalities);
                          }
                        }
                      } catch (e) {
                        print(e);
                        final address = await geoCode.reverseGeocoding(
                            latitude: p0.latitude, longitude: p0.longitude);
                        controller.address1.text =
                            address.streetAddress.toString();
                        controller.address2.text = address.region.toString();
                        controller.postalcode.text = address.postal.toString();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text("Please locate restaurant on Map",
                    style: GoogleFonts.poppins(
                      fontSize: 9,
                      color: MyTheme.bottomtextColor,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                    )),
                SizedBox(height: 20),

                AppFormField(
                  title: "Restaurant Address",
                  hintText: "Address Line 1",
                  hintfontSize: 15,
                  controller: controller.address1,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
                ),

                AppFormField(
                  title: '',
                  hintText: "Address Line 2",
                  hintfontSize: 15,
                  controller: controller.address2,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(0)),
                ),
                AppFormField(
                  title: '',
                  hintText: "Nearby Landmark",
                  hintfontSize: 15,
                  controller: controller.nearbylandnark,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(6)),
                  bottomText:
                      'Make sure it matches the name on your government ID',
                ),

                SizedBox(height: 20),

                AppFormField(
                  title: "Postal Code",
                  hintText: "XXXXXX",
                  hintfontSize: 15,
                  controller: controller.postalcode,
                  inputType: TextInputType.phone,
                  formatters: [FilteringTextInputFormatter.digitsOnly],
                ),

                SizedBox(
                  height: 22,
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        formKey.currentState!.save();
        if (formKey.currentState!.validate())
          controller.onboardingApi(OnBoardingMethod.api2);
      },
      buttonText: 'CONTINUE',
      textControllers: [
        controller.address1,
        controller.address2,
        controller.nearbylandnark,
        controller.latitude,
        controller.longitude
      ],
    );
  }
}

class SelectLocation extends StatefulWidget {
  final LatLng latLng;
  final void Function(LatLng) setLocation;
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
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

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

  Widget mapButtons(IconData icon, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }

  final Completer<GoogleMapController> completer =
      Completer<GoogleMapController>();

  void updateCam(double lat, double lon) async {
    controller?.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lon), 18));
  }

  GoogleMapController? controller;
  @override
  Widget build(BuildContext context) {
    LatLng lg = widget.latLng;
    return Stack(
      alignment: Alignment.center,
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(target: lg, zoom: 18),
          onMapCreated: (ctr) {
            controller = ctr;
            completer.complete(controller);
            setState(() {});
          },
          onCameraMove: (position) {
            lg = position.target;
          },
          zoomControlsEnabled: false,
          zoomGesturesEnabled: true,
          myLocationButtonEnabled: false,
          tiltGesturesEnabled: true,
          rotateGesturesEnabled: widget.isOpen,
          onCameraIdle: () {
            widget.setLocation(lg);
          },
        ),
        pin(),
        Align(
            alignment: Alignment.centerRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                mapButtons(Icons.gps_fixed, () async {
                  Position position = await Geolocator.getCurrentPosition();
                  updateCam(position.latitude, position.longitude);
                }),
                SizedBox(
                  height: 10,
                ),
                mapButtons(Icons.add_circle_outline_outlined, () {
                  controller?.animateCamera(CameraUpdate.zoomIn());
                }),
                mapButtons(Icons.remove_circle_outline, () {
                  controller?.animateCamera(CameraUpdate.zoomOut());
                })
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: MyTheme.appbackgroundColor,
                  border: Border.all(color: MyTheme.orangeColor, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              width: MediaQuery.of(context).size.width * 0.6,
              child: TypeAheadField<Suggestion>(
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Any Location",
                      hintStyle: GoogleFonts.inter(
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: MyTheme.hinttextColor),
                      contentPadding: const EdgeInsets.only(top: 15, left: 10),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 22,
                        ),
                      )),
                ),
                itemBuilder: (BuildContext context, itemData) {
                  return ListTile(
                    onTap: () async {
                      final session = Uuid().v4();
                      Place place = await PlaceApiProvider(session)
                          .getPlaceDetailFromId(itemData.placeId);
                      updateCam(place.lat!, place.lang!);
                      FocusScope.of(context).unfocus();
                    },
                    title: Text(itemData.description.toString()),
                  );
                },
                onSuggestionSelected: (Suggestion? suggestion) async {
                  // FocusScope.of(context).unfocus();
                },
                suggestionsCallback: (String pattern) async {
                  if (pattern.isNotEmpty) {
                    final session = Uuid().v4();
                    return PlaceApiProvider(session)
                        .fetchSuggestions(pattern, 'en');
                  } else {
                    return <Suggestion>[];
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
