import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_chat_app/model/user_model.dart';

class UserRepository {
  final _firestore = FirebaseFirestore.instance;

  Future addUser(UserModel user) async {
    final docRef = _firestore.collection('user').doc(user.uid);
    final docSnapshot = await docRef.get();
    if (docSnapshot.exists) return;
    await _firestore.collection('user').doc(user.uid).set(user.toMap());
  }
}
