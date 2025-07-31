// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_record_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountRecordCategory _$AccountRecordCategoryFromJson(
  Map<String, dynamic> json,
) => AccountRecordCategory(
  id: (json['id'] as num).toInt(),
  code: json['code'] as String,
  name: json['name'] as String,
  iconUrl: json['iconUrl'] as String?,
  isSysDefault: json['isSysDefault'] as bool? ?? false,
);

Map<String, dynamic> _$AccountRecordCategoryToJson(
  AccountRecordCategory instance,
) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
  'iconUrl': instance.iconUrl,
  'isSysDefault': instance.isSysDefault,
};
