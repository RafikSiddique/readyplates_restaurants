class ApiServices {
  final contentTypeJsonHeader = {
    'Content-Type': 'application/json',
  };
  final String baseUrlheroku = 'https://readyplates.herokuapp.com';
  final String baseUrlLive = "http://202.53.174.5:8000";
  final String baseUrlLocal = "http://35.200.132.65:5500";
  String get baseUri => baseUriImage + "/";
  String get baseUriImage => baseUrlLocal;

  Uri restaurants(String path) => Uri.parse(baseUri + "restaurants/" + path);

  Uri accounts(String url) => Uri.parse(baseUri + "accounts/" + url);
  Uri get changePass => accounts("resetpass/");
  Uri get forgotUri => accounts('forgotpass/');
  Uri get loginUri => restaurants('login/');
  Uri get registerUri => restaurants('register/');

  Uri get screenStat => restaurants('screenstat/');
  Uri onboarding(int screen) => restaurants("s${screen}/");
  Uri get table => restaurants('table/');
  Uri get menu => restaurants('menu/');
  Uri availableTable(String id) => restaurants('table/$id');
  Uri get setAvailability => restaurants('tableavailable/');

  Uri updateMenu(int id) => restaurants('menu/$id');

  Uri menuList(String id) => restaurants('menulist/$id/');

  Uri resOrders(String id) => restaurants('restaurantorders/$id');

  Uri get updateStatusUrl => restaurants('updatestatus/');

  Uri feedbacks(String id) => restaurants('feedback/$id');

  Uri singleRestaurantUri(int id) =>
      Uri.parse(baseUri + 'customers/getrestaurant/$id');

  Uri get openCloseOrderUri => restaurants('openorders/');

  Uri autoOrders(String resid) => restaurants('autoorders/$resid');
  Uri get setAutoOrders => restaurants('autoorders/');
}
