import 'package:json_annotation/json_annotation.dart';

part 'coordinate.g.dart';

@JsonSerializable()
class Coordinate {
  /// 纬度
  final double latitude;

  /// 经度
  final double longitude;

  const Coordinate({
    required this.latitude,
    required this.longitude,
  });

  /// 从JSON创建Coordinate对象
  factory Coordinate.fromJson(Map<String, dynamic> json) => _$CoordinateFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$CoordinateToJson(this);

  /// 复制并修改部分字段
  Coordinate copyWith({
    double? latitude,
    double? longitude,
  }) {
    return Coordinate(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Coordinate &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;

  @override
  String toString() => 'Coordinate(latitude: $latitude, longitude: $longitude)';
}
