class MediaModel {
  const MediaModel({
    required this.id,
    required this.title,
    required this.durationSeconds,
    this.artist,
    this.thumbnailUrl,
    this.mediaUrl,
  });

  final String id;
  final String title;
  final int durationSeconds;
  final String? artist;
  final String? thumbnailUrl;
  final String? mediaUrl;

  factory MediaModel.fromMap(Map<String, dynamic> map) {
    return MediaModel(
      id: map['id'] as String? ?? '',
      title: map['title'] as String? ?? '',
      durationSeconds: map['durationSeconds'] as int? ?? 0,
      artist: map['artist'] as String?,
      thumbnailUrl: map['thumbnailUrl'] as String?,
      mediaUrl: map['mediaUrl'] as String?,
    );
  }
}
