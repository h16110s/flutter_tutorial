import 'package:flutter/material.dart';
import 'package:flutter_tutorial/chat_data.dart';

class AppState extends ChangeNotifier {
  String current = '';
  List<ChatData> history = <ChatData>[
    ChatData(ChatMessageType.received, 'こんにちは'),
  ];

  void addHistory(ChatData chatData) {
    history.insert(0, chatData);
    notifyListeners();
  }

  void setCurrent(String text) {
    current = text;
    notifyListeners();
  }
}
