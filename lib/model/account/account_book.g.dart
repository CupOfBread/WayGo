// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountBook _$AccountBookFromJson(Map<String, dynamic> json) => AccountBook(
  id: (json['id'] as num).toInt(),
  ownerId: (json['ownerId'] as num).toInt(),
  name: json['name'] as String,
  coverUrl: json['coverUrl'] as String?,
  description: json['description'] as String?,
  createTime: DateTime.parse(json['createTime'] as String),
);

Map<String, dynamic> _$AccountBookToJson(AccountBook instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'name': instance.name,
      'coverUrl': instance.coverUrl,
      'description': instance.description,
      'createTime': instance.createTime.toIso8601String(),
    };

AccountRecord _$AccountRecordFromJson(Map<String, dynamic> json) =>
    AccountRecord(
      id: (json['id'] as num).toInt(),
      accountBookId: (json['accountBookId'] as num).toInt(),
      typeId: (json['typeId'] as num).toInt(),
      categoryId: (json['categoryId'] as num).toInt(),
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      createTime: DateTime.parse(json['createTime'] as String),
      payerId: (json['payerId'] as num?)?.toInt(),
      participantIds:
          (json['participantIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList(),
      remark: json['remark'] as String?,
    );

Map<String, dynamic> _$AccountRecordToJson(AccountRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountBookId': instance.accountBookId,
      'typeId': instance.typeId,
      'categoryId': instance.categoryId,
      'amount': instance.amount,
      'createTime': instance.createTime.toIso8601String(),
      'payerId': instance.payerId,
      'participantIds': instance.participantIds,
      'remark': instance.remark,
    };
