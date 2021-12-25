import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_chat_app/model/chat_model.dart';
import 'package:random_chat_app/pods.dart';

class ChatView extends ConsumerStatefulWidget {
  ChatView({Key? key}) : super(key: key);

  @override
  ConsumerState<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  final List<ChatModel> chatModels = [];
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    ref.read(chatController).msgListener();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatSnapshot = ref.watch(chatController).chatSnapshot;
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
              child: StreamBuilder(
                  stream: chatSnapshot,
                  builder: (context, AsyncSnapshot<List<ChatModel>> snapshot) {
                    final data = snapshot.data;
                    return ListView.builder(
                      itemCount: data?.length ?? 0,
                      itemBuilder: (_, index) {
                        return Align(
                          alignment: data![index].isSender
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.purple[900],
                            ),
                            child: Text(data[index].message,
                                style: TextStyle(color: Colors.white)),
                          ),
                        );
                      },
                    );
                  })),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                ),
              ),
              TextButton(
                  onPressed: () {
                    ref.read(chatController).sendMessage(controller.text);
                  },
                  child: Text('Send')),
            ],
          ),
        ],
      ),
    );
  }
}
