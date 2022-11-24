import 'package:flutter_native_splash/flutter_native_splash.dart';

class DataController{


  DataController(){



    //this should be called at last
    Future.delayed(const Duration(seconds: 3),()=>FlutterNativeSplash.remove());
  }
}