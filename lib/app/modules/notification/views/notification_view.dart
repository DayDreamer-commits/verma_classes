import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotificationView'),
        centerTitle: true,
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return ListTile();
      }),
    );
  }
}
