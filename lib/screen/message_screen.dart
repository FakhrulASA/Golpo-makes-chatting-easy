import 'package:chat_time/util/color.dart';
import 'package:flutter/material.dart';

import '../util/routes.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
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
                itemCount: 1,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int position) {
                  return getRow(position);
                }),
          ),
          Container(
            color: brightColor,
            child: Row(
              children: [
                Flexible(
                  child: TextFormField(
                    minLines: 1,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "Please enter your password",
                      border: InputBorder.none,
                      contentPadding: EdgeInsetsGeometry.lerp(
                          const EdgeInsets.all(10),
                          const EdgeInsets.all(10),
                          0.0),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.send),
                  label: Text("Send"),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 15),
                    surfaceTintColor: Colors.red,
                    primary: Color.fromARGB(255, 13, 157, 201),
                  ),
                ),
                SizedBox(
                  width: 5,
                )
              ],
            ),
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
}
