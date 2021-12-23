import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
