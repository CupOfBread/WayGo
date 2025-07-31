// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_record_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountRecordType _$AccountRecordTypeFromJson(Map<String, dynamic> json) =>
    AccountRecordType(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
      iconUrl: json['iconUrl'] as String?,
      direction: (json['direction'] as num?)?.toInt() ?? 1,
      isSysDefault: json['isSysDefault'] as bool? ?? false,
    );

Map<String, dynamic> _$AccountRecordTypeToJson(AccountRecordType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'iconUrl': instance.iconUrl,
      'direction': instance.direction,
      'isSysDefault': instance.isSysDefault,
    };
