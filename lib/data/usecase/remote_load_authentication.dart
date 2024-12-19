import 'package:firebase_auth/firebase_auth.dart';

class RemoteLoadAuthentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> createUser({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e);
    }
  }

  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e);
    }
  }

  String _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'Usuário não encontrado. Verifique o e-mail e tente novamente.';
      case 'invalid-credential':
        return 'Email ou Senha incorreto. Por favor, tente novamente.';
      case 'email-already-in-use':
        return 'E-mail inválido. Por favor, insira um endereço de e-mail válido.';
      default:
        return 'Ocorreu um erro. Tente novamente mais tarde.';
    }
  }
}
