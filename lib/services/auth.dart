import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:blackbeanbliss/models/user.dart';

class AuthService {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  // Create user obj based on Firebase User
  User? _userFromFirebaseUser(auth.User? user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Sign in anon
  Future<User?> signInAnon() async {
    try {
      auth.UserCredential result = await _auth.signInAnonymously();
      auth.User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with email & password

  // Register with email & password

  // Sign out
}
