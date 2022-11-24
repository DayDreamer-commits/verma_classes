import 'package:get/get.dart';
import 'package:verma_classes/app/data_controller.dart';

class DataBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DataController>(
      DataController(),
    );
  }
}
