import 'package:chat_time/util/ProgressUtil.dart';
import 'package:chat_time/util/color.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 36, 36, 36),
                image: DecorationImage(
                    image: AssetImage("assets/login.png"),
                    fit: BoxFit.scaleDown),
              ),
              child: Column(
                children: const [Text("dasdas")],
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
              showCommonDialog(
                  context,
                  "Do you really want to log out from the application?",
                  "No",
                  "Yes");
            },
          ),
        ],
      )),
      appBar: AppBar(
        title: const Text("Messages"),
        backgroundColor: const Color.fromARGB(255, 36, 36, 36),
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
