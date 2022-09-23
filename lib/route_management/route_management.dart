import 'package:get/get.dart';
import 'package:vectracom_test/route_management/screen_bindings.dart';
import '../view/home_screen.dart';
import '../view/login_screen.dart';
import 'constant_routes.dart';

class RouteManagement{

static List<GetPage> getPages(){
return[
  GetPage(
      name: kLoginScreen,
      page: ()=>LoginScreen(),
      binding:ScreenBindings()
  ),
  GetPage(
      name: kHomeScreen,
      page: ()=> HomeScreen(),
      binding:ScreenBindings()
  ),
];
}

}