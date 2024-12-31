import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_garden/data/usecase/remote_load_authentication.dart';

class AuthenticationProvider with ChangeNotifier {
  final RemoteLoadAuthentication remoteLoadAuthentication;

  AuthenticationProvider({required this.remoteLoadAuthentication});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  User? get currentUser => remoteLoadAuthentication.getCurrentUser();

  Future<bool> handleSignInWithGoogle() async {
    _isLoading = true;
    notifyListeners();

    try {
      await remoteLoadAuthentication.signInWithGoogle();
      notifyListeners();

      return true;
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> handlesignOut() async {
    await remoteLoadAuthentication.signOut();
    notifyListeners();
  }
}
