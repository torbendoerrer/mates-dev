import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthenticationProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth;

  AuthenticationProvider(this._firebaseAuth) {
    _authStateChangesListener();
  }

  User? get currentUser => _firebaseAuth.currentUser;

  bool get isAuthenticated => currentUser != null;

  Stream<User?> get userChanges => _firebaseAuth.authStateChanges();

  void _authStateChangesListener() {
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
      notifyListeners(); // Benachrichtigen Sie die Listener über eine Änderung.
    });
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    notifyListeners();
  }
}