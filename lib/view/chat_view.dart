import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_chat_app/model/chat_model.dart';
import 'package:random_chat_app/pods.dart';

class ChatView extends ConsumerWidget {
  ChatView({Key? key}) : super(key: key);
  final List<ChatModel> chatModels = [];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () => ref.read(authController).signOut(),
              child: Text('Sign Out')),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: 10,
            itemBuilder: (_, index) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.purple[900],
                  ),
                  child: Text("Hi this is mason",
                      style: TextStyle(color: Colors.white)),
                ),
              );
            },
          )),
          Row(
            children: [
              Expanded(
                child: TextFormField(),
              ),
              TextButton(onPressed: () {}, child: Text('Send')),
            ],
          ),
        ],
      ),
    );
  }
}
