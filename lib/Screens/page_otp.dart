import 'package:carbon_icons/carbon_icons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:phone_auth/Constants/Constants.dart';
import 'package:phone_auth/Controller/phone_controller.dart';
import 'package:phone_auth/GlobalVariables/HouseKeeping.dart';
import 'package:phone_auth/Screens/ProfileSection/profile_page.dart';
import 'package:phone_auth/Screens/page_home.dart';
import 'package:phone_auth/Widget/CustomButton.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatelessWidget {
  final String recievedId;
  final String phoneNumber;
  OtpPage({super.key, required this.recievedId, required this.phoneNumber});
  final PhoneController otpController = Get.find<PhoneController>();
  @override
  Widget build(BuildContext context) {
    // final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
    // String? verificationCode;
    final TextEditingController pinPutController = TextEditingController();
    RxBool isLoading = false.obs;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    return Obx(() => SafeArea(
      child: Scaffold(
              body: Padding(
            padding: EdgeInsets.only(
                // top: Constant.height / 20,
                left: Constant.width / 50,
                right: Constant.width / 50),
            child: otpController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              CarbonIcons.arrow_left,
                              size: 30,
                            )),
                      ),
                      Constant.sizedBoxH(
                        10,
                      ),
                      const Text(
                        "Verify Phone",
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Constant.sizedBoxH(
                        30,
                      ),
                      Text(
                        "Code is sent to $phoneNumber",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Constant.sizedBoxH(
                        30,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Pinput(
                            length: 6,
                            defaultPinTheme: defaultPinTheme,
                            controller: pinPutController,
                            pinAnimationType: PinAnimationType.fade,
                            // onSubmitted: (pin) async {}
                          )),
                      FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Didn't recieve the code? ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                "Request Again",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Constant.sizedBoxH(
                        30,
                      ),
                      SizedBox(
                          width: Constant.width / 1.08,
                          height: Constant.height / 10,
                          child: CustomButton(
                            name: "VERIFY AND CONTINUE",
                            onPressed: () async {
                              try {
                                otpController.isLoading.value = true;
                                UserCredential data =
                                    await HouseKeeping.verifyOTPCode(
                                        recievedId, pinPutController.text);
    
                                otpController.isLoading.value = false;
                                print("data: $data");
                                // if (data != null) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfilePage()),
                                    (route) => false);
                                // }
                              } catch (e) {
                                otpController.isLoading.value = false;
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.toString())));
                              }
                            },
                          )),
                    ],
                  ),
          )),
    ));
  }
}
