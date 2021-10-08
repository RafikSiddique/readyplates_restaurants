import 'package:readyplates_restaurants/utils/api_services.dart';
import 'package:readyplates_restaurants/utils/exception.dart';
import 'package:http/http.dart';

class OnboardingServices extends ApiServices {
  Future<bool> uploadImages(List<String> files, int index) async {
    try {
      
      List<List<String>> fields = [
        ["front_fascia_day", "front_fascia_night", "street_view", "entrance"],
        ["ambience1", "ambience2", "ambience3", "ambience4"],
        ["food1", "food2", "food3", "food4"],
        ["cv19prec1", "cv19prec2", "cv19prec3", "cv19prec4"]
      ];
      List<MultipartFile> multipartFiles = [];

      for (int i = 0; i < files.length; i++) {
        MultipartFile multipartFile =
            await MultipartFile.fromPath(fields[index][i], files[i]);
        multipartFiles.add(multipartFile);
      }
      MultipartRequest request =
          MultipartRequest('POST', onboarding(index + 7));
      request.files.addAll(multipartFiles);
      request.fields.addAll({'user': "31"});
      StreamedResponse response = await request.send();
      if (response.statusCode == 201) {
        String body = await response.stream.bytesToString();
        print(body);
        return true;
      } else {
        throw AppException();
      }
    } catch (e) {
      throw AppException(message: e.toString());
    }
  }
}
