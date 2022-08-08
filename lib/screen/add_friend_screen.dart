import 'package:chat_time/util/color.dart';
import 'package:flutter/material.dart';

import '../component/message_list_component.dart';

class AddFriendScreen extends StatefulWidget {
  const AddFriendScreen({Key? key}) : super(key: key);

  @override
  State<AddFriendScreen> createState() => _AddFriendScreenState();
}

class _AddFriendScreenState extends State<AddFriendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a friend"),
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(6, 8, 6, 4),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0, color: brightColor),
                color: Color.fromARGB(255, 221, 221, 228),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      minLines: 1,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: "Search user...",
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
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(3, (index) {
                return Card(
                    child: getFriendAddItem(context,
                        index)); //robohash.org api provide you different images for any number you are giving
              }),
            ),
          ),
        ],
      ),
    );
  }
}
