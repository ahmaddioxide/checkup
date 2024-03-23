import 'package:checkup/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final currentUser = _auth.currentUser;

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return Future.error('Wrong password provided for that user.');
      } else if (e.code == 'too-many-requests') {
        return Future.error('Too many requests. Try again later.');
      } else if (e.code == 'network-request-failed') {
        return Future.error(
            'Network request failed. Check your internet connection.',);
      } else if (e.code == 'operation-not-allowed') {
        return Future.error('Operation not allowed. Please try again later.');
      } else if (e.code == 'internal-error') {
        return Future.error('Internal error. Please try again later.');
      } else if (e.code == 'invalid-email') {
        return Future.error('Invalid email. Please try again later.');
      } else if (e.code == 'user-disabled') {
        return Future.error('User disabled. Please contact support.');
      } else if (e.code == 'invalid-credential') {
        return Future.error('Invalid credential. Please try again later.');
      } else {
        myLog.e('An error occurred', error: e);

        return Future.error('An error occurred');
      }
    }
  }

  Future<User?> signUpWithEmailAndPassword(
      String email, String password,) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return Future.error('The account already exists for that email.');
      } else if (e.code == 'too-many-requests') {
        return Future.error('Too many requests. Try again later.');
      } else if (e.code == 'network-request-failed') {
        return Future.error(
            'Network request failed. Check your internet connection.',);
      } else if (e.code == 'operation-not-allowed') {
        return Future.error('Operation not allowed. Please try again later.');
      } else if (e.code == 'internal-error') {
        return Future.error('Internal error. Please try again later.');
      } else if (e.code == 'invalid-email') {
        return Future.error('Invalid email. Please try again later.');
      } else if (e.code == 'user-disabled') {
        return Future.error('User disabled. Please contact support.');
      } else {
        myLog.e('An error occurred', error: e);

        return Future.error('An error occurred');
      }
    } catch (e) {
      myLog.e('An error occurred', error: e);

      return Future.error(e);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
