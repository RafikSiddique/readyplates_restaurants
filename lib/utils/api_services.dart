class ApiServices {
  final contentTypeJsonHeader = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  final String baseUri = "https://readyplates.herokuapp.com/";
  Uri accounts(String path) => Uri.parse(baseUri + "restaurants/" + path);
  Uri get loginUri => accounts('login/');
  Uri get registerUri => accounts('register/');
  Uri get onboarding1Uri => accounts('s1/');
  Uri get onboarding2Uri => accounts('s2/');
  Uri get onboarding3Uri => accounts('s3/');
  Uri get image => accounts('image/');
  Uri onboarding(int screen) => accounts("s${screen}/");
}

// https://readyplates.herokuapp.com/restaurants/s1/
// 192.168.0.194: 5000
// endpoint:BASE_URL/restaurants/menu
/* 
restaurant    ---->name of the restaurant          
name         ----->name of dish
description            
image1                  
image2                 
diet_type 
category                
std_serving_size        
other_serving_size      
other_serving_cost      
spice_level             
cost

*/
// Endpoint : BASE_URL/restaurants/menu/id
// Note :Here id is the is of the menu item to be updated
// Fields are all same as create new menu
