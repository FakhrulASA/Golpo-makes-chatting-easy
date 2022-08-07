import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:chat_time/component/message_list_component.dart';
import 'package:chat_time/util/ProgressUtil.dart';
import 'package:chat_time/util/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../network/auth/user_state.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  var name = FirebaseAuth.instance.currentUser!.email;
  final storageRef = FirebaseStorage.instance.ref();
  String imageUrlPhoto = "";
  final imagesRef = FirebaseStorage.instance
      .ref()
      .child("images/${getUserEmail()!.split("@")[0]}");

  final storage = FirebaseStorage.instance;
  Uint8List? bytes;
  storeInFirebase(File dataUrl) async {
    try {
      await imagesRef.putFile(dataUrl);
    } on FirebaseException catch (e) {
      log(e.message.toString());
    }
  }

  getDataFromFirebase() async {
    final imageUrl = await imagesRef.getDownloadURL();
    if (imageUrl.isNotEmpty) {
      imageUrlPhoto = imageUrl;
      // always st setstae while working with network image
      setState(() {});
      log(imageUrlPhoto);
    }
  }

  @override
  Widget build(BuildContext context) {
    getDataFromFirebase();
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
                  InkWell(
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();
                      final img =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (img != null) {
                        storeInFirebase(File(img.path));
                      }
                    },
                    child: CircleAvatar(
                      radius: 33,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(imageUrlPhoto)),
                    ),
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
            onTap: () {
              Navigator.pushNamed(context, ApplicationRoute.profileRoute);
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, ApplicationRoute.settingsRote);
            },
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
