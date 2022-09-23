import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vectracom_test/controllers/home_screen_controller.dart';

import '../controllers/login_screen_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => HomeScreenController());
  }
}

