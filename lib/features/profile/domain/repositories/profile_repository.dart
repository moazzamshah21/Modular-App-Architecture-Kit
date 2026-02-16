import '../entities/profile_entity.dart';

/// Profile repository contract. Fetch/update profile.
abstract class ProfileRepository {
  Future<ProfileEntity> getProfile(String userId);
  Future<ProfileEntity> updateProfile(ProfileEntity profile);
}
