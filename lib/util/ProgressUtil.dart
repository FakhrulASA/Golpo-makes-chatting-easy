import 'package:flutter/material.dart';

showLoaderDialog(BuildContext context, String message) {
  AlertDialog alert = AlertDialog(
    content: IntrinsicHeight(
      child: Column(
        children: [
          CircularProgressIndicator(
            color: Color.fromARGB(255, 233, 167, 81),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              margin: EdgeInsets.only(left: 7),
              child: Text(
                message,
                style: TextStyle(
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
