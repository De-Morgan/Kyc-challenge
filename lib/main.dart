import 'package:flutter/material.dart';

import 'ui/kyc_home_page.dart';
import 'utils/system_chrome_service.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await SystemChromeService.setOrientationToLandScape();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KYC App',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: KycHomePage(),
    );
  }
}


