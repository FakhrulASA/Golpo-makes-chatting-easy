// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatListModel {
  String? message = "";
  bool? isRead = false;
  String? name = "";
  String? image = "";
  String? sender = "";
  String? receiver = "";
  ChatListModel({
    this.message,
    this.isRead,
    this.name,
    this.image,
    this.sender,
    this.receiver,
  });

  ChatListModel copyWith({
    String? message,
    String? time,
    bool? isRead,
    String? name,
    String? image,
    String? sender,
    String? receiver,
  }) {
    return ChatListModel(
      message: message ?? this.message,
      isRead: isRead ?? this.isRead,
      name: name ?? this.name,
      image: image ?? this.image,
      sender: sender ?? this.sender,
      receiver: receiver ?? this.receiver,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'isRead': isRead,
      'name': name,
      'image': image,
      'sender': sender,
      'receiver': receiver,
    };
  }

  factory ChatListModel.fromMap(Map<String, dynamic> map) {
    return ChatListModel(
      message: map['message'] as String,
      isRead: map['isRead'] as bool,
      name: map['name'] as String,
      image: map['image'] as String,
      sender: map['sender'] as String,
      receiver: map['receiver'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatListModel.fromJson(String source) =>
      ChatListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatListModel(message: $message,  isRead: $isRead, name: $name, image: $image, sender: $sender, receiver: $receiver)';
  }

  @override
  bool operator ==(covariant ChatListModel other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.isRead == isRead &&
        other.name == name &&
        other.image == image &&
        other.sender == sender &&
        other.receiver == receiver;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        isRead.hashCode ^
        name.hashCode ^
        image.hashCode ^
        sender.hashCode ^
        receiver.hashCode;
  }
}
