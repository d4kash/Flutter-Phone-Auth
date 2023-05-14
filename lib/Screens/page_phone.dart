import 'package:carbon_icons/carbon_icons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:phone_auth/Constants/Constants.dart';
import 'package:phone_auth/Controller/phone_controller.dart';
import 'package:phone_auth/GlobalVariables/HouseKeeping.dart';
import 'package:phone_auth/Screens/page_otp.dart';
import 'package:phone_auth/Widget/CustomButton.dart';

class PhonePage extends StatelessWidget {
  PhonePage({super.key});

  final PhoneController controller = Get.find<PhoneController>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();
    RxString phoneNumber = ''.obs;
    // RxBool _isLoading = false.obs;
    return  SafeArea(
          child: Scaffold(
              body: Padding(
            padding: EdgeInsets.only(
                left: Constant.width / 50, right: Constant.width / 50),
            child:Obx(() => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              CarbonIcons.close,
                              size: 30,
                            )),
                      ),
                      Constant.sizedBoxH(
                        10,
                      ),
                      const Text(
                        "Please enter your mobile number",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Constant.sizedBoxH(
                        30,
                      ),
                      const Text(
                        "You will recieve 6 digit code\nto verify next",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Constant.sizedBoxH(
                        30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IntlPhoneField(
                          validator: (p0) {},
                          controller: phoneController,
                          readOnly: controller.isLoading.value,
                          initialCountryCode: 'IN',
                          decoration: const InputDecoration(
                            hintText: 'Phone Number',
                            labelText: 'Phone',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (val) {
                            if (val.number.isNotEmpty &&
                                val.number.length <= 10) {
                              // Run anything here
                              phoneNumber.value = val.completeNumber;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                          width: Constant.width / 1.08,
                          height: Constant.height / 10,
                          child: CustomButton(
                            name: "CONTINUE",
                            onPressed: () async {
                              if (phoneNumber.value.isNotEmpty ||
                                  phoneNumber.value.length == 10) {
                                controller.isLoading.value = true;
                                print(controller.isLoading);
                                try {
                                  HouseKeeping.verifyUserPhoneNumber(
                                      phoneController.text,
                                      controller,
                                      context);

                                  // controller.isLoading.value = false;
                                } on Exception catch (e) {
                                  controller.isLoading.value = false;
                                  print(e.toString());
                                  // TODO
                                }
                              } else {
                                Constant.scaffold(
                                    "Phone number must be of 10 Digits");
                              }
                            },
                          )),
                    ],
                  ),
          )),
        ));
  }
}
