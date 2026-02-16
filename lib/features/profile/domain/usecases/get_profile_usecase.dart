import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

/// Get profile use case. Single responsibility.
class GetProfileUseCase {
  GetProfileUseCase(this._repository);

  final ProfileRepository _repository;

  Future<ProfileEntity> call(String userId) => _repository.getProfile(userId);
}
