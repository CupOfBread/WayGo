// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
  id: (json['id'] as num).toInt(),
  code: json['code'] as String,
  name: json['name'] as String,
  gender: (json['gender'] as num?)?.toInt() ?? 0,
  username: json['username'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  description: json['description'] as String?,
  location: json['location'] as String?,
  birthday:
      json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
);

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
  'gender': instance.gender,
  'username': instance.username,
  'phone': instance.phone,
  'email': instance.email,
  'avatarUrl': instance.avatarUrl,
  'description': instance.description,
  'location': instance.location,
  'birthday': instance.birthday?.toIso8601String(),
};
