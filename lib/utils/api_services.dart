class ApiServices {
  final contentTypeJsonHeader = {
    'Content-Type': 'application/json',
  };
  // http://202.53.174.5:8000/  global url
  // http://192.168.29.31:5500/ local url
  // https://readyplates.herokuapp.com/
  final String baseUri = "http://192.168.29.31:5500/";

  Uri restaurants(String path) => Uri.parse(baseUri + "restaurants/" + path);

  Uri accounts(String url) => Uri.parse(baseUri + "accounts/" + url);
  Uri get changePass => accounts("resetpass/");

  Uri get loginUri => restaurants('login/');
  Uri get registerUri => restaurants('register/');

  Uri get screenStat => restaurants('screenstat/');
  Uri onboarding(int screen) => restaurants("s${screen}/");

  Uri get menu => restaurants('menu/');

  Uri updateMenu(int id) => restaurants('menu/$id');

  Uri menuList(String id) => restaurants('menulist/$id/');

  Uri resOrders(String id) => restaurants('restaurantorders/$id');

  Uri get updateStatusUrl => restaurants('updatestatus/');

  Uri feedbacks(String id) => restaurants('feedback/$id');
}
