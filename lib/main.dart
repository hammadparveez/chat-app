import 'package:flutter/material.dart';
import 'package:random_chat_app/view/chat_view.dart';
import 'package:random_chat_app/view/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainView(),
      routes: {
        '/chat-view': (_) => ChatView(),
      },
    );
  }
}
