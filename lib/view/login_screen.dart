import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vectracom_test/controllers/login_screen_controller.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("LOGIN",
                    style: TextStyle(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 40)),
                const SizedBox(height: 20),
                textField(
                    title: "Email", tfController: controller.emailController),
                const SizedBox(height: 10),
                textField(
                    title: "Password",
                    tfController: controller.passwordController,
                    icon: controller.showPassword.value
                        ? Icons.remove_red_eye
                        : Icons.visibility_off),
                const SizedBox(height: 20),
                loginButton(),
                const SizedBox(height: 20),
                controller.userNotFound.value != ''
                    ? Text(
                        "${controller.userNotFound}",
                        style: const TextStyle(color: Colors.red),
                      )
                    : const Text("")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textField({title, tfController, icon}) {
    return TextField(
      controller: tfController,
      obscureText: title == "Password" ? controller.showPassword.value : false,
      cursorHeight: 20,
      autofocus: false,
      decoration: InputDecoration(
        labelText: title,
        hintText: title,
        suffixIcon: icon != null
            ? GestureDetector(
                onTap: () {
                  controller.showPassword.value =
                      !controller.showPassword.value;
                },
                child: Icon(icon))
            : null,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.grey, width: 1.5),
        ),
      ),
    );
  }

  Widget loginButton() {
    return GestureDetector(
      onTap: () {
        controller.authentication();
      },
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: controller.isLoading.value == true
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : const Text("LOGIN",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
        ),
      ),
    );
  }
}
