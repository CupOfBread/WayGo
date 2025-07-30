import 'package:waygo/model/coordinate.dart';

/// 旅行计划模型
class TravelPlan {
  late final int id; // 计划ID
  late final String title; // 计划标题
  late final String? description; // 计划描述
  late final String? tags; // 计划tag
  late final DateTime startDate; // 开始日期
  late final DateTime endDate; // 结束日期
  late final int creatorId; // 创建者ID
  late final List<int> participantIds; // 参与者ID列表
  late final String? coverUrl; // 封面图片URL
  late final int status; // 计划状态(规划中,进行中,已完成,已取消)
  late final double? totalDistance; // 总里程（公里）
  late final int totalDays; // 总天数
  late final DateTime createTime; // 创建时间
  late final DateTime? updateTime; // 更新时间
  late final List<TravelItinerary> itineraries; // 行程安排列表
  late final int? shareLuggageId; //共享行李清单
}

/// 行程模型
class TravelItinerary {
  late final int id; // 行程ID
  late final int travelPlanId; // 所属旅行计划ID
  late final int dayNumber; // 第几天
  late final DateTime? date; // 具体日期
  late final String title; // 行程标题
  late final String? description; // 行程描述
  late final List<ItineraryItem> items; // 行程项目列表
  late final double? totalDistance; // 当天总里程
  late final String? weather; // 天气信息
  late final String? remark; // 备注信息
}

/// 行程项目模型
class ItineraryItem {
  late final int id; // 项目ID
  late final int itineraryId; // 所属行程ID
  late final int status; // 计划状态(未开始,进行中,已完成)
  late final String title; // 项目标题
  late final String? description; // 项目描述
  late final DateTime? startTime; // 开始时间
  late final DateTime? endTime; // 结束时间
  late final Coordinate? coordinate; // 地理坐标
  late final int type; // 项目类型（景点，交通，住宿，餐饮，活动，购物，娱乐，备注）
  late final int sort; // 排序索引
  late final int? trafficDetailId; // 交通信息
  late final int? accommodationDetailId; // 住宿信息
  late final int? foodDetailId; // 住宿信息
}

/// 交通信息详情
class TrafficDetail {
  late final String mode; // 交通方式（步行、公交、自驾、地铁、高铁、飞机等）
  late final List<Coordinate> route; // 行驶路线
  late final String? duration; // 预计时长
  late final double? distance; // 行驶距离（公里）
  late final String? departure; // 出发地
  late final String? destination; // 目的地
  late final String? remark; // 备注信息
}

/// 住宿信息详情
class AccommodationDetail {
  late final String hotelName; // 酒店名称
  late final Coordinate location; // 酒店坐标
  late final String? address; // 酒店地址
  late final String? phone; // 联系电话
  late final String? checkInTime; // 入住时间
  late final String? checkOutTime; // 退房时间
  late final String? roomType; // 房间类型
  late final double? price; // 房间价格
  late final String? remark; // 备注信息
}

/// 餐饮信息详情
class FoodDetail {
  late final String restaurantName; // 餐厅名称
  late final Coordinate location; // 餐厅坐标
  late final String? address; // 餐厅地址
  late final String? cuisine; // 菜系类型
  late final String? phone; // 联系电话
  late final String? remark; // 备注信息
}
