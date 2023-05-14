import 'package:flutter/material.dart';

import 'package:carbon_icons/carbon_icons.dart';
import 'package:get/get.dart';

import 'package:phone_auth/Constants/Constants.dart';
import 'package:phone_auth/Widget/CustomButton.dart';
import 'package:phone_auth/Widget/CustomRadioButton.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        "profileName": "Shipper",
        "profileData":
            "Lorem Ipsum passages,\nand more recently\nwith desktop publishing software like",
        "icon": CarbonIcons.home,
        "value": 1
      },
      {
        "profileName": "Transporter",
        "profileData":
            "Lorem Ipsum passages,\nand more recently\nwith desktop publishing software like",
        'icon': CarbonIcons.delivery_truck,
        'value': 2
      }
    ];
    RxInt groupValue = 0.obs;
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.only(
            // top: Constant.height / 20,
            left: Constant.width / 50,
            right: Constant.width / 50),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    CarbonIcons.arrow_left,
                    size: 30,
                  )),
            ),
            Constant.sizedBoxH(
              10,
            ),
            const Text(
              "Please select your profile",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Constant.sizedBoxH(
              30,
            ),
            Column(
              children: [
                SizedBox(
                  child: ListView.builder(
                      itemCount: data.length,
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        final name = data[index]['profileName'];
                        final profileData = data[index]['profileData'];
                        final icon = data[index]['icon'];
                        final value = data[index]['value'];
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: Constant.height / 6.5,
                            width: Constant.width / 1.2,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Obx(() => RadioListTile(
                                activeColor: Constant.buttonColor,
                                value: value,
                                groupValue: groupValue.value,
                                title: CustomRadio(
                                    profileName: name,
                                    profileData: profileData,
                                    icon: icon),
                                onChanged: ((value) {
                                  groupValue.value = value!;
                                  
                                }))),
                          ),
                        );
                      })),
                ),
                Constant.sizedBoxH(
                  30,
                ),
               
              ],
            ),
            Constant.sizedBoxH(
              30,
            ),
            SizedBox(
                width: Constant.width / 1.16,
                height: Constant.height / 10,
                child: CustomButton(
                  name: "CONTINUE",
                  onPressed: () {},
                )),
          ],
        ),
      )),
    );
  }
}
