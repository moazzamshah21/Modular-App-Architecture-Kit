import '../repositories/auth_repository.dart';

/// Sign up use case.
class SignUpUseCase {
  SignUpUseCase(this._repository);

  final AuthRepository _repository;

  Future<void> call(String email, String password) {
    return _repository.signUp(email, password);
  }
}
