import 'dart:developer';

import 'package:chat_time/component/common_button.dart';
import 'package:flutter/material.dart';

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
              margin: EdgeInsets.only(left: 7),
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

showCommonDialog(BuildContext context, String message, String pm, String nm) {
  AlertDialog alert = AlertDialog(
    content: IntrinsicHeight(
      child: Column(
        children: [
          Text(
            message,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Flexible(child: CommonButton(buttonText: pm)),
              const SizedBox(
                width: 20,
              ),
              Flexible(child: CommonButton(buttonText: nm))
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
      log("$message $pm $nm");
      return alert;
    },
  );
}
