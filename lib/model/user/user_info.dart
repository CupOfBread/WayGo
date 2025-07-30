class UserInfo {
  final int id;
  final String code;
  final String name;
  final int gender;
  final String username;
  final String phone;
  final String? email;
  final String? avatarUrl;
  final String? description;
  final String? location;
  final DateTime? birthday;

  UserInfo(
    this.code,
    this.phone,
    this.email,
    this.avatarUrl,
    this.description,
    this.name,
    this.location,
    this.birthday, {
    this.gender = 0,
    required this.id,
    required this.username,
  });
}
