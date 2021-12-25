import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:random_chat_app/model/user_model.dart';
import 'package:random_chat_app/repository/user_repository.dart';

enum AuthStatus { error, success, loading }

class AuthController extends ChangeNotifier {
  UserRepository _userRepo = UserRepository();

  AuthStatus? _status;
  AuthStatus? get status => _status;
  set status(value) {
    _status = value;
    notifyListeners();
  }

  AuthController() {
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user == null) {
        status = null;
      } else {
        status = AuthStatus.success;
      }
    });
  }

  authenticate() async {
    try {
      status = AuthStatus.loading;
      await GoogleSignIn().signOut();
      final user = await GoogleSignIn().signIn();

      if (user != null) {
        final authentication = await user.authentication;
        final credentials = GoogleAuthProvider.credential(
            idToken: authentication.idToken,
            accessToken: authentication.accessToken);
        final authenticatedUser =
            await FirebaseAuth.instance.signInWithCredential(credentials);
        await _userRepo.addUser(UserModel(
            uid: authenticatedUser.user!.uid,
            displayName: user.displayName,
            email: user.email,
            profilePic: user.photoUrl));
      } else {
        status = null;
      }
    } catch (e) {
      status = AuthStatus.error;
    }
  }

  void isAuthenticated() {
    status =
        FirebaseAuth.instance.currentUser != null ? AuthStatus.success : null;
  }

  signOut() async {
    status = AuthStatus.loading;
    await FirebaseAuth.instance.signOut();
  }
}
