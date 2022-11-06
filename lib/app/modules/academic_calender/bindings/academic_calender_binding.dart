import 'package:get/get.dart';

import '../controllers/academic_calender_controller.dart';

class AcademicCalenderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcademicCalenderController>(
      () => AcademicCalenderController(),
    );
  }
}
