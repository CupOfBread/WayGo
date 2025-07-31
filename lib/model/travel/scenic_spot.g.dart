// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenic_spot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScenicSpot _$ScenicSpotFromJson(Map<String, dynamic> json) => ScenicSpot(
  id: (json['id'] as num).toInt(),
  code: json['code'] as String,
  name: json['name'] as String,
  score: (json['score'] as num?)?.toDouble(),
  scoreUpdateTime:
      json['scoreUpdateTime'] == null
          ? null
          : DateTime.parse(json['scoreUpdateTime'] as String),
  picUrlList:
      (json['picUrlList'] as List<dynamic>?)?.map((e) => e as String).toList(),
  description: json['description'] as String,
  extInfo:
      json['extInfo'] == null
          ? null
          : ScenicSpotExtInfo.fromJson(json['extInfo'] as Map<String, dynamic>),
  coordinate:
      json['coordinate'] == null
          ? null
          : Coordinate.fromJson(json['coordinate'] as Map<String, dynamic>),
  createTime: DateTime.parse(json['createTime'] as String),
  updateTime: DateTime.parse(json['updateTime'] as String),
);

Map<String, dynamic> _$ScenicSpotToJson(ScenicSpot instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'score': instance.score,
      'scoreUpdateTime': instance.scoreUpdateTime?.toIso8601String(),
      'picUrlList': instance.picUrlList,
      'description': instance.description,
      'extInfo': instance.extInfo,
      'coordinate': instance.coordinate,
      'createTime': instance.createTime.toIso8601String(),
      'updateTime': instance.updateTime.toIso8601String(),
    };

ScenicSpotExtInfo _$ScenicSpotExtInfoFromJson(Map<String, dynamic> json) =>
    ScenicSpotExtInfo(
      scenicSpotId: (json['scenicSpotId'] as num).toInt(),
      businessHours: json['businessHours'] as String,
      location: json['location'] as String,
      telephone: json['telephone'] as String,
    );

Map<String, dynamic> _$ScenicSpotExtInfoToJson(ScenicSpotExtInfo instance) =>
    <String, dynamic>{
      'scenicSpotId': instance.scenicSpotId,
      'businessHours': instance.businessHours,
      'location': instance.location,
      'telephone': instance.telephone,
    };
