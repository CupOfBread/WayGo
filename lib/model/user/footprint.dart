import 'package:json_annotation/json_annotation.dart';
import '../coordinate.dart';

part 'footprint.g.dart';

/// 足迹类型配置类
///
/// 示例值：
/// 1. 景点类型配置
/// {
///   "id": 1,
///   "type": "scenic_spot",
///   "name": "景点",
///   "description": "旅游景点、名胜古迹等",
///   "status": 1,
///   "sort": 1,
///   "createTime": "2024-01-01 00:00:00",
///   "updateTime": "2024-01-01 00:00:00"
/// }
///
/// 2. 餐厅类型配置
/// {
///   "id": 2,
///   "type": "restaurant",
///   "name": "餐厅",
///   "description": "各类餐厅、美食店等",
///   "status": 1,
///   "sort": 2,
///   "createTime": "2024-01-01 00:00:00",
///   "updateTime": "2024-01-01 00:00:00"
/// }
///
/// 3. 国家类型配置
/// {
///   "id": 3,
///   "type": "country",
///   "name": "国家",
///   "description": "访问过的国家或地区",
///   "status": 1,
///   "sort": 3,
///   "createTime": "2024-01-01 00:00:00",
///   "updateTime": "2024-01-01 00:00:00"
/// }
///
/// 4. 城市类型配置
/// {
///   "id": 4,
///   "type": "city",
///   "name": "城市",
///   "description": "访问过的城市",
///   "status": 1,
///   "sort": 4,
///   "createTime": "2024-01-01 00:00:00",
///   "updateTime": "2024-01-01 00:00:00"
/// }
@JsonSerializable()
class FootPrintTypeConfig {
  final int id;

  /// 统计类型标识
  /// 定义该足迹类型在统计中的分类方式
  final String type;

  /// 统计名称标识
  /// 对应多语言资源中的名称键值
  final String name;

  /// 统计描述标识
  /// 对应多语言资源中的描述键值
  final String description;

  /// 足迹类型状态
  /// 0: 禁用, 1: 启用
  final int status;

  /// 排序权重
  /// 用于确定足迹类型在列表中的显示顺序，数值越小排序越靠前
  final int sort;

  /// 创建时间
  final DateTime createTime;

  /// 更新时间
  final DateTime updateTime;

  const FootPrintTypeConfig({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.status,
    required this.sort,
    required this.createTime,
    required this.updateTime,
  });

  /// 从JSON创建FootPrintTypeConfig对象
  factory FootPrintTypeConfig.fromJson(Map<String, dynamic> json) => 
      _$FootPrintTypeConfigFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$FootPrintTypeConfigToJson(this);

  /// 复制并修改部分字段
  FootPrintTypeConfig copyWith({
    int? id,
    String? type,
    String? name,
    String? description,
    int? status,
    int? sort,
    DateTime? createTime,
    DateTime? updateTime,
  }) {
    return FootPrintTypeConfig(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
      sort: sort ?? this.sort,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FootPrintTypeConfig &&
        other.id == id &&
        other.type == type &&
        other.name == name &&
        other.description == description &&
        other.status == status &&
        other.sort == sort &&
        other.createTime == createTime &&
        other.updateTime == updateTime;
  }

  @override
  int get hashCode => 
      id.hashCode ^ 
      type.hashCode ^ 
      name.hashCode ^ 
      description.hashCode ^ 
      status.hashCode ^ 
      sort.hashCode ^ 
      createTime.hashCode ^ 
      updateTime.hashCode;

  @override
  String toString() => 
      'FootPrintTypeConfig(id: $id, type: $type, name: $name, description: $description, status: $status, sort: $sort, createTime: $createTime, updateTime: $updateTime)';
}

/// 用户海拔记录类
/// 记录用户到达过的最高海拔地点（每个用户只有一条记录）
///
/// 示例值：
/// {
///   "id": 1,
///   "userId": 1001,
///   "locationName": "云顶峰大本营",
///   "description": "虚构的最高峰大本营",
///   "altitude": 5200,
///   "unit": "米",
///   "peakName": "云顶峰",
///   "maxAltitude": 8848,
///   "visitDate": "2023-10-15 00:00:00",
///   "coordinate": {
///     "latitude": 1.0,
///     "longitude": 1.0
///   },
///   "metadata": {
///     "weather": "晴朗",
///     "difficulty": "极高",
///     "acclimatization_days": 7,
///     "guide_name": "阿山",
///     "team_size": 8
///   },
///   "createTime": "2023-10-15 00:00:00",
///   "updateTime": "2023-10-15 00:00:00"
/// }
@JsonSerializable()
class UserAltitudeRecord {
  final int id;
  final int userId;

