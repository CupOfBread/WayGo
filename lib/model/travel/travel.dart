import 'package:json_annotation/json_annotation.dart';
import '../coordinate.dart';

part 'travel.g.dart';

/// 旅行计划模型
@JsonSerializable()
class TravelPlan {
  final int id; // 计划ID
  final String title; // 计划标题
  final String? description; // 计划描述
  final String? tags; // 计划tag
  final DateTime startDate; // 开始日期
  final DateTime endDate; // 结束日期
  final int creatorId; // 创建者ID
  final List<int> participantIds; // 参与者ID列表
  final String? coverUrl; // 封面图片URL
  final int status; // 计划状态(规划中,进行中,已完成,已取消)
  final double? totalDistance; // 总里程（公里）
  final int totalDays; // 总天数
  @JsonKey(defaultValue: [])
  final List<TravelItinerary> itineraries; // 行程安排列表
  final int? shareLuggageId; //共享行李清单
  final DateTime createTime; // 创建时间
  final DateTime? updateTime; // 更新时间

  const TravelPlan({
    required this.id,
    required this.title,
    this.description,
    this.tags,
    required this.startDate,
    required this.endDate,
    required this.creatorId,
    this.participantIds = const [],
    this.coverUrl,
    this.status = 0,
    this.totalDistance,
    this.totalDays = 1,
    this.itineraries = const [],
    this.shareLuggageId,
    required this.createTime,
    this.updateTime,
  });

  /// 从JSON创建TravelPlan对象
  factory TravelPlan.fromJson(Map<String, dynamic> json) => _$TravelPlanFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$TravelPlanToJson(this);

