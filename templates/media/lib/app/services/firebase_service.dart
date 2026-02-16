import '../models/media_model.dart';
import '../models/playlist_model.dart';

/// Dummy Firebase/API for media. Replace with real storage.
class FirebaseService {
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return true;
  }

  Future<bool> signUp(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return true;
  }

  Future<List<MediaModel>> getMediaList() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return [
      const MediaModel(id: '1', title: 'Track 1', durationSeconds: 180, artist: 'Artist A'),
      const MediaModel(id: '2', title: 'Track 2', durationSeconds: 240, artist: 'Artist B'),
      const MediaModel(id: '3', title: 'Track 3', durationSeconds: 200, artist: 'Artist C'),
    ];
  }

  Future<List<PlaylistModel>> getPlaylists() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      PlaylistModel(id: '1', name: 'Favorites', items: []),
      PlaylistModel(id: '2', name: 'Recent', items: []),
    ];
  }
}
