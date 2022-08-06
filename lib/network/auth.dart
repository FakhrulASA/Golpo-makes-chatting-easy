import 'package:chat_time/model/NetworkRequestModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<NetworkRequestModel> registerUserWithEmailAndPassword(
    String email, String password) async {
  UserCredential userCredential;
  bool isSuccess;
  String message;
  try {
    userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    if (userCredential.user?.email != null) {
      isSuccess = true;
      message = "Succeesfully logged in";
    } else {
      isSuccess = false;
      message = "Error occurred!";
    }
  } on FirebaseAuthException catch (e) {
    isSuccess = false;
    if (e.code == 'weak-password') {
      message = "The password provided is too weak.";
    } else if (e.code == 'email-already-in-use') {
      message = "The account already exists for that email.";
    } else {
      message = e.code;
    }
  } catch (e) {
    isSuccess = false;
    message = e.toString();
  }
  return NetworkRequestModel(isSuccess, message);
}

Future<NetworkRequestModel> loginUserWithEmailAndPassword(
    String email, String password) async {
  bool isSuccess;
  String message;
  UserCredential userCredential;
  try {
    userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (userCredential.user?.email != null) {
      isSuccess = true;
      message = "Succeesfully logged in";
    } else {
      isSuccess = false;
      message = "Error occurred!";
    }
  } on FirebaseAuthException catch (e) {
    isSuccess = false;
    if (e.code == 'user-not-found') {
      message = 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      message = 'Wrong password provided for that user.';
    } else {
      message = e.code;
    }
  }
  return NetworkRequestModel(isSuccess, message);
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}
