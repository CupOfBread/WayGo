// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'footprint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FootPrintTypeConfig _$FootPrintTypeConfigFromJson(Map<String, dynamic> json) =>
    FootPrintTypeConfig(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      status: (json['status'] as num).toInt(),
      sort: (json['sort'] as num).toInt(),
      createTime: DateTime.parse(json['createTime'] as String),
      updateTime: DateTime.parse(json['updateTime'] as String),
    );

Map<String, dynamic> _$FootPrintTypeConfigToJson(
  FootPrintTypeConfig instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'name': instance.name,
  'description': instance.description,
  'status': instance.status,
  'sort': instance.sort,
  'createTime': instance.createTime.toIso8601String(),
  'updateTime': instance.updateTime.toIso8601String(),
};

UserAltitudeRecord _$UserAltitudeRecordFromJson(Map<String, dynamic> json) =>
    UserAltitudeRecord(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      locationName: json['locationName'] as String,
      description: json['description'] as String,
      altitude: (json['altitude'] as num).toDouble(),
      unit: json['unit'] as String,
      peakName: json['peakName'] as String?,
      maxAltitude: (json['maxAltitude'] as num?)?.toDouble(),
      visitDate: DateTime.parse(json['visitDate'] as String),
      coordinate: Coordinate.fromJson(
        json['coordinate'] as Map<String, dynamic>,
      ),
      metadata: json['metadata'] as Map<String, dynamic>?,
      createTime: DateTime.parse(json['createTime'] as String),
      updateTime: DateTime.parse(json['updateTime'] as String),
    );

Map<String, dynamic> _$UserAltitudeRecordToJson(UserAltitudeRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'locationName': instance.locationName,
      'description': instance.description,
      'altitude': instance.altitude,
      'unit': instance.unit,
      'peakName': instance.peakName,
      'maxAltitude': instance.maxAltitude,
      'visitDate': instance.visitDate.toIso8601String(),
      'coordinate': instance.coordinate,
      'metadata': instance.metadata,
      'createTime': instance.createTime.toIso8601String(),
      'updateTime': instance.updateTime.toIso8601String(),
    };

UserFootPrint _$UserFootPrintFromJson(Map<String, dynamic> json) =>
    UserFootPrint(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      type: json['type'] as String,
      key: json['key'] as String,
      value: json['value'] as String?,
      count: (json['count'] as num?)?.toInt() ?? 0,
      recordDate:
          json['recordDate'] == null
              ? null
              : DateTime.parse(json['recordDate'] as String),
      coordinate:
          json['coordinate'] == null
              ? null
              : Coordinate.fromJson(json['coordinate'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
      createTime: DateTime.parse(json['createTime'] as String),
      updateTime: DateTime.parse(json['updateTime'] as String),
    );

Map<String, dynamic> _$UserFootPrintToJson(UserFootPrint instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': instance.type,
      'key': instance.key,
      'value': instance.value,
      'count': instance.count,
      'recordDate': instance.recordDate?.toIso8601String(),
      'coordinate': instance.coordinate,
      'metadata': instance.metadata,
      'createTime': instance.createTime.toIso8601String(),
      'updateTime': instance.updateTime.toIso8601String(),
    };
