import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Constant {
     static final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  static double height = Get.size.height;
  static double width = Get.size.width;
  static const Color buttonColor = const Color(0xff020079);
  static Widget sizedBoxH(double height) {
    return SizedBox(
      height: Constant.height / height,
    );
  }

  static Widget sizedBoxW(double width) {
    return SizedBox(
      height: Constant.width / width,
    );
  }

  static  scaffold(msg){
    return  Get.snackbar(
      colorText: Colors.white,
      backgroundColor:Colors.black,
              "Error",
               msg,
               
               snackPosition: SnackPosition.BOTTOM,
                 
               );
  }
}
