import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readyplates_restaurants/src/onboarding/onboarding_controller.dart';
import 'package:readyplates_restaurants/utils/my_color.dart';
import 'package:readyplates_restaurants/utils/place_search.dart';
import 'package:readyplates_restaurants/widgets/field_title.dart';
import 'package:readyplates_restaurants/widgets/form_field.dart';
import 'package:readyplates_restaurants/widgets/onboardingWrapper.dart';
import 'package:readyplates_restaurants/widgets/onboardingbutton.dart';
import 'package:uuid/uuid.dart';

class OnboardingPage2 extends StatefulWidget {
  static const id = "/onboarding2";
  OnboardingPage2({Key? key}) : super(key: key);

  @override
  State<OnboardingPage2> createState() => _OnboardingPage2State();
}

class _OnboardingPage2State extends State<OnboardingPage2> {
  final controller = Get.find<OnboardingController>();

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),

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
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
              ),
              AppFormField(
                title: '',
                hintText: "Nearby Landmark",
                hintfontSize: 15,
                controller: controller.nearbylandnark,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(6)),
                bottomText:
                    'Make sure it matches the name on your government ID',
              ),

              SizedBox(height: 20),

              AppFormField(
                title: "Postal Code",
                hintText: "XXXXXX",
                hintfontSize: 15,
                controller: controller.postalcode,
                inputType: TextInputType.number,
                formatters: [FilteringTextInputFormatter.digitsOnly],
              ),

              SizedBox(
                height: 20,
              ),
              FieldTitle(
                text: 'Locate Restaurant on Map',
              ),

              // RichText(

              SizedBox(
                height: 5,
              ),
              Expanded(
                child: FutureBuilder<Position>(
                    future: Geolocator.getCurrentPosition(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasError && snapshot.data != null) {
                        return SelectLocation(
                          isOpen: true,
                          latLng: LatLng(snapshot.data!.latitude,
                              snapshot.data!.longitude),
                          setLocation: (p0) async {
                            GeoCode geoCode = GeoCode();
                            controller.latitude.text = p0.latitude.toString();
                            controller.longitude.text = p0.longitude.toString();
                            final address = await geoCode.reverseGeocoding(
                                latitude: p0.latitude, longitude: p0.longitude);

                            controller.address1.text =
                                address.streetAddress.toString();
                            controller.address2.text =
                                address.region.toString();
                            controller.postalcode.text =
                                address.postal.toString();
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
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
              OnboardingButton(
                onTap: () {
                  formKey.currentState!.save();

                  if (formKey.currentState!.validate())
                    controller.onboardingApi(OnBoardingMethod.api2);
                },
                buttonbackgroundColor: (controller.address1.text.isEmpty ||
                        controller.address2.text.isEmpty ||
                        controller.nearbylandnark.text.isEmpty ||
                        controller.latitude.text.isEmpty ||
                        controller.longitude.text.isEmpty)
                    ? MyTheme.buttonColor
                    : MyTheme.buttonchangeColor,
                text: 'CONTINUE',
                buttontextColor: (controller.address1.text.isEmpty ||
                        controller.address2.text.isEmpty ||
                        controller.nearbylandnark.text.isEmpty ||
                        controller.latitude.text.isEmpty ||
                        controller.longitude.text.isEmpty)
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
                  controller?.animateCamera(CameraUpdate.newLatLngZoom(
                      LatLng(position.latitude, position.longitude), 18));
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
              width: MediaQuery.of(context).size.width * 0.6,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: TypeAheadField<Suggestion>(
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Search Any Location",
                        hintStyle: GoogleFonts.inter(
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                        ),
                        contentPadding:
                            const EdgeInsets.only(top: 27, left: 10),
                        suffixIcon: Padding(
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
                      title: Text(itemData.description.toString()),
                    );
                  },
                  onSuggestionSelected: (Suggestion? suggestion) async {
                    final session = Uuid().v4();

                    Place place = await PlaceApiProvider(session)
                        .getPlaceDetailFromId(suggestion!.placeId);
                    controller?.animateCamera(CameraUpdate.newLatLng(
                        LatLng(place.lat!, place.lang!)));
                  },
                  suggestionsCallback: (String pattern) async {
                    final session = Uuid().v4();
                    return PlaceApiProvider(session)
                        .fetchSuggestions(pattern, 'en');
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
