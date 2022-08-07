import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/routes.dart';

Widget getMessageListItem(BuildContext context, int i) {
  bool isOnline;
  if (i % 2 == 0) {
    isOnline = true;
  } else {
    isOnline = false;
  }
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, ApplicationRoute.messageDetailRoute);
    },
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 12,
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: const Color.fromARGB(255, 0, 172, 6),
              child: CircleAvatar(
                  radius: isOnline ? 27 : 30,
                  backgroundColor: Colors.white,
                  backgroundImage: const AssetImage("assets/avatar.png")),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(
                        child: Text(
                          "User User",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                            child: Text(
                              "1:30 PM",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 12,
                                  color: Colors.black45),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // ignore: prefer_const_constructors
                  Visibility(
                    visible: true,
                    child: const SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Message Message Message Message Messagge MMage Message ",
                        textAlign: TextAlign.start,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        const Divider()
      ],
    ),
  );
}
