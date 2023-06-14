import 'package:flutter/material.dart';
import 'package:flutter_tutorial/chat_data.dart';

class AppState extends ChangeNotifier {
  List<ChatData> history = <ChatData>[
    ChatData(ChatMessageType.received, 'こんにちは'),
  ];

  void addHistory(ChatData chatData) {
    history.insert(0, chatData);
    notifyListeners();
  }


  // var current = WordPair.random();
  // var history = <WordPair>[];

  // GlobalKey? historyListKey;

  // void getNext() {
  //   history.insert(0, current);
  //   var animatedList = historyListKey?.currentState as AnimatedListState?;
  //   animatedList?.insertItem(0);
  //   current = WordPair.random();
  //   notifyListeners();
  // }

  // var favorites = <WordPair>[];

  // void toggleFavorite([WordPair? pair]) {
  //   pair = pair ?? current;
  //   if (favorites.contains(pair)) {
  //     favorites.remove(pair);
  //   } else {
  //     favorites.add(pair);
  //   }
  //   notifyListeners();
  // }

  // void removeFavorite(WordPair pair) {
  //   favorites.remove(pair);
  //   notifyListeners();
  // }
}