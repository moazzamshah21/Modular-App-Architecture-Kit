import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

/// Update profile use case.
class UpdateProfileUseCase {
  UpdateProfileUseCase(this._repository);

  final ProfileRepository _repository;

  Future<ProfileEntity> call(ProfileEntity profile) =>
      _repository.updateProfile(profile);
}
