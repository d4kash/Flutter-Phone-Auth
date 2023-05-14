import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/Constants/Constants.dart';
import 'package:phone_auth/Controller/phone_controller.dart';
import 'package:phone_auth/Screens/page_otp.dart';

class HouseKeeping {
  static FirebaseAuth auth = FirebaseAuth.instance;
  /*
  varify phone number
  
  */
  static void verifyUserPhoneNumber(
      String phoneNumber, PhoneController controller, context)  async{
    await auth.verifyPhoneNumber(
      phoneNumber: "+91$phoneNumber",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then(
          (value) {
            print('Logged In Successfully');
          },
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        // print(e.message);
        controller.isLoading.value = false;
       
        // Constant.scaffold("${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        controller.receivedID.value = verificationId;
controller.isLoading.value = false;
        // print("receivedID: ${ controller.receivedID}");
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OtpPage(
                    recievedId: controller.receivedID.value,
                    phoneNumber: phoneNumber,
                  )),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Constant.scaffold("Timed out waiting for SMS");
      },
    );
  }

  /* 
  verify otp
  
  */
  static Future<UserCredential> verifyOTPCode(String receivedID, otp) async {
    UserCredential? userCredential;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: receivedID,
      smsCode: otp,
    );
    await auth.signInWithCredential(credential).then((value) {
      userCredential = value;
      print('User Login In Successful');
    });
    return userCredential!;
  }
}
