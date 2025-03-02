import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RemoteLoadAuthentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> createUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(name);
        await user.reload();
        user = _firebaseAuth.currentUser;
      }

      return user;
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

  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return false;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);

      return true;
    } on FirebaseAuthException catch (e) {
      _handleAuthError(e);
    } catch (e) {
      throw Exception('Login falhou ou foi cancelado $e');
    }

    return true;
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();

      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Erro ao deslogar $e');
    }
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
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
