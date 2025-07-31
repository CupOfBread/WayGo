import 'package:json_annotation/json_annotation.dart';

part 'luggage.g.dart';

@JsonSerializable()
class TravelPlanLuggage {
  final int id;
  final int? travelPlanId;
  final int? userId;
  final bool share;
  @JsonKey(defaultValue: [])
  final List<Luggage> luggageList;

  const TravelPlanLuggage({
    required this.id,
    this.travelPlanId,
    this.userId,
    this.share = false,
    this.luggageList = const [],
  });

  /// 从JSON创建TravelPlanLuggage对象
  factory TravelPlanLuggage.fromJson(Map<String, dynamic> json) =>
      _$TravelPlanLuggageFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$TravelPlanLuggageToJson(this);

  /// 复制并修改部分字段
  TravelPlanLuggage copyWith({
    int? id,
    int? travelPlanId,
    int? userId,
    bool? share,
    List<Luggage>? luggageList,
  }) {
    return TravelPlanLuggage(
      id: id ?? this.id,
      travelPlanId: travelPlanId ?? this.travelPlanId,
      userId: userId ?? this.userId,
      share: share ?? this.share,
      luggageList: luggageList ?? this.luggageList,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TravelPlanLuggage &&
        other.id == id &&
        other.travelPlanId == travelPlanId &&
        other.userId == userId &&
        other.share == share &&
        other.luggageList == luggageList;
  }

  @override
  int get hashCode =>
      id.hashCode ^ travelPlanId.hashCode ^ userId.hashCode ^ share.hashCode ^ luggageList.hashCode;

  @override
  String toString() =>
      'TravelPlanLuggage(id: $id, travelPlanId: $travelPlanId, userId: $userId, share: $share, luggageList: $luggageList)';
}

@JsonSerializable()
class Luggage {
  final int id;
  final int userId;
  final String name;
  final String description;
  final LuggageCategory? category;
  final int quantity; // 数量
  final String? unit; // 单位：个、件、套等
  final double? weight; // 重量(kg)
  final double? volume; // 体积(cm3)
  final double? length; // 长度(cm)
  final double? width; // 宽度(cm)
  final double? height; // 高度(cm)
  final String? color; // 颜色
  final int status; // 行李状态：0-未打包，1-已打包，2-已拆包，3-丢失，4-损坏，5-已归还
  final bool? isEssential; // 是否必需品
  final bool? isFragile; // 是否易碎品
  final bool? isValuable; // 是否贵重物品
  final bool isInSuitcase; // 是否已放入行李箱
  final DateTime? packTime; // 打包时间
  final DateTime? unpackTime; // 拆包时间
  final String? remark; // 备注信息
  final String? tags; // 标签，用逗号分隔
  final String? imageUrl; // 图片信息
  final DateTime createTime;
  final DateTime? updateTime;

  const Luggage({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
    this.category,
    this.quantity = 1,
    this.unit,
    this.weight,
    this.volume,
    this.length,
    this.width,
    this.height,
    this.color,
    this.status = 0,
    this.isEssential,
    this.isFragile,
    this.isValuable,
    this.isInSuitcase = false,
    this.packTime,
    this.unpackTime,
    this.remark,
    this.tags,
    this.imageUrl,
    required this.createTime,
    this.updateTime,
  });

  /// 从JSON创建Luggage对象
  factory Luggage.fromJson(Map<String, dynamic> json) => _$LuggageFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$LuggageToJson(this);

