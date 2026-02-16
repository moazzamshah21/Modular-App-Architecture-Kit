import '../datasources/auth_datasource.dart';
import '../../domain/repositories/auth_repository.dart';

/// Auth repository implementation. Delegates to datasource.
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._datasource);

  final AuthDatasource _datasource;

  @override
  Future<void> login(String email, String password) =>
      _datasource.login(email, password);

  @override
  Future<void> signUp(String email, String password) =>
      _datasource.signUp(email, password);

  @override
  Future<void> signOut() => _datasource.signOut();

  @override
  Future<void> sendPasswordReset(String email) =>
      _datasource.sendPasswordReset(email);
}
