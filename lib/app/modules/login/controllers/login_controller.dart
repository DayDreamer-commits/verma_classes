import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:verma_classes/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void login() {

    Get.offAndToNamed(Routes.HOME);
  }

  String? usernameValidator(String? value) {

    return null;
  }

  String? passwordValidator(String? value) {

    return null;

  }
}
