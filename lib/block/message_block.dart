import 'dart:async';

import 'package:chat_time/event/message_event_enum.dart';
import 'package:chat_time/model/chatlist_model.dart';
import 'package:chat_time/network/chat/send_message.dart';

class MessageBlock {
  final _messageListStreamController = StreamController<ChatListModel>();

  StreamSink<ChatListModel> get _messageListSink =>
      _messageListStreamController.sink;
  Stream<ChatListModel> get messageStream =>
      _messageListStreamController.stream;

  final _messageListEventController = StreamController<MessageEvent>();

  StreamSink<MessageEvent> get messageEventSink =>
      _messageListEventController.sink;

  Stream<MessageEvent> get messageEventStream =>
      _messageListEventController.stream;

  MessageBlock([ChatListModel? chatListModel]) {
    messageEventStream.listen((event) {
      if (event == MessageEvent.search) {
      } else if (event == MessageEvent.message) {
        sendMessageToUser(chatListModel!);
      } else if (event == MessageEvent.load) {
      } else if (event == MessageEvent.send) {
      } else if (event == MessageEvent.add) {}
    });
  }
}
