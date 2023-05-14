import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:phone_auth/Constants/Constants.dart';
import 'package:phone_auth/Controller/phone_binding.dart';

import 'package:phone_auth/Screens/page_home.dart';

import 'firebase_options.dart';

void main() async {
   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  if(kIsWeb){

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseAppCheck firebaseAppCheck = FirebaseAppCheck.getInstance(); firebaseAppCheck.installAppCheckProviderFactory( SafetyNetAppCheckProviderFactory.getInstance());
  }else{
    await Firebase.initializeApp(
      name:'create',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  }
  
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.black));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: ControllerBinding(),
        theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
          backgroundColor: Constant.buttonColor,
        ))),
        home: const HomePage());
    // home: const OtpPage(recievedId: '',));
  }
}
