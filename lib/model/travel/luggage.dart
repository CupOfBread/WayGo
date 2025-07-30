class TravelPlanLuggage {
  late final int id;
  late final int travelPlanId;
  late final int? userId;
  late final bool share = false;
  late final List<Luggage> luggageLis = [];
}

class Luggage {
  late final int id;
  late final int userId;
  late final String name;
  late final String description;

  late final LuggageCategory? category;

  late final int quantity = 1; // 数量
  late final String? unit; // 单位：个、件、套等
  late final double? weight; // 重量(kg)
  late final double? volume; // 体积(cm3)
  late final double? length; // 长度(cm)
  late final double? width; // 宽度(cm)
  late final double? height; // 高度(cm)
  late final String? color; // 颜色

  late final int status = 0; // 行李状态：0-未打包，1-已打包，2-已拆包，3-丢失，4-损坏，5-已归还
  late final bool? isEssential; // 是否必需品
  late final bool? isFragile; // 是否易碎品
  late final bool? isValuable; // 是否贵重物品
  late final bool isInSuitcase; // 是否已放入行李箱

  late final DateTime createTime;
  late final DateTime? updateTime;
  late final DateTime? packTime; // 打包时间
  late final DateTime? unpackTime; // 拆包时间

  late final String? remark; // 备注信息
  late final String? tags; // 标签，用逗号分隔

  late final String? imageUrl; // 图片信息
}

// 行李分类枚举
enum LuggageCategory {
  clothing, // 衣物类
  electronics, // 电子类
  toiletries, // 洗漱类
  documents, // 证件类
  medicine, // 药品类
  food, // 食品类
  entertainment, // 娱乐类
  sports, // 运动类
  business, // 商务类
  baby, // 婴儿用品
  pet, // 宠物用品
  other, // 其他
}
