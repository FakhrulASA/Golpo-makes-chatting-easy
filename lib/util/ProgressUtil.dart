// ignore: file_names
import 'dart:developer';

import 'package:chat_time/block/auth_bloc.dart';
import 'package:chat_time/event/auth_event.dart';
import 'package:chat_time/model/NetworkRequestModel.dart';
import 'package:chat_time/util/routes.dart';
import 'package:flutter/material.dart';

import '../network/auth/auth.dart';

showLoaderDialog(BuildContext context, String message) {
  AlertDialog alert = AlertDialog(
    content: IntrinsicHeight(
      child: Column(
        children: [
          const CircularProgressIndicator(
            color: Color.fromARGB(255, 233, 167, 81),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: Text(
                message,
                style: const TextStyle(
                    color: Color.fromARGB(255, 54, 54, 54),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              )),
        ],
      ),
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

navigate(BuildContext context, String i) {}

showCommonDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: IntrinsicHeight(
      child: Column(
        children: [
          const Text(
            "Are you sure you wan't to log out from the application?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Flexible(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 148, 31, 31),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Center(
                      child: Text(
                        "No",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: InkWell(
                  onTap: () {
                    final authBlock = AuthBloc(context, null);
                    authBlock.authEventSink.add(AuthEvent.logout);
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 148, 31, 31),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Center(
                      child: Text(
                        "Yes",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
