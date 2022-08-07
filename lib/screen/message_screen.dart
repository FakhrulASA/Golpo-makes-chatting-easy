import 'package:chat_time/component/message_item_component.dart';
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
                itemCount: 20,
                scrollDirection: Axis.vertical,
                reverse: true,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int position) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      position % 2 == 0
                          ? getMessageDetailItemSender(context, position)
                          : getMessageDetailItemReceiver(context, position)
                    ],
                  );
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
                        const SizedBox(
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
                icon: const Icon(
                  Icons.attachment,
                ),
                onPressed: () {},
              ),
              IconButton(
                color: Colors.black26,
                iconSize: 30,
                icon: const Icon(
                  Icons.image,
                ),
                onPressed: () {},
              ),
              IconButton(
                color: primaryColor,
                iconSize: 30,
                icon: const Icon(
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
}
