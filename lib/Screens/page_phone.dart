import 'package:carbon_icons/carbon_icons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:phone_auth/Constants/Constants.dart';
import 'package:phone_auth/Widget/CustomButton.dart';

class PhonePage extends StatelessWidget {
  const PhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();
    RxString phoneNumber = ''.obs;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(
          top: Constant.height / 20,
          left: Constant.width / 50,
          right: Constant.width / 50),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: null,
                icon: Icon(
                  CarbonIcons.close,
                  size: 30,
                )),
          ),
          Constant.sizedBoxH(
            10,
          ),
          const Text(
            "Please enter your mobile number",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
              controller: phoneController,
              initialCountryCode: 'IN',
              decoration: const InputDecoration(
                hintText: 'Phone Number',
                labelText: 'Phone',
                border: OutlineInputBorder(),
              ),
              onChanged: (val) {
                phoneNumber.value = val.completeNumber;
              },
            ),
          ),
          SizedBox(
              width: Constant.width / 1.08,
              height: Constant.height / 10,
              child: CustomButton(
                name: "CONTINUE",
                onPressed: () => null,
              )),
        ],
      ),
    ));
  }
}
