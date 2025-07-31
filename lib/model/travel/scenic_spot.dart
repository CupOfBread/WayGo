import 'package:json_annotation/json_annotation.dart';
import 'package:waygo/model/coordinate.dart';

part 'scenic_spot.g.dart';

@JsonSerializable()
class ScenicSpot {
  final int id;
  final String code;
  final String name;
  final double? score;
  final DateTime? scoreUpdateTime;
  final List<String>? picUrlList;
  final String description;
  final ScenicSpotExtInfo? extInfo;
  final Coordinate? coordinate;
  final DateTime createTime;
  final DateTime updateTime;

  const ScenicSpot({
    required this.id,
    required this.code,
    required this.name,
    this.score,
    this.scoreUpdateTime,
    this.picUrlList,
    required this.description,
    this.extInfo,
    this.coordinate,
    required this.createTime,
    required this.updateTime,
  });

  /// 从JSON创建ScenicSpot对象
  factory ScenicSpot.fromJson(Map<String, dynamic> json) => 
      _$ScenicSpotFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$ScenicSpotToJson(this);

  /// 复制并修改部分字段
  ScenicSpot copyWith({
    int? id,
    String? code,
    String? name,
    double? score,
    DateTime? scoreUpdateTime,
    List<String>? picUrlList,
    String? description,
    ScenicSpotExtInfo? extInfo,
    Coordinate? coordinate,
    DateTime? createTime,
    DateTime? updateTime,
  }) {
    return ScenicSpot(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      score: score ?? this.score,
      scoreUpdateTime: scoreUpdateTime ?? this.scoreUpdateTime,
      picUrlList: picUrlList ?? this.picUrlList,
      description: description ?? this.description,
      extInfo: extInfo ?? this.extInfo,
      coordinate: coordinate ?? this.coordinate,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ScenicSpot &&
        other.id == id &&
        other.code == code &&
        other.name == name &&
        other.score == score &&
        other.scoreUpdateTime == scoreUpdateTime &&
        other.picUrlList == picUrlList &&
        other.description == description &&
        other.extInfo == extInfo &&
        other.coordinate == coordinate &&
        other.createTime == createTime &&
        other.updateTime == updateTime;
  }

  @override
  int get hashCode => 
      id.hashCode ^ 
      code.hashCode ^ 
      name.hashCode ^ 
      score.hashCode ^ 
      scoreUpdateTime.hashCode ^ 
      picUrlList.hashCode ^ 
      description.hashCode ^ 
      extInfo.hashCode ^ 
      coordinate.hashCode ^ 
      createTime.hashCode ^ 
      updateTime.hashCode;

  @override
  String toString() => 
      'ScenicSpot(id: $id, code: $code, name: $name, score: $score, scoreUpdateTime: $scoreUpdateTime, picUrlList: $picUrlList, description: $description, extInfo: $extInfo, coordinate: $coordinate, createTime: $createTime, updateTime: $updateTime)';
}

@JsonSerializable()
class ScenicSpotExtInfo {
  final int scenicSpotId;
  final String businessHours;
  final String location;
  final String telephone;

  const ScenicSpotExtInfo({
    required this.scenicSpotId,
    required this.businessHours,
    required this.location,
    required this.telephone,
  });

  /// 从JSON创建ScenicSpotExtInfo对象
  factory ScenicSpotExtInfo.fromJson(Map<String, dynamic> json) => 
      _$ScenicSpotExtInfoFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$ScenicSpotExtInfoToJson(this);

  /// 复制并修改部分字段
  ScenicSpotExtInfo copyWith({
    int? scenicSpotId,
    String? businessHours,
    String? location,
    String? telephone,
  }) {
    return ScenicSpotExtInfo(
      scenicSpotId: scenicSpotId ?? this.scenicSpotId,
      businessHours: businessHours ?? this.businessHours,
      location: location ?? this.location,
      telephone: telephone ?? this.telephone,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ScenicSpotExtInfo &&
        other.scenicSpotId == scenicSpotId &&
        other.businessHours == businessHours &&
        other.location == location &&
        other.telephone == telephone;
  }

  @override
  int get hashCode => 
      scenicSpotId.hashCode ^ 
      businessHours.hashCode ^ 
      location.hashCode ^ 
      telephone.hashCode;

  @override
  String toString() => 
      'ScenicSpotExtInfo(scenicSpotId: $scenicSpotId, businessHours: $businessHours, location: $location, telephone: $telephone)';
}
