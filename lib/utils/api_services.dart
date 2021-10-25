class ApiServices {
  final contentTypeJsonHeader = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  final String baseUri = "http://202.53.174.5:8000/";
  Uri restaurants(String path) => Uri.parse(baseUri + "restaurants/" + path);
  Uri get loginUri => restaurants('login/');
  Uri get registerUri => restaurants('register/');
  Uri get screenStat => restaurants('screenstat/');
  Uri onboarding(int screen) => restaurants("s${screen}/");
  Uri get menu => restaurants('menu/');
  Uri updateMenu(int id) => restaurants('menu/$id');
  Uri menuList(String id) => restaurants('menulist/$id/');
  Uri resOrders(String id) => restaurants('restaurantorders/$id/');
}
