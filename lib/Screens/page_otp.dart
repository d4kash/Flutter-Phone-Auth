import 'package:carbon_icons/carbon_icons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:phone_auth/Constants/Constants.dart';
import 'package:phone_auth/Widget/CustomButton.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
    String? _verificationCode;
    final TextEditingController _pinPutController = TextEditingController();

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
    );
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
                  CarbonIcons.arrow_left,
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
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: IntlPhoneField(
          //     controller: otpController,
          //     initialCountryCode: 'IN',
          //     decoration: const InputDecoration(
          //       hintText: 'Phone Number',
          //       labelText: 'Phone',
          //       border: OutlineInputBorder(),
          //     ),
          //     onChanged: (val) {
          //       phoneNumber.value = val.completeNumber;
          //     },
          //   ),
          // ),
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
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:phone_auth/Screens/home.dart';

// import 'package:pinput/pinput.dart';

// class OTPScreen extends StatefulWidget {
//   final String phone;
//   OTPScreen(this.phone);
//   @override
//   _OTPScreenState createState() => _OTPScreenState();
// }

// class _OTPScreenState extends State<OTPScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
//   String? _verificationCode;
//   final TextEditingController _pinPutController = TextEditingController();

//   final defaultPinTheme = PinTheme(
//     width: 56,
//     height: 56,
//     textStyle: TextStyle(
//         fontSize: 20,
//         color: Color.fromRGBO(30, 60, 87, 1),
//         fontWeight: FontWeight.w600),
//     decoration: BoxDecoration(
//       border: Border.all(color: Colors.black),
//       borderRadius: BorderRadius.circular(20),
//     ),
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldkey,
//       appBar: AppBar(
//         title: Text('OTP Verification'),
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 40),
//             child: Center(
//               child: Text(
//                 'Verify +91-${widget.phone}',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(30.0),
//             child: Pinput(
//               length: 6,
//               defaultPinTheme: defaultPinTheme,
//               controller: _pinPutController,
//               pinAnimationType: PinAnimationType.fade,
//               onSubmitted: (pin) async {
//                 try {
//                   await FirebaseAuth.instance
//                       .signInWithCredential(PhoneAuthProvider.credential(
//                           verificationId: _verificationCode!, smsCode: pin))
//                       .then((value) async {
//                     print("value : $value");
//                     if (value.user != null) {
//                       Navigator.pushAndRemoveUntil(
//                           context,
//                           MaterialPageRoute(builder: (context) => Home()),
//                           (route) => false);
//                     }
//                   });
//                 } catch (e) {
//                   ScaffoldMessenger.of(context)
//                       .showSnackBar(SnackBar(content: Text(e.toString())));
//                 }
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   _verifyPhone() async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: '+91${widget.phone}',
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           await FirebaseAuth.instance
//               .signInWithCredential(credential)
//               .then((value) async {
//             print("value : $value");
//             if (value.user != null) {
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (context) => Home()),
//                   (route) => false);
//             }
//           });
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           print(e.message);
//         },
//         codeSent: (String? verficationID, int? resendToken) {
//           setState(() {
//             _verificationCode = verficationID;
//           });
//         },
//         codeAutoRetrievalTimeout: (String verificationID) {
//           setState(() {
//             _verificationCode = verificationID;
//           });
//         },
//         timeout: Duration(seconds: 120));
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _verifyPhone();
//   }
// }
