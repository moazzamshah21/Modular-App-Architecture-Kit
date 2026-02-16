import '../../domain/entities/profile_entity.dart';

/// Abstract profile data source (remote, local, or mock).
abstract class ProfileDatasource {
  Future<ProfileEntity> getProfile(String userId);
  Future<ProfileEntity> updateProfile(ProfileEntity profile);
}
