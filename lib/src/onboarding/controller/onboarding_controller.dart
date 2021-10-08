import 'package:get/get.dart';
import 'package:readyplates_restaurants/src/onboarding/services/onboarding_services.dart';

class OnBoardingController extends GetxController {
  RxInt pageIndex = 0.obs;

  List<List<String>> allImages() => [
        demoFasciaImages, //0
        demoAmbienceImages,
        demoFoodImages,
        demoPrecautionImage
      ];

  List<List<String>> allNames() =>
      [demoFasciaNames, demoAmbienceName, demoFoodName, demoPrecautionName];

  List<List<String>> allSelectionImage() => [
        fasciaImages,
        ambienceImages,
        foodImages,
        covidProtocol,
      ];
  List<String> demoFasciaImages = [
    "assets/images/frontfascia.png", //0//0 ===
    "assets/images/StreetView.png", //0 //1 ===
    "assets/images/FrontFasciaDaytime.png", //0 //2
    "assets/images/RestaurantEntrance.png" //0 //3
  ];

  List<String> demoFasciaNames = [
    "Front Fascia (Night)",
    "Street View",
    "Front Fascia (Daytime)",
    "Restaurant Entrance",
  ];

  List<String> demoAmbienceImages = [
    "assets/images/ambience1.png", //1 //0 ===
    "assets/images/ambience2.png", //1 //1
    "assets/images/Restaurant ambience.png",
    "assets/images/ambience4.png",
  ];

  List<String> demoAmbienceName =
      List.generate(4, (index) => "Ambience ${index + 1}");

  List<String> demoFoodImages = List.generate(
    4,
    (index) => "assets/images/Food${index + 1}.png",
  );

  List<String> demoFoodName = List.generate(4, (index) => "Food ${index + 1}");

  List<String> demoPrecautionImage =
      List.generate(4, (index) => "assets/images/covid${index + 1}.png");

  List<String> selectedImages = [
    "assets/images/frontfascia.png", //0
    "assets/images/ambience1.png", //1
    "assets/images/Food1.png",
    "assets/images/covid1.png",
  ];

  List<String> demoPrecautionName =
      List.generate(4, (index) => "Covid-19 Precautions ${index + 1}");

  List<String> fasciaImages = List.generate(4, (index) => "");
  List<String> ambienceImages = List.generate(4, (index) => "");
  List<String> foodImages = List.generate(4, (index) => "");
  List<String> covidProtocol = List.generate(4, (index) => "");

  List<String> titleText = [
    'Restaurant Fascia Images', //0
    "Restaurant Ambience Images", //1
    'Food Dishes Images', //2
    'Restaurant COVID-19 protocol Images' //3
  ];

  OnboardingServices onboardingServices = OnboardingServices();
  RxBool imageLoading = false.obs;
  Future<void> uploadImage(List<String> files) async {
    try {
      imageLoading.value = true;
      await onboardingServices.uploadImages(files, pageIndex.value);
      imageLoading.value = false;
    } catch (e) {
      
    }
  }
}
