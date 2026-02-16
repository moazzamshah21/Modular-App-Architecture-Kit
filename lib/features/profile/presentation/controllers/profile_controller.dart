import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../domain/entities/profile_entity.dart';
import '../../domain/usecases/get_profile_usecase.dart';
import '../../domain/usecases/update_profile_usecase.dart';

/// Profile controller. Shows architecture works beyond auth.
class ProfileController extends GetxController {
  ProfileController(
    this._getProfileUseCase,
    this._updateProfileUseCase,
  );

  final GetProfileUseCase _getProfileUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;

  final profile = Rx<ProfileEntity?>(null);
  final isLoading = false.obs;
  final errorMessage = Rx<String?>(null);

  @override
  void onReady() {
    super.onReady();
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) loadProfile(uid);
  }

  Future<void> loadProfile(String userId) async {
    try {
      errorMessage.value = null;
      isLoading.value = true;
      profile.value = await _getProfileUseCase(userId);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateDisplayName(String displayName) async {
    final current = profile.value;
    if (current == null) return;
    try {
      errorMessage.value = null;
      isLoading.value = true;
      profile.value = await _updateProfileUseCase(
        ProfileEntity(
          id: current.id,
          displayName: displayName,
          email: current.email,
          avatarUrl: current.avatarUrl,
        ),
      );
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
