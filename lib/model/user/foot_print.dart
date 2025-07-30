import '../coordinate.dart';

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
class FootPrintTypeConfig {
  late final int id;

  /// 统计类型标识
  /// 定义该足迹类型在统计中的分类方式
  late final String type;

  /// 统计名称标识
  /// 对应多语言资源中的名称键值
  late final String name;

  /// 统计描述标识
  /// 对应多语言资源中的描述键值
  late final String description;

  /// 足迹类型状态
  /// 0: 禁用, 1: 启用
  late final int status;

  /// 排序权重
  /// 用于确定足迹类型在列表中的显示顺序，数值越小排序越靠前
  late final int sort;

  /// 创建时间
  late final DateTime createTime;

  /// 更新时间
  late final DateTime updateTime;
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
class UserAltitudeRecord {
  late final int id;

  late final int userId;

  /// 地点名称
  late final String locationName;

  /// 地点描述
  late final String description;

  /// 海拔高度
  late final double altitude;

  /// 高度单位
  late final String unit;

  /// 山峰名称（如果是山峰）
  late final String? peakName;

  /// 山峰最高海拔（如果是山峰）
  late final double? maxAltitude;

  /// 访问日期
  late final DateTime visitDate;

  /// 地理坐标
  late final Coordinate coordinate;

  /// 额外元数据
  late final Map<String, dynamic>? metadata;

  /// 创建时间
  late final DateTime createTime;

  /// 更新时间
  late final DateTime updateTime;
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
///   "Date": "2024-03-15 00:00:00",
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
///   "Date": "2024-03-16 00:00:00",
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
///   "Date": "2024-02-20 00:00:00",
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
///   "Date": "2024-01-10 00:00:00",
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
class UserFootPrint {
  late final int id;

  late final int userId;

  /// 统计类型
  /// 用于分类不同类型的足迹，如：景点、餐厅、酒店等
  late final String type;

  /// 统计键
  /// 具体的统计项目标识，如：景点名称、餐厅类型等
  late final String key;

  /// 统计值
  /// 存储具体的统计内容，如：景点描述、餐厅评价等
  late final String? value;

  /// 计数
  /// 该类型足迹的累计数量，默认为0
  late final int count = 0;

  /// 相关日期
  /// 足迹产生的日期
  late final DateTime? Date;

  /// 地理坐标
  /// 足迹产生的地理位置坐标
  late final Coordinate? coordinate;

  /// 额外元数据
  late final Map<String, dynamic>? metadata;

  /// 创建时间
  late final DateTime createTime;

  /// 更新时间
  late final DateTime updateTime;
}
