import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vectracom_test/route_management/constant_routes.dart';
import 'package:vectracom_test/route_management/route_management.dart';
import 'package:vectracom_test/route_management/screen_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: kLoginScreen,
      getPages: RouteManagement.getPages(),
      initialBinding: ScreenBindings(),
      debugShowCheckedModeBanner: false,
    );
    ;
  }
}
