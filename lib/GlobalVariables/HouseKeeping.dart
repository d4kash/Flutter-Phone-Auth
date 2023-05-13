import 'package:firebase_auth/firebase_auth.dart';

class HouseKeeping {
  static FirebaseAuth auth = FirebaseAuth.instance;
  /*
  varify phone number
  
  */
  static String verifyUserPhoneNumber(String phoneNumber) {
    var receivedID;
    auth.verifyPhoneNumber(
      phoneNumber: "+91$phoneNumber",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then(
              (value) => print('Logged In Successfully'),
            );
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        receivedID = verificationId;
        // otpFieldVisibility = true;
        // setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    return receivedID;
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
