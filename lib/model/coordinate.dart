class Coordinate {
  /// 纬度
  late double latitude;

  /// 经度
  late double longitude;

  Coordinate({
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() => {
    'latitude': latitude,
    'longitude': longitude,
  };

  factory Coordinate.fromJson(Map<String, dynamic> json) => Coordinate(
    latitude: json['latitude']?.toDouble() ?? 0.0,
    longitude: json['longitude']?.toDouble() ?? 0.0,
  );
}
