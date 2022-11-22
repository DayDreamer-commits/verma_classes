import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final List<String> tabs = ["Classes", "Library", "Work"];

  final currentIndex = 0.obs;

  final pageController = PageController();

  final title = "Home".obs;

  @override
  void onInit() {
    super.onInit();
    currentIndex.stream.listen((event) {
      pageController.jumpToPage(event);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void openAcademicCalender() {
    Get.toNamed(Routes.PROFILE);
  }

  void openRoutine() {
    Get.toNamed(Routes.RESULTS);
  }

  void scanQr() {
    Get.toNamed(Routes.SCANNER);
  }

  void openNotification() {
    Get.toNamed(Routes.NOTIFICATION);
  }
}
