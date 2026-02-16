/// Auth repository contract (domain layer).
abstract class AuthRepository {
  Future<void> login(String email, String password);
  Future<void> signUp(String email, String password);
  Future<void> signOut();
  Future<void> sendPasswordReset(String email);
}
