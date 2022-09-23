import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vectracom_test/route_management/constant_routes.dart';

class LoginScreenController extends GetxController {
  String screenName = 'Login';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool showPassword = false.obs;
  RxBool isLoading = false.obs;
  RxString userNotFound = ''.obs;

  Future<void> authentication() async {
    isLoading.value = true;
    if (emailController.text == 'admin@gmail.com' &&
        passwordController.text == 'admin') {
      userNotFound.value = '';
      isLoading.value = false;
      Get.toNamed(kHomeScreen);
    } else {
      isLoading.value = false;
      userNotFound.value = 'Please Enter the Registered User';
    }
  }

  @override
  void onInit() {
    emailController.text = 'admin@gmail.com';
    passwordController.text = 'admin';
    super.onInit();
  }
}
