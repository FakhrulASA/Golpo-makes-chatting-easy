import 'package:chat_time/component/message_list_component.dart';
import 'package:chat_time/util/ProgressUtil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  var name = FirebaseAuth.instance.currentUser!.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 36, 36, 36),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 33,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/avatar.png")),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //These can go here or below the header with the same background color
                  Text(name!.split("@")[0],
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)), //customize this text
                  Text(name!,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w400)),
                  //...additional header items here
                ],
              )),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Profile'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Log out'),
            onTap: () {
              showCommonDialog(context);
            },
          ),
        ],
      )),
      appBar: AppBar(
        title: const Text("Messages"),
        backgroundColor: const Color.fromARGB(255, 36, 36, 36),
      ),
      body: Column(
        children: [
          const TextField(
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search_rounded,
                  size: 26,
                ),
                contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                isDense: true,
                hintText: "Search here",
                hintStyle: TextStyle(fontWeight: FontWeight.w200)),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: ListView.builder(
              itemCount: 20,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int position) {
                return getMessageListItem(context, position);
              },
            ),
          )
        ],
      ),
    );
  }
}
