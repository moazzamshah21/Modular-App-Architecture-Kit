import 'package:get/get.dart';

import 'package:modularapparchitecture/app/models/media_model.dart';
import 'package:modularapparchitecture/app/models/playlist_model.dart';
import 'package:modularapparchitecture/app/services/firebase_service.dart';

class MediaController extends GetxController {
  MediaController(this._firebase);

  final FirebaseService _firebase;

  final mediaList = <MediaModel>[].obs;
  final playlists = <PlaylistModel>[].obs;
  final currentMedia = Rx<MediaModel?>(null);
  final isPlaying = false.obs;
  final isLoading = false.obs;

  @override
  void onReady() {
    loadMedia();
    loadPlaylists();
    super.onReady();
  }

  Future<void> loadMedia() async {
    isLoading.value = true;
    try {
      mediaList.value = await _firebase.getMediaList();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadPlaylists() async {
    playlists.value = await _firebase.getPlaylists();
  }

  void play(MediaModel media) {
    currentMedia.value = media;
    isPlaying.value = true;
  }

  void pause() => isPlaying.value = false;

  void togglePlayPause() {
    if (currentMedia.value == null) return;
    isPlaying.value = !isPlaying.value;
  }

  void next() {
    final list = mediaList;
    final current = currentMedia.value;
    if (current == null || list.isEmpty) return;
    final i = list.indexWhere((m) => m.id == current.id);
    if (i >= 0 && i < list.length - 1) play(list[i + 1]);
  }

  void previous() {
    final list = mediaList;
    final current = currentMedia.value;
    if (current == null || list.isEmpty) return;
    final i = list.indexWhere((m) => m.id == current.id);
    if (i > 0) play(list[i - 1]);
  }
}
