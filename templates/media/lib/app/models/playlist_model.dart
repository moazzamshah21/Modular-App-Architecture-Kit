import 'media_model.dart';

class PlaylistModel {
  const PlaylistModel({
    required this.id,
    required this.name,
    this.items = const [],
  });

  final String id;
  final String name;
  final List<MediaModel> items;

  factory PlaylistModel.fromMap(Map<String, dynamic> map) {
    final list = map['items'] as List<dynamic>?;
    return PlaylistModel(
      id: map['id'] as String? ?? '',
      name: map['name'] as String? ?? '',
      items: list?.map((e) => MediaModel.fromMap(e as Map<String, dynamic>)).toList() ?? [],
    );
  }
}