  /// 地点名称
  final String locationName;

  /// 地点描述
  final String description;

  /// 海拔高度
  final double altitude;

  /// 高度单位
  final String unit;

  /// 山峰名称（如果是山峰）
  final String? peakName;

  /// 山峰最高海拔（如果是山峰）
  final double? maxAltitude;

  /// 访问日期
  final DateTime visitDate;

  /// 地理坐标
  final Coordinate coordinate;

  /// 额外元数据
  final Map<String, dynamic>? metadata;

  /// 创建时间
  final DateTime createTime;

  /// 更新时间
  final DateTime updateTime;

  const UserAltitudeRecord({
    required this.id,
    required this.userId,
    required this.locationName,
    required this.description,
    required this.altitude,
    required this.unit,
    this.peakName,
    this.maxAltitude,
    required this.visitDate,
    required this.coordinate,
    this.metadata,
    required this.createTime,
    required this.updateTime,
  });

  /// 从JSON创建UserAltitudeRecord对象
  factory UserAltitudeRecord.fromJson(Map<String, dynamic> json) => 
      _$UserAltitudeRecordFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$UserAltitudeRecordToJson(this);

  /// 复制并修改部分字段
  UserAltitudeRecord copyWith({
    int? id,
    int? userId,
    String? locationName,
    String? description,
    double? altitude,
    String? unit,
    String? peakName,
    double? maxAltitude,
    DateTime? visitDate,
    Coordinate? coordinate,
    Map<String, dynamic>? metadata,
    DateTime? createTime,
    DateTime? updateTime,
  }) {
    return UserAltitudeRecord(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      locationName: locationName ?? this.locationName,
      description: description ?? this.description,
      altitude: altitude ?? this.altitude,
      unit: unit ?? this.unit,
      peakName: peakName ?? this.peakName,
      maxAltitude: maxAltitude ?? this.maxAltitude,
      visitDate: visitDate ?? this.visitDate,
      coordinate: coordinate ?? this.coordinate,
      metadata: metadata ?? this.metadata,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserAltitudeRecord &&
        other.id == id &&
        other.userId == userId &&
        other.locationName == locationName &&
        other.description == description &&
        other.altitude == altitude &&
        other.unit == unit &&
        other.peakName == peakName &&
        other.maxAltitude == maxAltitude &&
        other.visitDate == visitDate &&
        other.coordinate == coordinate &&
        other.metadata == metadata &&
        other.createTime == createTime &&
        other.updateTime == updateTime;
  }

  @override
  int get hashCode => 
      id.hashCode ^ 
      userId.hashCode ^ 
      locationName.hashCode ^ 
      description.hashCode ^ 
      altitude.hashCode ^ 
      unit.hashCode ^ 
      peakName.hashCode ^ 
      maxAltitude.hashCode ^ 
      visitDate.hashCode ^ 
      coordinate.hashCode ^ 
      metadata.hashCode ^ 
      createTime.hashCode ^ 
      updateTime.hashCode;

  @override
  String toString() => 
      'UserAltitudeRecord(id: $id, userId: $userId, locationName: $locationName, description: $description, altitude: $altitude, unit: $unit, peakName: $peakName, maxAltitude: $maxAltitude, visitDate: $visitDate, coordinate: $coordinate, metadata: $metadata, createTime: $createTime, updateTime: $updateTime)';
}

/// 用户足迹记录类
///
/// 示例值：
/// 1. 景点足迹记录
/// {
///   "id": 1,
///   "userId": 1001,
///   "type": "scenic_spot",
///   "key": "梦幻宫殿",
///   "value": "虚构的古代宫殿",
///   "count": 3,
///   "recordDate": "2024-03-15 00:00:00",
///   "coordinate": {
///     "latitude": 1.0,
///     "longitude": 1.0
///   },
///   "metadata": {
///     "rating": 5,
///     "visit_duration": "2小时"
///   },
///   "createTime": "2024-03-15 00:00:00",
///   "updateTime": "2024-03-15 00:00:00"
/// }
///
/// 2. 餐厅足迹记录
/// {
///   "id": 2,
///   "userId": 1001,
///   "type": "restaurant",
///   "key": "香满楼",
///   "value": "虚构的百年老字号餐厅",
///   "count": 1,
///   "recordDate": "2024-03-16 00:00:00",
///   "coordinate": {
///     "latitude": 1.0,
///     "longitude": 1.0
///   },
///   "metadata": {
///     "rating": 4,
///     "price_range": "中档",
///     "cuisine": "川菜"
///   },
///   "createTime": "2024-03-16 00:00:00",
///   "updateTime": "2024-03-16 00:00:00"
/// }
///
/// 3. 国家足迹记录
/// {
///   "id": 3,
///   "userId": 1001,
///   "type": "country",
///   "key": "樱花国",
///   "value": "虚构的樱花之国，科技发达",
///   "count": 2,
///   "recordDate": "2024-02-20 00:00:00",
///   "coordinate": {
///     "latitude": 1.0,
///     "longitude": 1.0
///   },
///   "metadata": {
///     "visit_days": 14,
///     "favorite_city": "樱花城",
///     "language": "樱花语"
///   },
///   "createTime": "2024-02-20 00:00:00",
///   "updateTime": "2024-02-20 00:00:00"
/// }
///
/// 4. 城市足迹记录
/// {
///   "id": 4,
///   "userId": 1001,
///   "type": "city",
///   "key": "浪漫城",
///   "value": "虚构的浪漫之都，艺术之都",
///   "count": 1,
///   "recordDate": "2024-01-10 00:00:00",
///   "coordinate": {
///     "latitude": 1.0,
///     "longitude": 1.0
///   },
///   "metadata": {
///     "visit_days": 7,
///     "favorite_spot": "浪漫塔",
///     "language": "浪漫语",
///     "currency": "浪漫币"
///   },
///   "createTime": "2024-01-10 00:00:00",
///   "updateTime": "2024-01-10 00:00:00"
/// }
@JsonSerializable()
class UserFootPrint {
  final int id;
  final int userId;

