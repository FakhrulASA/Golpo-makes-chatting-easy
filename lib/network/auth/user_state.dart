import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

bool getUserState() {
  if (FirebaseAuth.instance.currentUser != null) {
    log("FIREBASE " + FirebaseAuth.instance.currentUser.toString());
    return true;
  } else {
    return false;
  }
}
