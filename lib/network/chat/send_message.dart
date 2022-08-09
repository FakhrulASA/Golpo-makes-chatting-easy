import 'dart:developer';

import 'package:chat_time/model/chatlist_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

sendMessageToUser(ChatListModel chatListModel) {
  CollectionReference message =
      FirebaseFirestore.instance.collection('messages');

  // Call the user's CollectionReference to add a new user
  message
      .add({
        'sender': chatListModel.sender.toString(), // John Doe
        'receiver': chatListModel.receiver.toString(), // Stokes and Sons
        'message': chatListModel.message.toString(),
        'isRead': chatListModel.isRead,
        'image': chatListModel.image.toString(),
        'name': chatListModel.name.toString() // 42
      })
      .then((value) => log("User Added"))
      .catchError((error) => log("Failed to add user: $error"));
}
