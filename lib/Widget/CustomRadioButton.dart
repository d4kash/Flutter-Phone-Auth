import 'package:flutter/material.dart';
import 'package:phone_auth/Constants/Constants.dart';

class CustomRadio extends StatelessWidget {
  final String profileName;
  final String profileData;
  final IconData icon;
  const CustomRadio({
    Key? key, required this.profileName, required this.profileData, required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profileName,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
                Constant.sizedBoxH(
                  30,
                ),
                FittedBox(
                  //  child: Text("Lorem Ipsum passages, and more recently\nwith desktop publishing software like",
                  child: Text(
                    profileData,
                    maxLines: 3,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
