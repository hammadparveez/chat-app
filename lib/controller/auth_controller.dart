import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum AuthStatus { error, success, loading }

class AuthController extends ChangeNotifier {
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

      final user = await GoogleSignIn().signIn();

      if (user != null) {
        final authentication = await user.authentication;
        final credentials = GoogleAuthProvider.credential(
            idToken: authentication.idToken,
            accessToken: authentication.accessToken);
        await FirebaseAuth.instance.signInWithCredential(credentials);
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
