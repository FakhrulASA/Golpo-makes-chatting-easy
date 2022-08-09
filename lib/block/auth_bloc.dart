import 'dart:async';
import 'dart:developer';

import 'package:chat_time/event/auth_event.dart';
import 'package:chat_time/model/user.dart';
import 'package:chat_time/network/auth/auth.dart';
import 'package:flutter/cupertino.dart';

import '../model/NetworkRequestModel.dart';
import '../util/routes.dart';

class AuthBloc {
  late final _authController = StreamController<NetworkRequestModel>();

  StreamSink<NetworkRequestModel> get _authSink => _authController.sink;
  Stream<NetworkRequestModel> get authStream => _authController.stream;

  late final _atuhEventController = StreamController<AuthEvent>();

  StreamSink<AuthEvent> get authEventSink => _atuhEventController.sink;

  Stream<AuthEvent> get _authEventStream => _atuhEventController.stream;

  AuthBloc([BuildContext? contextA, User? user]) {
    _authEventStream.listen((event) {
      if (event == AuthEvent.login) {
        loginUserWithEmailAndPassword(user!.email, user.password).then((value) {
          _authSink.add(value);
          _authSink.done;
        });
      } else if (event == AuthEvent.logout) {
        signOut();
        Navigator.pop(contextA!);
        Navigator.pushReplacementNamed(contextA, ApplicationRoute.loginRoute);
      } else if (event == AuthEvent.registration) {
        registerUserWithEmailAndPassword(user!.email, user.password);
      } else if (event == AuthEvent.forgetPassword) {}
    });
  }
}
