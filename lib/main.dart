import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:verma_classes/app/data_binding.dart';

import 'app/routes/app_pages.dart';

void main() {

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    GetMaterialApp(
      title: "Verma Classes",
      initialRoute: AppPages.INITIAL,
      initialBinding: DataBinding(),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
