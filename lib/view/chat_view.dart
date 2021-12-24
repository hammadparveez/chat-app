import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_chat_app/pods.dart';

class ChatView extends ConsumerWidget {
  const ChatView({Key? key}) : super(key: key);

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
          Expanded(child: Text('hi')),
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
