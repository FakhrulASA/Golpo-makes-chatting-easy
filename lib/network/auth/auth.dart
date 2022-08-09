import 'dart:developer';

import 'package:chat_time/model/NetworkRequestModel.dart';
import 'package:chat_time/model/user.dart';
import 'package:chat_time/network/auth/user_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<NetworkRequestModel> registerUserWithEmailAndPassword(
    String email, String password,
    [String? name]) async {
  UserCredential userCredential;
  bool isSuccess;
  String message;
  try {
    userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    if (userCredential.user?.email != null) {
      isSuccess = true;
      addUserToFirebase(email, name!);
      message = "Registered successfully, plesae login!";
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

String getUserName() {
  return FirebaseAuth.instance.currentUser!.email!.split("@")[0];
}

Future<String?> getUserImageUrl() async {
  final imagesRef = FirebaseStorage.instance
      .ref()
      .child("images/${getUserEmail()!.split("@")[0]}");
  final imageUrl = await imagesRef.getDownloadURL();
  if (imageUrl.isNotEmpty) {
    return imageUrl;
  } else {
    return null;
  }
}

addUserToFirebase(String name, String email) {
  DocumentReference message =
      FirebaseFirestore.instance.collection('users').doc(getUserEmail());

  // Call the user's CollectionReference to add a new user
  message
      .set({
        'name': name, // John Doe
        'email': email,
        'hasProfilePic': false // Stokes and So
        // 42
      })
      .then((value) => log("User Added"))
      .catchError((error) => log("Failed to add user: $error"));
}
