import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

Future<String?> checkTheme()async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var theme = sharedPreferences.getString("theme");
  if(theme == 'dark'){
    Get.changeTheme(ThemeData.dark());
  }else{
    Get.changeTheme(ThemeData.light());
  }
  return theme;
}

void changeTheme(value)async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if(value == true){
    Get.changeTheme(ThemeData.dark());
    sharedPreferences.setString("theme",'dark');
  }else {
    Get.changeTheme(ThemeData.light());
    sharedPreferences.setString("theme",'light');
  }
}

