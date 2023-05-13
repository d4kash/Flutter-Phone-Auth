import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  VoidCallback onPressed;
  CustomButton({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            // backgroundColor: Color(0xff020079),
            shape: const RoundedRectangleBorder(),
            // backgroundColor: Color(0xff020079)
          ),
          onPressed: onPressed,
          child: Text(
            name,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
