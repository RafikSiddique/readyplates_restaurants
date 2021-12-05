import 'dart:convert';
import 'package:http/http.dart';
import 'package:readyplates_restaurants/models/orderitem_model.dart';
import 'package:readyplates_restaurants/utils/api_services.dart';
import 'package:readyplates_restaurants/utils/exception.dart';

class OrderServices extends ApiServices {
  Future<List<OrderModelApi>> getOrder(String id) async {
    try {
      Response response =
          await get(resOrders(id), headers: contentTypeJsonHeader);

      if (response.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(response.body);
        List<dynamic> list = map["Data"];
        List<OrderModelApi> orders =
            list.map((e) => OrderModelApi.fromMap(e)).toList();
        return orders;
      } else {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateStatus(int id, int status, [int tableId = -1]) async {
    try {
      var request = MultipartRequest('PUT', updateStatusUrl);
      if (tableId != -1)
        request.fields.addAll({
          'id': id.toString(),
          'status': status.toString(),
          "table": tableId.toString()
        });
      else
        request.fields.addAll({
          'id': id.toString(),
          'status': status.toString(),
        });
      var response = await request.send();
      if (response.statusCode != 202) {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }
}
