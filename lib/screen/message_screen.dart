import 'package:chat_time/util/color.dart';
import 'package:flutter/material.dart';

import '../util/routes.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  var a = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Johson's"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.vertical,
                reverse: true,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int position) {
                  if (a == 1) {
                    a = 1;
                    return getRow(position);
                  } else {
                    return getRowRed(position);
                  }
                }),
          ),
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0, color: brightColor),
                      color: brightColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            minLines: 1,
                            maxLines: 3,
                            decoration: InputDecoration(
                              hintText: "Write something...",
                              border: InputBorder.none,
                              contentPadding: EdgeInsetsGeometry.lerp(
                                  const EdgeInsets.all(10),
                                  const EdgeInsets.all(10),
                                  0.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              IconButton(
                color: Colors.black26,
                iconSize: 30,
                icon: Icon(
                  Icons.attachment,
                ),
                onPressed: () {},
              ),
              IconButton(
                color: Colors.black26,
                iconSize: 30,
                icon: Icon(
                  Icons.image,
                ),
                onPressed: () {},
              ),
              IconButton(
                color: primaryColor,
                iconSize: 30,
                icon: Icon(
                  Icons.send_rounded,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getRow(int i) {
    return GestureDetector(
      child: Row(
        children: [
          CircleAvatar(
              radius: (40),
              backgroundColor: Colors.white,
              child: Image.asset("assets/login.png")),
          Column(
            children: [Text("Title"), Text("Message")],
          )
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, ApplicationRoute.messageDetailRoute);
      },
    );
  }

  Widget getRowRed(int i) {
    return GestureDetector(
      child: Row(
        children: [
          Column(
            children: [Text("Title"), Text("Message")],
          ),
          CircleAvatar(
              radius: (40),
              backgroundColor: Colors.white,
              child: Image.asset("assets/login.png")),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, ApplicationRoute.messageDetailRoute);
      },
    );
  }
}
