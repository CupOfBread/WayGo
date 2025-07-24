class UserInfo {
  final int id;
  final String code;
  final String name;
  final int gender;
  final String username;
  final String phone;
  final String email;
  final String avatarUrl;
  final String description;
  final String location;

  UserInfo(
    this.code,
    this.gender,
    this.phone,
    this.email,
    this.avatarUrl,
    this.description,
    this.name,
    this.location, {
    required this.id,
    required this.username,
  });
}
