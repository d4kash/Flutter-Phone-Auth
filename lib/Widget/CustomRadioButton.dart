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
      padding: const EdgeInsets.only(top:6.0),
      child: ListTile(
       
                leading:  Icon(
            icon,
            size: 38,
            
            color: Colors.black,
          ),
          title: Text(
                  profileName,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.normal),
                ),
                subtitle: 
                Text(
                  profileData,
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.normal),
                ),
      ),
      
      
      
  
    );
  }
}
