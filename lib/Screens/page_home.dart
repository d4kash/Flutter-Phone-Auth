import 'package:carbon_icons/carbon_icons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:phone_auth/Constants/Constants.dart';
import 'package:phone_auth/Screens/page_phone.dart';
import 'package:phone_auth/Widget/CustomButton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: Constant.height / 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              CarbonIcons.image,
              size: 70,
            ),
          ),
          Constant.sizedBoxH(
            30,
          ),
          const Text(
            "Please select your Language",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Constant.sizedBoxH(
            40,
          ),
          const Text(
            "You can change the language\nat any time",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Constant.sizedBoxH(
            40,
          ),
          SizedBox(width: Constant.width / 1.5, child: const DropDown()),
          Constant.sizedBoxH(
            40,
          ),
          SizedBox(
              width: Constant.width / 1.45,
              height: Constant.height / 10,
              child: CustomButton(
                name: "NEXT",
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: ((context) =>const PhonePage())));
                },
              )),
        ],
      ),
    ));
  }
}

class DropDown extends StatelessWidget {
  const DropDown({super.key});

  @override
  Widget build(BuildContext context) {
    var items = ['English', 'Hindi', 'Sanskrit', 'Bengali', 'Kannad'];
    var selectedItem = items[0];
    return DropdownButtonFormField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      value: selectedItem,
      items: items.map((e) {
        return DropdownMenuItem(value: e, child: Text(e));
      }).toList(),
      onChanged: (value) {
        selectedItem = value!;
        print(value);
      },
    );
  }
}
