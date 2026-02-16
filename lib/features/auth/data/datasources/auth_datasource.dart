import 'package:modularapparchitecture/core/services/firebase_auth_service.dart';

/// Abstract auth data source (implement with Firebase, mock, etc.).
abstract class AuthDatasource {
  Future<void> login(String email, String password);
  Future<void> signUp(String email, String password);
  Future<void> signOut();
  Future<void> sendPasswordReset(String email);
}

/// Firebase implementation.
class AuthDatasourceImpl implements AuthDatasource {
  AuthDatasourceImpl([FirebaseAuthService? authService])
      : _auth = authService ?? FirebaseAuthService();

  final FirebaseAuthService _auth;

  @override
  Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email, password);
  }

  @override
  Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(email, password);
  }

  @override
  Future<void> signOut() => _auth.signOut();

  @override
  Future<void> sendPasswordReset(String email) =>
      _auth.sendPasswordResetEmail(email);
}
