import 'package:chat_time/util/ProgressUtil.dart';
import 'package:chat_time/util/routes.dart';
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
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int position) {
                  return getRow(position);
                }),
          )
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
