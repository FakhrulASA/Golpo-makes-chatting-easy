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
          SizedBox(
            height: 10,
          ),
          Flexible(
            child: ListView.builder(
              itemCount: 20,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int position) {
                return getRow(position);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget getRow(int i) {
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
                radius: 26,
                backgroundColor: Color.fromARGB(255, 0, 172, 6),
                child: CircleAvatar(
                    radius: isOnline ? 22 : 26,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/avatar.png")),
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
                            style: TextStyle(fontWeight: FontWeight.w600),
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
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic,
                                ),
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
}