  /// 复制并修改部分字段
  TravelPlan copyWith({
    int? id,
    String? title,
    String? description,
    String? tags,
    DateTime? startDate,
    DateTime? endDate,
    int? creatorId,
    List<int>? participantIds,
    String? coverUrl,
    int? status,
    double? totalDistance,
    int? totalDays,
    List<TravelItinerary>? itineraries,
    int? shareLuggageId,
    DateTime? createTime,
    DateTime? updateTime,
  }) {
    return TravelPlan(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      creatorId: creatorId ?? this.creatorId,
      participantIds: participantIds ?? this.participantIds,
      coverUrl: coverUrl ?? this.coverUrl,
      status: status ?? this.status,
      totalDistance: totalDistance ?? this.totalDistance,
      totalDays: totalDays ?? this.totalDays,
      itineraries: itineraries ?? this.itineraries,
      shareLuggageId: shareLuggageId ?? this.shareLuggageId,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TravelPlan &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.tags == tags &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.creatorId == creatorId &&
        other.participantIds == participantIds &&
        other.coverUrl == coverUrl &&
        other.status == status &&
        other.totalDistance == totalDistance &&
        other.totalDays == totalDays &&
        other.itineraries == itineraries &&
        other.shareLuggageId == shareLuggageId &&
        other.createTime == createTime &&
        other.updateTime == updateTime;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      tags.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      creatorId.hashCode ^
      participantIds.hashCode ^
      coverUrl.hashCode ^
      status.hashCode ^
      totalDistance.hashCode ^
      totalDays.hashCode ^
      itineraries.hashCode ^
      shareLuggageId.hashCode ^
      createTime.hashCode ^
      updateTime.hashCode;

  @override
  String toString() =>
      'TravelPlan(id: $id, title: $title, description: $description, tags: $tags, startDate: $startDate, endDate: $endDate, creatorId: $creatorId, participantIds: $participantIds, coverUrl: $coverUrl, status: $status, totalDistance: $totalDistance, totalDays: $totalDays, itineraries: $itineraries, shareLuggageId: $shareLuggageId, createTime: $createTime, updateTime: $updateTime)';
}

/// 行程模型
@JsonSerializable()
class TravelItinerary {
  final int id; // 行程ID
  final int travelPlanId; // 所属旅行计划ID
  final int dayNumber; // 第几天
  final DateTime? date; // 具体日期
  final String title; // 行程标题
  final String? description; // 行程描述
  @JsonKey(defaultValue: [])
  final List<ItineraryItem> items; // 行程项目列表
  final double? totalDistance; // 当天总里程
  final String? weather; // 天气信息
  final String? remark; // 备注信息

  const TravelItinerary({
    required this.id,
    required this.travelPlanId,
    this.dayNumber = 1,
    this.date,
    required this.title,
    this.description,
    this.items = const [],
    this.totalDistance,
    this.weather,
    this.remark,
  });

  /// 从JSON创建TravelItinerary对象
  factory TravelItinerary.fromJson(Map<String, dynamic> json) => _$TravelItineraryFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$TravelItineraryToJson(this);

  /// 复制并修改部分字段
  TravelItinerary copyWith({
    int? id,
    int? travelPlanId,
    int? dayNumber,
    DateTime? date,
    String? title,
    String? description,
    List<ItineraryItem>? items,
    double? totalDistance,
    String? weather,
    String? remark,
  }) {
    return TravelItinerary(
      id: id ?? this.id,
      travelPlanId: travelPlanId ?? this.travelPlanId,
      dayNumber: dayNumber ?? this.dayNumber,
      date: date ?? this.date,
      title: title ?? this.title,
      description: description ?? this.description,
      items: items ?? this.items,
      totalDistance: totalDistance ?? this.totalDistance,
      weather: weather ?? this.weather,
      remark: remark ?? this.remark,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TravelItinerary &&
        other.id == id &&
        other.travelPlanId == travelPlanId &&
        other.dayNumber == dayNumber &&
        other.date == date &&
        other.title == title &&
        other.description == description &&
        other.items == items &&
        other.totalDistance == totalDistance &&
        other.weather == weather &&
        other.remark == remark;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      travelPlanId.hashCode ^
      dayNumber.hashCode ^
      date.hashCode ^
      title.hashCode ^
      description.hashCode ^
      items.hashCode ^
      totalDistance.hashCode ^
      weather.hashCode ^
      remark.hashCode;

  @override
  String toString() =>
      'TravelItinerary(id: $id, travelPlanId: $travelPlanId, dayNumber: $dayNumber, date: $date, title: $title, description: $description, items: $items, totalDistance: $totalDistance, weather: $weather, remark: $remark)';
}

/// 行程项目模型
@JsonSerializable()
class ItineraryItem {
  final int id; // 项目ID
  final int itineraryId; // 所属行程ID
  final int status; // 计划状态(未开始,进行中,已完成)
  final String title; // 项目标题
  final String? description; // 项目描述
  final DateTime? startTime; // 开始时间
  final DateTime? endTime; // 结束时间
  final Coordinate? coordinate; // 地理坐标
  final int type; // 项目类型（1景点，2交通，3住宿，4餐饮，5活动，6购物，7娱乐，8备注）
  final int sort; // 排序索引
  final int? trafficDetailId; // 交通信息
  final int? accommodationDetailId; // 住宿信息
  final int? foodDetailId; // 餐饮信息

  const ItineraryItem({
    required this.id,
    required this.itineraryId,
    this.status = 0,
    required this.title,
    this.description,
    this.startTime,
    this.endTime,
    this.coordinate,
    this.type = 0,
    this.sort = 0,
    this.trafficDetailId,
    this.accommodationDetailId,
    this.foodDetailId,
  });

  /// 从JSON创建ItineraryItem对象
  factory ItineraryItem.fromJson(Map<String, dynamic> json) => _$ItineraryItemFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$ItineraryItemToJson(this);

  /// 复制并修改部分字段
  ItineraryItem copyWith({
    int? id,
    int? itineraryId,
    int? status,
    String? title,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
    Coordinate? coordinate,
    int? type,
    int? sort,
    int? trafficDetailId,
    int? accommodationDetailId,
    int? foodDetailId,
  }) {
    return ItineraryItem(
      id: id ?? this.id,
      itineraryId: itineraryId ?? this.itineraryId,
      status: status ?? this.status,
      title: title ?? this.title,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      coordinate: coordinate ?? this.coordinate,
      type: type ?? this.type,
      sort: sort ?? this.sort,
      trafficDetailId: trafficDetailId ?? this.trafficDetailId,
      accommodationDetailId: accommodationDetailId ?? this.accommodationDetailId,
      foodDetailId: foodDetailId ?? this.foodDetailId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ItineraryItem &&
        other.id == id &&
        other.itineraryId == itineraryId &&
        other.status == status &&
        other.title == title &&
        other.description == description &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.coordinate == coordinate &&
        other.type == type &&
        other.sort == sort &&
        other.trafficDetailId == trafficDetailId &&
        other.accommodationDetailId == accommodationDetailId &&
        other.foodDetailId == foodDetailId;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      itineraryId.hashCode ^
      status.hashCode ^
      title.hashCode ^
      description.hashCode ^
      startTime.hashCode ^
      endTime.hashCode ^
      coordinate.hashCode ^
      type.hashCode ^
      sort.hashCode ^
      trafficDetailId.hashCode ^
      accommodationDetailId.hashCode ^
      foodDetailId.hashCode;

  @override
  String toString() =>
      'ItineraryItem(id: $id, itineraryId: $itineraryId, status: $status, title: $title, description: $description, startTime: $startTime, endTime: $endTime, coordinate: $coordinate, type: $type, sort: $sort, trafficDetailId: $trafficDetailId, accommodationDetailId: $accommodationDetailId, foodDetailId: $foodDetailId)';
}

/// 交通信息详情
@JsonSerializable()
class TrafficDetail {
  final String mode; // 交通方式（步行、公交、自驾、地铁、高铁、飞机等）
  @JsonKey(defaultValue: [])
  final List<Coordinate> route; // 行驶路线
  final String? duration; // 预计时长
  final double? distance; // 行驶距离（公里）
  final String? departure; // 出发地
  final String? destination; // 目的地
  final String? remark; // 备注信息

  const TrafficDetail({
    required this.mode,
    this.route = const [],
    this.duration,
    this.distance,
    this.departure,
    this.destination,
    this.remark,
  });

  /// 从JSON创建TrafficDetail对象
  factory TrafficDetail.fromJson(Map<String, dynamic> json) => _$TrafficDetailFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$TrafficDetailToJson(this);

  /// 复制并修改部分字段
  TrafficDetail copyWith({
    String? mode,
    List<Coordinate>? route,
    String? duration,
    double? distance,
    String? departure,
    String? destination,
    String? remark,
  }) {
    return TrafficDetail(
      mode: mode ?? this.mode,
      route: route ?? this.route,
      duration: duration ?? this.duration,
      distance: distance ?? this.distance,
      departure: departure ?? this.departure,
      destination: destination ?? this.destination,
      remark: remark ?? this.remark,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TrafficDetail &&
        other.mode == mode &&
        other.route == route &&
        other.duration == duration &&
        other.distance == distance &&
        other.departure == departure &&
        other.destination == destination &&
        other.remark == remark;
  }

  @override
  int get hashCode =>
      mode.hashCode ^
      route.hashCode ^
      duration.hashCode ^
      distance.hashCode ^
      departure.hashCode ^
      destination.hashCode ^
      remark.hashCode;

  @override
  String toString() =>
      'TrafficDetail(mode: $mode, route: $route, duration: $duration, distance: $distance, departure: $departure, destination: $destination, remark: $remark)';
}

/// 住宿信息详情
@JsonSerializable()
class AccommodationDetail {
  final String hotelName; // 酒店名称
  final Coordinate location; // 酒店坐标
  final String? address; // 酒店地址
  final String? phone; // 联系电话
  final String? checkInTime; // 入住时间
  final String? checkOutTime; // 退房时间
  final String? roomType; // 房间类型
  final double? price; // 房间价格
  final String? remark; // 备注信息

  const AccommodationDetail({
    required this.hotelName,
    required this.location,
    this.address,
    this.phone,
    this.checkInTime,
    this.checkOutTime,
    this.roomType,
    this.price,
    this.remark,
  });

  /// 从JSON创建AccommodationDetail对象
  factory AccommodationDetail.fromJson(Map<String, dynamic> json) =>
      _$AccommodationDetailFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$AccommodationDetailToJson(this);

  /// 复制并修改部分字段
  AccommodationDetail copyWith({
    String? hotelName,
    Coordinate? location,
    String? address,
    String? phone,
    String? checkInTime,
    String? checkOutTime,
    String? roomType,
    double? price,
    String? remark,
  }) {
    return AccommodationDetail(
      hotelName: hotelName ?? this.hotelName,
      location: location ?? this.location,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      checkInTime: checkInTime ?? this.checkInTime,
      checkOutTime: checkOutTime ?? this.checkOutTime,
      roomType: roomType ?? this.roomType,
      price: price ?? this.price,
      remark: remark ?? this.remark,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AccommodationDetail &&
        other.hotelName == hotelName &&
        other.location == location &&
        other.address == address &&
        other.phone == phone &&
        other.checkInTime == checkInTime &&
        other.checkOutTime == checkOutTime &&
        other.roomType == roomType &&
        other.price == price &&
        other.remark == remark;
  }

  @override
  int get hashCode =>
      hotelName.hashCode ^
      location.hashCode ^
      address.hashCode ^
      phone.hashCode ^
      checkInTime.hashCode ^
      checkOutTime.hashCode ^
      roomType.hashCode ^
      price.hashCode ^
      remark.hashCode;

  @override
  String toString() =>
      'AccommodationDetail(hotelName: $hotelName, location: $location, address: $address, phone: $phone, checkInTime: $checkInTime, checkOutTime: $checkOutTime, roomType: $roomType, price: $price, remark: $remark)';
}

/// 餐饮信息详情
@JsonSerializable()
class FoodDetail {
  final String restaurantName; // 餐厅名称
  final Coordinate location; // 餐厅坐标
  final String? address; // 餐厅地址
  final String? cuisine; // 菜系类型
  final String? phone; // 联系电话
  final String? remark; // 备注信息

  const FoodDetail({
    required this.restaurantName,
    required this.location,
    this.address,
    this.cuisine,
    this.phone,
    this.remark,
  });

  /// 从JSON创建FoodDetail对象
  factory FoodDetail.fromJson(Map<String, dynamic> json) => _$FoodDetailFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$FoodDetailToJson(this);

  /// 复制并修改部分字段
  FoodDetail copyWith({
    String? restaurantName,
    Coordinate? location,
    String? address,
    String? cuisine,
    String? phone,
    String? remark,
  }) {
    return FoodDetail(
      restaurantName: restaurantName ?? this.restaurantName,
      location: location ?? this.location,
      address: address ?? this.address,
      cuisine: cuisine ?? this.cuisine,
      phone: phone ?? this.phone,
      remark: remark ?? this.remark,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FoodDetail &&
        other.restaurantName == restaurantName &&
        other.location == location &&
        other.address == address &&
        other.cuisine == cuisine &&
        other.phone == phone &&
        other.remark == remark;
  }

  @override
  int get hashCode =>
      restaurantName.hashCode ^
      location.hashCode ^
      address.hashCode ^
      cuisine.hashCode ^
      phone.hashCode ^
      remark.hashCode;

  @override
  String toString() =>
      'FoodDetail(restaurantName: $restaurantName, location: $location, address: $address, cuisine: $cuisine, phone: $phone, remark: $remark)';
}
