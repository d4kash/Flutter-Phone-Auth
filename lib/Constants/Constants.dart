import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Constant {
  static double height = Get.size.height;
  static double width = Get.size.width;
  static Color buttonColor = const Color(0xff020079);
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
}
