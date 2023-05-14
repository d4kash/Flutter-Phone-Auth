
import 'package:get/get.dart';
import 'package:phone_auth/Controller/phone_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneController>(
        () => PhoneController());
  }
}