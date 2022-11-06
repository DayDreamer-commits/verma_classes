import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/academic_calender_controller.dart';

class AcademicCalenderView extends GetView<AcademicCalenderController> {
  const AcademicCalenderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AcademicCalenderView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AcademicCalenderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
