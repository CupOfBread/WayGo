import 'package:waygo/model/coordinate.dart';

class ScenicSpot {
  final int id;
  final String code;
  final String name;
  final double? score;
  final DateTime? scoreUpdateTime;
  final List<String>? picUrlList;
  final String description;
  final DateTime createTime;
  final ScenicSpotExtInfo? extInfo;
  final Coordinate? coordinate;

  ScenicSpot(
    this.picUrlList,
    this.description,
    this.score,
    this.scoreUpdateTime,
    this.createTime,
    this.extInfo,
    this.coordinate, {
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

  ScenicSpotExtInfo(
    this.scenicSpotId,
    this.businessHours,
    this.location,
    this.telephone,
  );
}
