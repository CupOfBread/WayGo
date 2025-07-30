import 'package:waygo/model/coordinate.dart';

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

  ScenicSpot(
    this.picUrlList,
    this.description,
    this.score,
    this.scoreUpdateTime,
    this.createTime,
    this.extInfo,
    this.coordinate,
    this.updateTime, {
    required this.id,
    required this.code,
    required this.name,
  });
}

class ScenicSpotExtInfo {
  final int scenicSpotId;
  final String businessHours;
  final String location;
  final String telephone;

  ScenicSpotExtInfo(this.scenicSpotId, this.businessHours, this.location, this.telephone);
}
