import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:random_chat_app/model/chat_model.dart';

class ChatRepository {
  final _firestore = FirebaseFirestore.instance;

  addMessage(ChatModel chatModel) async {
    final docSnapshot =
        await _firestore.collection('user').doc(chatModel.userID).get();
    if (docSnapshot.exists) {
      docSnapshot.reference.collection('messages').add(chatModel.toMap());
    }
    final querySnapshots = await _firestore.collection('user').get();
    final docs = querySnapshots.docs;
    final sentMsgModel = chatModel.copyWith(isSender: false);
    for (int i = 0; i < docs.length; i++) {
      if (docs[i].id != chatModel.userID) {
        docs[i].reference.collection('messages').add(sentMsgModel.toMap());
      }
    }
  }

  Future<Stream<List<ChatModel>>> getMessage() async {
    final user = FirebaseAuth.instance.currentUser;
    final docSnap = await _firestore.collection('user').doc(user!.uid).get();
    final mappedSnapshots =
        docSnap.reference.collection('messages').snapshots().map((data) {
      final mappedChats = data.docs.map<ChatModel>((e) {
        final data = e.data();
        return ChatModel.fromMap(data);
      }).toList();
      return mappedChats;
    });
    return mappedSnapshots;
  }
}

/* 


 */
