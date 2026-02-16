/// Profile entity (domain layer). Pure Dart, no frameworks.
class ProfileEntity {
  const ProfileEntity({
    required this.id,
    required this.displayName,
    this.email,
    this.avatarUrl,
  });

  final String id;
  final String displayName;
  final String? email;
  final String? avatarUrl;
}
