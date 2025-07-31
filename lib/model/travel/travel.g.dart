// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TravelPlan _$TravelPlanFromJson(Map<String, dynamic> json) => TravelPlan(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String?,
  tags: json['tags'] as String?,
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  creatorId: (json['creatorId'] as num).toInt(),
  participantIds:
      (json['participantIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  coverUrl: json['coverUrl'] as String?,
  status: (json['status'] as num?)?.toInt() ?? 0,
  totalDistance: (json['totalDistance'] as num?)?.toDouble(),
  totalDays: (json['totalDays'] as num?)?.toInt() ?? 1,
  itineraries:
      (json['itineraries'] as List<dynamic>?)
          ?.map((e) => TravelItinerary.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  shareLuggageId: (json['shareLuggageId'] as num?)?.toInt(),
  createTime: DateTime.parse(json['createTime'] as String),
  updateTime:
      json['updateTime'] == null
          ? null
          : DateTime.parse(json['updateTime'] as String),
);

Map<String, dynamic> _$TravelPlanToJson(TravelPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'tags': instance.tags,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'creatorId': instance.creatorId,
      'participantIds': instance.participantIds,
      'coverUrl': instance.coverUrl,
      'status': instance.status,
      'totalDistance': instance.totalDistance,
      'totalDays': instance.totalDays,
      'itineraries': instance.itineraries,
      'shareLuggageId': instance.shareLuggageId,
      'createTime': instance.createTime.toIso8601String(),
      'updateTime': instance.updateTime?.toIso8601String(),
    };

TravelItinerary _$TravelItineraryFromJson(Map<String, dynamic> json) =>
    TravelItinerary(
      id: (json['id'] as num).toInt(),
      travelPlanId: (json['travelPlanId'] as num).toInt(),
      dayNumber: (json['dayNumber'] as num?)?.toInt() ?? 1,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      title: json['title'] as String,
      description: json['description'] as String?,
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => ItineraryItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      totalDistance: (json['totalDistance'] as num?)?.toDouble(),
      weather: json['weather'] as String?,
      remark: json['remark'] as String?,
    );

Map<String, dynamic> _$TravelItineraryToJson(TravelItinerary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'travelPlanId': instance.travelPlanId,
      'dayNumber': instance.dayNumber,
      'date': instance.date?.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
      'items': instance.items,
      'totalDistance': instance.totalDistance,
      'weather': instance.weather,
      'remark': instance.remark,
    };

ItineraryItem _$ItineraryItemFromJson(Map<String, dynamic> json) =>
    ItineraryItem(
      id: (json['id'] as num).toInt(),
      itineraryId: (json['itineraryId'] as num).toInt(),
      status: (json['status'] as num?)?.toInt() ?? 0,
      title: json['title'] as String,
      description: json['description'] as String?,
      startTime:
          json['startTime'] == null
              ? null
              : DateTime.parse(json['startTime'] as String),
      endTime:
          json['endTime'] == null
              ? null
              : DateTime.parse(json['endTime'] as String),
      coordinate:
          json['coordinate'] == null
              ? null
              : Coordinate.fromJson(json['coordinate'] as Map<String, dynamic>),
      type: (json['type'] as num?)?.toInt() ?? 0,
      sort: (json['sort'] as num?)?.toInt() ?? 0,
      trafficDetailId: (json['trafficDetailId'] as num?)?.toInt(),
      accommodationDetailId: (json['accommodationDetailId'] as num?)?.toInt(),
      foodDetailId: (json['foodDetailId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ItineraryItemToJson(ItineraryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itineraryId': instance.itineraryId,
      'status': instance.status,
      'title': instance.title,
      'description': instance.description,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'coordinate': instance.coordinate,
      'type': instance.type,
      'sort': instance.sort,
      'trafficDetailId': instance.trafficDetailId,
      'accommodationDetailId': instance.accommodationDetailId,
      'foodDetailId': instance.foodDetailId,
    };

TrafficDetail _$TrafficDetailFromJson(Map<String, dynamic> json) =>
    TrafficDetail(
      mode: json['mode'] as String,
      route:
          (json['route'] as List<dynamic>?)
              ?.map((e) => Coordinate.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      duration: json['duration'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
      departure: json['departure'] as String?,
      destination: json['destination'] as String?,
      remark: json['remark'] as String?,
    );

Map<String, dynamic> _$TrafficDetailToJson(TrafficDetail instance) =>
    <String, dynamic>{
      'mode': instance.mode,
      'route': instance.route,
      'duration': instance.duration,
      'distance': instance.distance,
      'departure': instance.departure,
      'destination': instance.destination,
      'remark': instance.remark,
    };

AccommodationDetail _$AccommodationDetailFromJson(Map<String, dynamic> json) =>
    AccommodationDetail(
      hotelName: json['hotelName'] as String,
      location: Coordinate.fromJson(json['location'] as Map<String, dynamic>),
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      checkInTime: json['checkInTime'] as String?,
      checkOutTime: json['checkOutTime'] as String?,
      roomType: json['roomType'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      remark: json['remark'] as String?,
    );

Map<String, dynamic> _$AccommodationDetailToJson(
  AccommodationDetail instance,
) => <String, dynamic>{
  'hotelName': instance.hotelName,
  'location': instance.location,
  'address': instance.address,
  'phone': instance.phone,
  'checkInTime': instance.checkInTime,
  'checkOutTime': instance.checkOutTime,
  'roomType': instance.roomType,
  'price': instance.price,
  'remark': instance.remark,
};

FoodDetail _$FoodDetailFromJson(Map<String, dynamic> json) => FoodDetail(
  restaurantName: json['restaurantName'] as String,
  location: Coordinate.fromJson(json['location'] as Map<String, dynamic>),
  address: json['address'] as String?,
  cuisine: json['cuisine'] as String?,
  phone: json['phone'] as String?,
  remark: json['remark'] as String?,
);

Map<String, dynamic> _$FoodDetailToJson(FoodDetail instance) =>
    <String, dynamic>{
      'restaurantName': instance.restaurantName,
      'location': instance.location,
      'address': instance.address,
      'cuisine': instance.cuisine,
      'phone': instance.phone,
      'remark': instance.remark,
    };
