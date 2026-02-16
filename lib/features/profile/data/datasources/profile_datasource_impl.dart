import '../../domain/entities/profile_entity.dart';
import '../datasources/profile_datasource.dart';

/// In-memory / stub implementation. Replace with Firestore or API client.
class ProfileDatasourceImpl implements ProfileDatasource {
  @override
  Future<ProfileEntity> getProfile(String userId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return ProfileEntity(
      id: userId,
      displayName: 'User',
      email: 'user@example.com',
    );
  }

  @override
  Future<ProfileEntity> updateProfile(ProfileEntity profile) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return profile;
  }
}
