import 'dart:convert';

class ChatListModel {
  String message = "";
  String time = "";
  bool isRead = false;
  String name = "";
  String image = "";
  ChatListModel({
    required this.message,
    required this.time,
    required this.isRead,
    required this.name,
    required this.image,
  });

  ChatListModel copyWith({
    String? message,
    String? time,
    bool? isRead,
    String? name,
    String? image,
  }) {
    return ChatListModel(
      message: message ?? this.message,
      time: time ?? this.time,
      isRead: isRead ?? this.isRead,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'time': time,
      'isRead': isRead,
      'name': name,
      'image': image,
    };
  }

  factory ChatListModel.fromMap(Map<String, dynamic> map) {
    return ChatListModel(
      message: map['message'] as String,
      time: map['time'] as String,
      isRead: map['isRead'] as bool,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatListModel.fromJson(String source) =>
      ChatListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatListModel(message: $message, time: $time, isRead: $isRead, name: $name, image: $image)';
  }

  @override
  bool operator ==(covariant ChatListModel other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.time == time &&
        other.isRead == isRead &&
        other.name == name &&
        other.image == image;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        time.hashCode ^
        isRead.hashCode ^
        name.hashCode ^
        image.hashCode;
  }
}
