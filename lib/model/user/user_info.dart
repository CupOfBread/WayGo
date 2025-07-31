import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
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

  const UserInfo({
    required this.id,
    required this.code,
    required this.name,
    this.gender = 0,
    required this.username,
    required this.phone,
    this.email,
    this.avatarUrl,
    this.description,
    this.location,
    this.birthday,
  });

  /// 从JSON创建UserInfo对象
  factory UserInfo.fromJson(Map<String, dynamic> json) => 
      _$UserInfoFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

  /// 复制并修改部分字段
  UserInfo copyWith({
    int? id,
    String? code,
    String? name,
    int? gender,
    String? username,
    String? phone,
    String? email,
    String? avatarUrl,
    String? description,
    String? location,
    DateTime? birthday,
  }) {
    return UserInfo(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      description: description ?? this.description,
      location: location ?? this.location,
      birthday: birthday ?? this.birthday,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserInfo &&
        other.id == id &&
        other.code == code &&
        other.name == name &&
        other.gender == gender &&
        other.username == username &&
        other.phone == phone &&
        other.email == email &&
        other.avatarUrl == avatarUrl &&
        other.description == description &&
        other.location == location &&
        other.birthday == birthday;
  }

  @override
  int get hashCode => 
      id.hashCode ^ 
      code.hashCode ^ 
      name.hashCode ^ 
      gender.hashCode ^ 
      username.hashCode ^ 
      phone.hashCode ^ 
      email.hashCode ^ 
      avatarUrl.hashCode ^ 
      description.hashCode ^ 
      location.hashCode ^ 
      birthday.hashCode;

  @override
  String toString() => 
      'UserInfo(id: $id, code: $code, name: $name, gender: $gender, username: $username, phone: $phone, email: $email, avatarUrl: $avatarUrl, description: $description, location: $location, birthday: $birthday)';
}
