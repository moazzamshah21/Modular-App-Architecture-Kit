import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_datasource.dart';

/// Profile repository implementation. Delegates to datasource.
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._datasource);

  final ProfileDatasource _datasource;

  @override
  Future<ProfileEntity> getProfile(String userId) =>
      _datasource.getProfile(userId);

  @override
  Future<ProfileEntity> updateProfile(ProfileEntity profile) =>
      _datasource.updateProfile(profile);
}