  /// 统计类型
  /// 用于分类不同类型的足迹，如：景点、餐厅、酒店等
  final String type;

  /// 统计键
  /// 具体的统计项目标识，如：景点名称、餐厅类型等
  final String key;

  /// 统计值
  /// 存储具体的统计内容，如：景点描述、餐厅评价等
  final String? value;

  /// 计数
  /// 该类型足迹的累计数量，默认为0
  @JsonKey(defaultValue: 0)
  final int count;

  /// 产生日期
  /// 足迹产生的日期
  final DateTime? recordDate;

  /// 地理坐标
  /// 足迹产生的地理位置坐标
  final Coordinate? coordinate;

  /// 额外元数据
  final Map<String, dynamic>? metadata;

  /// 创建时间
  final DateTime createTime;

  /// 更新时间
  final DateTime updateTime;

  const UserFootPrint({
    required this.id,
    required this.userId,
    required this.type,
    required this.key,
    this.value,
    this.count = 0,
    this.recordDate,
    this.coordinate,
    this.metadata,
    required this.createTime,
    required this.updateTime,
  });

  /// 从JSON创建UserFootPrint对象
  factory UserFootPrint.fromJson(Map<String, dynamic> json) => 
      _$UserFootPrintFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$UserFootPrintToJson(this);

  /// 复制并修改部分字段
  UserFootPrint copyWith({
    int? id,
    int? userId,
    String? type,
    String? key,
    String? value,
    int? count,
    DateTime? recordDate,
    Coordinate? coordinate,
    Map<String, dynamic>? metadata,
    DateTime? createTime,
    DateTime? updateTime,
  }) {
    return UserFootPrint(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      key: key ?? this.key,
      value: value ?? this.value,
      count: count ?? this.count,
      recordDate: recordDate ?? this.recordDate,
      coordinate: coordinate ?? this.coordinate,
      metadata: metadata ?? this.metadata,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserFootPrint &&
        other.id == id &&
        other.userId == userId &&
        other.type == type &&
        other.key == key &&
        other.value == value &&
        other.count == count &&
        other.recordDate == recordDate &&
        other.coordinate == coordinate &&
        other.metadata == metadata &&
        other.createTime == createTime &&
        other.updateTime == updateTime;
  }

  @override
  int get hashCode => 
      id.hashCode ^ 
      userId.hashCode ^ 
      type.hashCode ^ 
      key.hashCode ^ 
      value.hashCode ^ 
      count.hashCode ^ 
      recordDate.hashCode ^ 
      coordinate.hashCode ^ 
      metadata.hashCode ^ 
      createTime.hashCode ^ 
      updateTime.hashCode;

  @override
  String toString() => 
      'UserFootPrint(id: $id, userId: $userId, type: $type, key: $key, value: $value, count: $count, recordDate: $recordDate, coordinate: $coordinate, metadata: $metadata, createTime: $createTime, updateTime: $updateTime)';
}
