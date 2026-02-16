class SleepLogModel {
  const SleepLogModel({
    required this.id,
    required this.bedTime,
    required this.wakeTime,
    this.quality,
    this.notes,
  });

  final String id;
  final DateTime bedTime;
  final DateTime wakeTime;
  final int? quality; // 1-5
  final String? notes;

  Duration get duration => wakeTime.difference(bedTime);

  factory SleepLogModel.fromMap(Map<String, dynamic> map) {
    return SleepLogModel(
      id: map['id'] as String? ?? '',
      bedTime: DateTime.tryParse(map['bedTime'].toString()) ?? DateTime.now(),
      wakeTime: DateTime.tryParse(map['wakeTime'].toString()) ?? DateTime.now(),
      quality: map['quality'] as int?,
      notes: map['notes'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'bedTime': bedTime.toIso8601String(),
        'wakeTime': wakeTime.toIso8601String(),
        'quality': quality,
        'notes': notes,
      };
}