  /// 复制并修改部分字段
  Luggage copyWith({
    int? id,
    int? userId,
    String? name,
    String? description,
    LuggageCategory? category,
    int? quantity,
    String? unit,
    double? weight,
    double? volume,
    double? length,
    double? width,
    double? height,
    String? color,
    int? status,
    bool? isEssential,
    bool? isFragile,
    bool? isValuable,
    bool? isInSuitcase,
    DateTime? packTime,
    DateTime? unpackTime,
    String? remark,
    String? tags,
    String? imageUrl,
    DateTime? createTime,
    DateTime? updateTime,
  }) {
    return Luggage(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      weight: weight ?? this.weight,
      volume: volume ?? this.volume,
      length: length ?? this.length,
      width: width ?? this.width,
      height: height ?? this.height,
      color: color ?? this.color,
      status: status ?? this.status,
      isEssential: isEssential ?? this.isEssential,
      isFragile: isFragile ?? this.isFragile,
      isValuable: isValuable ?? this.isValuable,
      isInSuitcase: isInSuitcase ?? this.isInSuitcase,
      packTime: packTime ?? this.packTime,
      unpackTime: unpackTime ?? this.unpackTime,
      remark: remark ?? this.remark,
      tags: tags ?? this.tags,
      imageUrl: imageUrl ?? this.imageUrl,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Luggage &&
        other.id == id &&
        other.userId == userId &&
        other.name == name &&
        other.description == description &&
        other.category == category &&
        other.quantity == quantity &&
        other.unit == unit &&
        other.weight == weight &&
        other.volume == volume &&
        other.length == length &&
        other.width == width &&
        other.height == height &&
        other.color == color &&
        other.status == status &&
        other.isEssential == isEssential &&
        other.isFragile == isFragile &&
        other.isValuable == isValuable &&
        other.isInSuitcase == isInSuitcase &&
        other.packTime == packTime &&
        other.unpackTime == unpackTime &&
        other.remark == remark &&
        other.tags == tags &&
        other.imageUrl == imageUrl &&
        other.createTime == createTime &&
        other.updateTime == updateTime;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      name.hashCode ^
      description.hashCode ^
      category.hashCode ^
      quantity.hashCode ^
      unit.hashCode ^
      weight.hashCode ^
      volume.hashCode ^
      length.hashCode ^
      width.hashCode ^
      height.hashCode ^
      color.hashCode ^
      status.hashCode ^
      isEssential.hashCode ^
      isFragile.hashCode ^
      isValuable.hashCode ^
      isInSuitcase.hashCode ^
      packTime.hashCode ^
      unpackTime.hashCode ^
      remark.hashCode ^
      tags.hashCode ^
      imageUrl.hashCode ^
      createTime.hashCode ^
      updateTime.hashCode;

  @override
  String toString() =>
      'Luggage(id: $id, userId: $userId, name: $name, description: $description, category: $category, quantity: $quantity, unit: $unit, weight: $weight, volume: $volume, length: $length, width: $width, height: $height, color: $color, status: $status, isEssential: $isEssential, isFragile: $isFragile, isValuable: $isValuable, isInSuitcase: $isInSuitcase, packTime: $packTime, unpackTime: $unpackTime, remark: $remark, tags: $tags, imageUrl: $imageUrl, createTime: $createTime, updateTime: $updateTime)';
}

/// 行李分类枚举
/// 用于对行李进行分类管理，便于用户整理和查找
enum LuggageCategory {
  /// 衣物类 - 包括衣服、鞋子、配饰等
  clothing('衣物类'),

  /// 电子类 - 包括手机、电脑、充电器等电子设备
  electronics('电子类'),

  /// 洗漱类 - 包括牙刷、牙膏、洗发水等个人护理用品
  toiletries('洗漱类'),

  /// 证件类 - 包括身份证、护照、银行卡等重要证件
  documents('证件类'),

  /// 药品类 - 包括常用药品、急救用品等
  medicine('药品类'),

  /// 食品类 - 包括零食、饮料、特产等
  food('食品类'),

  /// 娱乐类 - 包括书籍、游戏、音乐设备等
  entertainment('娱乐类'),

  /// 运动类 - 包括运动装备、健身用品等
  sports('运动类'),

  /// 商务类 - 包括办公用品、商务服装等
  business('商务类'),

  /// 婴儿用品 - 包括奶粉、尿布、玩具等
  baby('婴儿用品'),

  /// 宠物用品 - 包括宠物食品、玩具、用品等
  pet('宠物用品'),

  /// 其他 - 不属于以上分类的物品
  other('其他');

  /// 构造函数
  const LuggageCategory(this.description);

  /// 分类的中文描述
  final String description;

  /// 获取分类的图标名称（用于UI显示）
  String get iconName {
    switch (this) {
      case LuggageCategory.clothing:
        return 'clothing';
      case LuggageCategory.electronics:
        return 'electronics';
      case LuggageCategory.toiletries:
        return 'toiletries';
      case LuggageCategory.documents:
        return 'documents';
      case LuggageCategory.medicine:
        return 'medicine';
      case LuggageCategory.food:
        return 'food';
      case LuggageCategory.entertainment:
        return 'entertainment';
      case LuggageCategory.sports:
        return 'sports';
      case LuggageCategory.business:
        return 'business';
      case LuggageCategory.baby:
        return 'baby';
      case LuggageCategory.pet:
        return 'pet';
      case LuggageCategory.other:
        return 'other';
    }
  }

  /// 获取分类的优先级（用于排序）
  int get priority {
    switch (this) {
      case LuggageCategory.documents:
        return 1; // 证件最重要
      case LuggageCategory.medicine:
        return 2; // 药品次之
      case LuggageCategory.electronics:
        return 3; // 电子设备
      case LuggageCategory.clothing:
        return 4; // 衣物
      case LuggageCategory.toiletries:
        return 5; // 洗漱用品
      case LuggageCategory.food:
        return 6; // 食品
      case LuggageCategory.entertainment:
        return 7; // 娱乐用品
      case LuggageCategory.sports:
        return 8; // 运动用品
      case LuggageCategory.business:
        return 9; // 商务用品
      case LuggageCategory.baby:
        return 10; // 婴儿用品
      case LuggageCategory.pet:
        return 11; // 宠物用品
      case LuggageCategory.other:
        return 12; // 其他
    }
  }
}
