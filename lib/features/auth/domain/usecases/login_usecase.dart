import '../repositories/auth_repository.dart';

/// Login use case. Single responsibility.
class LoginUseCase {
  LoginUseCase(this._repository);

  final AuthRepository _repository;

  Future<void> call(String email, String password) {
    return _repository.login(email, password);
  }
}
