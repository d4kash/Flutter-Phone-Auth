import 'package:flutter/material.dart';

import 'package:carbon_icons/carbon_icons.dart';
import 'package:get/get.dart';

import 'package:phone_auth/Constants/Constants.dart';
import 'package:phone_auth/Widget/CustomButton.dart';
import 'package:phone_auth/Widget/CustomRadioButton.dart';

enum Pet { shipper, transporter }

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt groupValue = 0.obs;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(
          top: Constant.height / 20,
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
          Obx(() => Column(
         
                children: [
                  Container(
                    height: Constant.height / 5,
                    width: Constant.width / 1.2,
                    decoration: BoxDecoration(border: Border.all()),
                    child: RadioListTile(
                      activeColor: Constant.buttonColor,
                        value: 1,
                        groupValue: groupValue.value,
                        title: const CustomRadio(
                            profileName:"Shipper",
                           profileData: "Lorem Ipsum passages,\nand more recently\nwith desktop publishing software like",
                           icon: CarbonIcons.home),
                        onChanged: ((value) {
                          groupValue.value = value!;
                        })),
                  ),
                  Constant.sizedBoxH(
                    30,
                  ),
                  Container(
                    height: Constant.height / 5,
                    width: Constant.width / 1.2,
                    decoration: BoxDecoration(border: Border.all()),
                    child:
                       RadioListTile(
                        activeColor: Constant.buttonColor,
                          value: 2,
                          groupValue: groupValue.value,
                          title:const  CustomRadio(
                             profileName: "Transporter",
                             profileData: "Lorem Ipsum passages,\nand more recently\nwith desktop publishing software like",
                             icon:  CarbonIcons.delivery_truck),
                          onChanged: ((value) {
                             groupValue.value = value!;
                          }),
                    ),
                  ),
                ],
              )),
               Constant.sizedBoxH(
                    30,
                  ),
                SizedBox(
                    width: Constant.width / 1.16,
                    height: Constant.height / 10,
                    child: CustomButton(
                      name: "CONTINUE",
                      onPressed: ()  {
                        
                      },
                    )),
        ],
      ),
    ));
  }

 
}
