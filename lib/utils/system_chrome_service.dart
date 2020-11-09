




import 'package:flutter/services.dart';

class SystemChromeService{

  static Future<void> setOrientationToLandScape()async{
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
  }
}