import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:random_chat_app/model/chat_model.dart';
import 'package:random_chat_app/repository/chat_repository.dart';

class ChatController extends ChangeNotifier {
  bool _isLoading = false;
  final _chatRepo = ChatRepository();
  final _firebaseAuth = FirebaseAuth.instance;
  Stream<List<ChatModel>>? chatSnapshot;
  sendMessage(String msg) {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      _chatRepo.addMessage(
        ChatModel(
            userID: user.uid,
            messageID: '231123',
            message: msg,
            date: DateTime.now().millisecondsSinceEpoch.toString(),
            isSender: true),
      );
    }
  }

  void msgListener() async {
    _isLoading = true;
    notifyListeners();
    chatSnapshot = await _chatRepo.getMessage();
      _isLoading = false;
    notifyListeners();
  }
}
