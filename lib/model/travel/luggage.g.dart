// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'luggage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TravelPlanLuggage _$TravelPlanLuggageFromJson(Map<String, dynamic> json) =>
    TravelPlanLuggage(
      id: (json['id'] as num).toInt(),
      travelPlanId: (json['travelPlanId'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      share: json['share'] as bool? ?? false,
      luggageList:
          (json['luggageList'] as List<dynamic>?)
              ?.map((e) => Luggage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$TravelPlanLuggageToJson(TravelPlanLuggage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'travelPlanId': instance.travelPlanId,
      'userId': instance.userId,
      'share': instance.share,
      'luggageList': instance.luggageList,
    };

Luggage _$LuggageFromJson(Map<String, dynamic> json) => Luggage(
  id: (json['id'] as num).toInt(),
  userId: (json['userId'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  category: $enumDecodeNullable(_$LuggageCategoryEnumMap, json['category']),
  quantity: (json['quantity'] as num?)?.toInt() ?? 1,
  unit: json['unit'] as String?,
  weight: (json['weight'] as num?)?.toDouble(),
  volume: (json['volume'] as num?)?.toDouble(),
  length: (json['length'] as num?)?.toDouble(),
  width: (json['width'] as num?)?.toDouble(),
  height: (json['height'] as num?)?.toDouble(),
  color: json['color'] as String?,
  status: (json['status'] as num?)?.toInt() ?? 0,
  isEssential: json['isEssential'] as bool?,
  isFragile: json['isFragile'] as bool?,
  isValuable: json['isValuable'] as bool?,
  isInSuitcase: json['isInSuitcase'] as bool? ?? false,
  packTime:
      json['packTime'] == null
          ? null
          : DateTime.parse(json['packTime'] as String),
  unpackTime:
      json['unpackTime'] == null
          ? null
          : DateTime.parse(json['unpackTime'] as String),
  remark: json['remark'] as String?,
  tags: json['tags'] as String?,
  imageUrl: json['imageUrl'] as String?,
  createTime: DateTime.parse(json['createTime'] as String),
  updateTime:
      json['updateTime'] == null
          ? null
          : DateTime.parse(json['updateTime'] as String),
);

Map<String, dynamic> _$LuggageToJson(Luggage instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'name': instance.name,
  'description': instance.description,
  'category': _$LuggageCategoryEnumMap[instance.category],
  'quantity': instance.quantity,
  'unit': instance.unit,
  'weight': instance.weight,
  'volume': instance.volume,
  'length': instance.length,
  'width': instance.width,
  'height': instance.height,
  'color': instance.color,
  'status': instance.status,
  'isEssential': instance.isEssential,
  'isFragile': instance.isFragile,
  'isValuable': instance.isValuable,
  'isInSuitcase': instance.isInSuitcase,
  'packTime': instance.packTime?.toIso8601String(),
  'unpackTime': instance.unpackTime?.toIso8601String(),
  'remark': instance.remark,
  'tags': instance.tags,
  'imageUrl': instance.imageUrl,
  'createTime': instance.createTime.toIso8601String(),
  'updateTime': instance.updateTime?.toIso8601String(),
};

const _$LuggageCategoryEnumMap = {
  LuggageCategory.clothing: 'clothing',
  LuggageCategory.electronics: 'electronics',
  LuggageCategory.toiletries: 'toiletries',
  LuggageCategory.documents: 'documents',
  LuggageCategory.medicine: 'medicine',
  LuggageCategory.food: 'food',
  LuggageCategory.entertainment: 'entertainment',
  LuggageCategory.sports: 'sports',
  LuggageCategory.business: 'business',
  LuggageCategory.baby: 'baby',
  LuggageCategory.pet: 'pet',
  LuggageCategory.other: 'other',
};
