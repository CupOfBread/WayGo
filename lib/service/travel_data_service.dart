import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:waygo/model/travel/travel.dart';
import 'package:waygo/model/travel/luggage.dart';
import 'package:waygo/model/coordinate.dart';

/// 旅行数据服务类
/// 负责旅行计划、行程、行李等数据的本地存储和检索
/// 暂时使用本地存储，后续可扩展为与后端API对接
class TravelDataService {
  // 存储键名常量
  static const String _travelPlansKey = 'travel_plans';
  static const String _itinerariesKey = 'travel_itineraries';
  static const String _itineraryItemsKey = 'itinerary_items';
  static const String _trafficDetailsKey = 'traffic_details';
  static const String _accommodationDetailsKey = 'accommodation_details';
  static const String _foodDetailsKey = 'food_details';
  static const String _luggageListsKey = 'luggage_lists';
  static const String _luggageItemsKey = 'luggage_items';

  // 获取SharedPreferences实例
  static Future<SharedPreferences> get _prefs async {
    return await SharedPreferences.getInstance();
  }

  // ==================== 旅行计划相关方法 ====================

  /// 保存旅行计划
  static Future<void> saveTravelPlan(TravelPlan plan) async {
    final prefs = await _prefs;
    final plans = await getTravelPlans();

    // 检查是否已存在，如果存在则更新，否则添加
    final existingIndex = plans.indexWhere((p) => p.id == plan.id);
    if (existingIndex >= 0) {
      plans[existingIndex] = plan;
    } else {
      plans.add(plan);
    }

    final jsonList = plans.map((p) => _travelPlanToJson(p)).toList();
    await prefs.setString(_travelPlansKey, jsonEncode(jsonList));
  }

  /// 获取所有旅行计划
  static Future<List<TravelPlan>> getTravelPlans() async {
    final prefs = await _prefs;
    final jsonStr = prefs.getString(_travelPlansKey);
    if (jsonStr == null) return [];

    final list = jsonDecode(jsonStr) as List;
    return list.map((e) => _travelPlanFromJson(e)).toList();
  }

  /// 根据ID获取旅行计划
  static Future<TravelPlan?> getTravelPlanById(int id) async {
    final plans = await getTravelPlans();
    try {
      return plans.firstWhere((plan) => plan.id == id);
    } catch (e) {
      return null;
    }
  }

  /// 根据创建者ID获取旅行计划
  static Future<List<TravelPlan>> getTravelPlansByCreator(int creatorId) async {
    final plans = await getTravelPlans();
    return plans.where((plan) => plan.creatorId == creatorId).toList();
  }

  /// 删除旅行计划
  static Future<void> deleteTravelPlan(int id) async {
    final prefs = await _prefs;
    final plans = await getTravelPlans();
    plans.removeWhere((plan) => plan.id == id);

    final jsonList = plans.map((p) => _travelPlanToJson(p)).toList();
    await prefs.setString(_travelPlansKey, jsonEncode(jsonList));
  }

  // ==================== 行程相关方法 ====================

  /// 保存行程
  static Future<void> saveItinerary(TravelItinerary itinerary) async {
    final prefs = await _prefs;
    final itineraries = await getItineraries();

    final existingIndex = itineraries.indexWhere((i) => i.id == itinerary.id);
    if (existingIndex >= 0) {
      itineraries[existingIndex] = itinerary;
    } else {
      itineraries.add(itinerary);
    }

    final jsonList = itineraries.map((i) => _itineraryToJson(i)).toList();
    await prefs.setString(_itinerariesKey, jsonEncode(jsonList));
  }

  /// 获取所有行程
  static Future<List<TravelItinerary>> getItineraries() async {
    final prefs = await _prefs;
    final jsonStr = prefs.getString(_itinerariesKey);
    if (jsonStr == null) return [];

    final list = jsonDecode(jsonStr) as List;
    return list.map((e) => _itineraryFromJson(e)).toList();
  }

  /// 根据旅行计划ID获取行程
  static Future<List<TravelItinerary>> getItinerariesByTravelPlan(int travelPlanId) async {
    final itineraries = await getItineraries();
    return itineraries.where((itinerary) => itinerary.travelPlanId == travelPlanId).toList();
  }

  /// 删除行程
  static Future<void> deleteItinerary(int id) async {
    final prefs = await _prefs;
    final itineraries = await getItineraries();
    itineraries.removeWhere((itinerary) => itinerary.id == id);

    final jsonList = itineraries.map((i) => _itineraryToJson(i)).toList();
    await prefs.setString(_itinerariesKey, jsonEncode(jsonList));
  }

  // ==================== 行程项目相关方法 ====================

  /// 保存行程项目
  static Future<void> saveItineraryItem(ItineraryItem item) async {
    final prefs = await _prefs;
    final items = await getItineraryItems();

    final existingIndex = items.indexWhere((i) => i.id == item.id);
    if (existingIndex >= 0) {
      items[existingIndex] = item;
    } else {
      items.add(item);
    }

    final jsonList = items.map((i) => _itineraryItemToJson(i)).toList();
    await prefs.setString(_itineraryItemsKey, jsonEncode(jsonList));
  }

  /// 获取所有行程项目
  static Future<List<ItineraryItem>> getItineraryItems() async {
    final prefs = await _prefs;
    final jsonStr = prefs.getString(_itineraryItemsKey);
    if (jsonStr == null) return [];

    final list = jsonDecode(jsonStr) as List;
    return list.map((e) => _itineraryItemFromJson(e)).toList();
  }

  /// 根据行程ID获取项目
  static Future<List<ItineraryItem>> getItineraryItemsByItinerary(int itineraryId) async {
    final items = await getItineraryItems();
    return items.where((item) => item.itineraryId == itineraryId).toList();
  }

  /// 删除行程项目
  static Future<void> deleteItineraryItem(int id) async {
    final prefs = await _prefs;
    final items = await getItineraryItems();
    items.removeWhere((item) => item.id == id);

    final jsonList = items.map((i) => _itineraryItemToJson(i)).toList();
    await prefs.setString(_itineraryItemsKey, jsonEncode(jsonList));
  }

  // ==================== 行李相关方法 ====================

  /// 保存行李清单
  static Future<void> saveLuggageList(TravelPlanLuggage luggageList) async {
    final prefs = await _prefs;
    final lists = await getLuggageLists();

    final existingIndex = lists.indexWhere((l) => l.id == luggageList.id);
    if (existingIndex >= 0) {
      lists[existingIndex] = luggageList;
    } else {
      lists.add(luggageList);
    }

    final jsonList = lists.map((l) => _luggageListToJson(l)).toList();
    await prefs.setString(_luggageListsKey, jsonEncode(jsonList));
  }

  /// 获取所有行李清单
  static Future<List<TravelPlanLuggage>> getLuggageLists() async {
    final prefs = await _prefs;
    final jsonStr = prefs.getString(_luggageListsKey);
    if (jsonStr == null) return [];

    final list = jsonDecode(jsonStr) as List;
    return list.map((e) => _luggageListFromJson(e)).toList();
  }

  /// 根据旅行计划ID获取行李清单
  static Future<TravelPlanLuggage?> getLuggageListByTravelPlan(int travelPlanId) async {
    final lists = await getLuggageLists();
    try {
      return lists.firstWhere((list) => list.travelPlanId == travelPlanId);
    } catch (e) {
      return null;
    }
  }

  /// 保存行李项目
  static Future<void> saveLuggageItem(Luggage luggage) async {
    final prefs = await _prefs;
    final items = await getLuggageItems();

    final existingIndex = items.indexWhere((l) => l.id == luggage.id);
    if (existingIndex >= 0) {
      items[existingIndex] = luggage;
    } else {
      items.add(luggage);
    }

    final jsonList = items.map((l) => _luggageToJson(l)).toList();
    await prefs.setString(_luggageItemsKey, jsonEncode(jsonList));
  }

  /// 获取所有行李项目
  static Future<List<Luggage>> getLuggageItems() async {
    final prefs = await _prefs;
    final jsonStr = prefs.getString(_luggageItemsKey);
    if (jsonStr == null) return [];

    final list = jsonDecode(jsonStr) as List;
    return list.map((e) => _luggageFromJson(e)).toList();
  }

  /// 根据用户ID获取行李项目
  static Future<List<Luggage>> getLuggageItemsByUser(int userId) async {
    final items = await getLuggageItems();
    return items.where((item) => item.userId == userId).toList();
  }

  // ==================== 初始化默认数据 ====================

  /// 初始化默认的旅行数据
  static Future<void> initDefaultTravelData() async {
    // 创建示例旅行计划1
    final samplePlan1 = TravelPlan(
      id: 1,
      title: '赛博8D成都3天2晚热辣滚烫之旅旅旅旅旅旅旅旅（测试超长标题会不会有异常）',
      description: '体验成都的现代与古典，品尝正宗川菜',
      tags: '美食,文化,休闲',
      startDate: DateTime(2025, 7, 23),
      endDate: DateTime(2025, 7, 25),
      creatorId: 1,
      participantIds: [2],
      coverUrl: null,
      status: 0, // 规划中
      totalDistance: 49.26,
      totalDays: 3,
      itineraries: [],
      shareLuggageId: null,
      createTime: DateTime.now(),
      updateTime: DateTime.now(),
    );

    // 创建示例旅行计划2
    final samplePlan2 = TravelPlan(
      id: 2,
      title: '川西环线5天4晚自驾之旅',
      description: '探索川西高原的壮美风光',
      tags: '自驾,摄影,自然',
      startDate: DateTime(2025, 8, 10),
      endDate: DateTime(2025, 8, 14),
      creatorId: 1,
      participantIds: [2, 3, 4],
      coverUrl: null,
      status: 0, // 规划中
      totalDistance: 320.5,
      totalDays: 5,
      itineraries: [],
      shareLuggageId: null,
      createTime: DateTime.now(),
      updateTime: DateTime.now(),
    );

    // 保存旅行计划
    await saveTravelPlan(samplePlan1);
    await saveTravelPlan(samplePlan2);

    // 创建示例行李清单
    final sampleLuggageList = TravelPlanLuggage(
      id: 1,
      travelPlanId: 1,
      userId: 1,
      share: true,
      luggageList: [],
    );

    await saveLuggageList(sampleLuggageList);
  }

  // ==================== 数据清理方法 ====================

  /// 清除所有旅行数据
  static Future<void> clearAllTravelData() async {
    final prefs = await _prefs;
    await prefs.remove(_travelPlansKey);
    await prefs.remove(_itinerariesKey);
    await prefs.remove(_itineraryItemsKey);
    await prefs.remove(_trafficDetailsKey);
    await prefs.remove(_accommodationDetailsKey);
    await prefs.remove(_foodDetailsKey);
    await prefs.remove(_luggageListsKey);
    await prefs.remove(_luggageItemsKey);
  }

  // ==================== JSON序列化方法 ====================

  static Map<String, dynamic> _travelPlanToJson(TravelPlan plan) {
    return {
      'id': plan.id,
      'title': plan.title,
      'description': plan.description,
      'tags': plan.tags,
      'startDate': plan.startDate.toIso8601String(),
      'endDate': plan.endDate.toIso8601String(),
      'creatorId': plan.creatorId,
      'participantIds': plan.participantIds,
      'coverUrl': plan.coverUrl,
      'status': plan.status,
      'totalDistance': plan.totalDistance,
      'totalDays': plan.totalDays,
      'shareLuggageId': plan.shareLuggageId,
      'createTime': plan.createTime.toIso8601String(),
      'updateTime': plan.updateTime?.toIso8601String(),
    };
  }

  static TravelPlan _travelPlanFromJson(Map<String, dynamic> json) {
    return TravelPlan(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      tags: json['tags'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      creatorId: json['creatorId'],
      participantIds: List<int>.from(json['participantIds']),
      coverUrl: json['coverUrl'],
      status: json['status'],
      totalDistance: json['totalDistance'],
      totalDays: json['totalDays'],
      itineraries: [],
      shareLuggageId: json['shareLuggageId'],
      createTime: DateTime.parse(json['createTime']),
      updateTime: json['updateTime'] != null ? DateTime.parse(json['updateTime']) : null,
    );
  }

  static Map<String, dynamic> _itineraryToJson(TravelItinerary itinerary) {
    return {
      'id': itinerary.id,
      'travelPlanId': itinerary.travelPlanId,
      'dayNumber': itinerary.dayNumber,
      'date': itinerary.date?.toIso8601String(),
      'title': itinerary.title,
      'description': itinerary.description,
      'totalDistance': itinerary.totalDistance,
      'weather': itinerary.weather,
      'remark': itinerary.remark,
    };
  }

  static TravelItinerary _itineraryFromJson(Map<String, dynamic> json) {
    return TravelItinerary(
      id: json['id'],
      travelPlanId: json['travelPlanId'],
      dayNumber: json['dayNumber'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      title: json['title'],
      description: json['description'],
      items: [],
      totalDistance: json['totalDistance'],
      weather: json['weather'],
      remark: json['remark'],
    );
  }

  static Map<String, dynamic> _itineraryItemToJson(ItineraryItem item) {
    return {
      'id': item.id,
      'itineraryId': item.itineraryId,
      'status': item.status,
      'title': item.title,
      'description': item.description,
      'startTime': item.startTime?.toIso8601String(),
      'endTime': item.endTime?.toIso8601String(),
      'coordinate':
          item.coordinate != null
              ? {'latitude': item.coordinate!.latitude, 'longitude': item.coordinate!.longitude}
              : null,
      'type': item.type,
      'sort': item.sort,
      'trafficDetailId': item.trafficDetailId,
      'accommodationDetailId': item.accommodationDetailId,
      'foodDetailId': item.foodDetailId,
    };
  }

  static ItineraryItem _itineraryItemFromJson(Map<String, dynamic> json) {
    return ItineraryItem(
      id: json['id'],
      itineraryId: json['itineraryId'],
      status: json['status'],
      title: json['title'],
      description: json['description'],
      startTime: json['startTime'] != null ? DateTime.parse(json['startTime']) : null,
      endTime: json['endTime'] != null ? DateTime.parse(json['endTime']) : null,
      coordinate:
          json['coordinate'] != null
              ? Coordinate(
                latitude: json['coordinate']['latitude'],
                longitude: json['coordinate']['longitude'],
              )
              : null,
      type: json['type'],
      sort: json['sort'],
      trafficDetailId: json['trafficDetailId'],
      accommodationDetailId: json['accommodationDetailId'],
      foodDetailId: json['foodDetailId'],
    );
  }

  static Map<String, dynamic> _luggageListToJson(TravelPlanLuggage luggageList) {
    return {
      'id': luggageList.id,
      'travelPlanId': luggageList.travelPlanId,
      'userId': luggageList.userId,
      'share': luggageList.share,
    };
  }

  static TravelPlanLuggage _luggageListFromJson(Map<String, dynamic> json) {
    return TravelPlanLuggage(
      id: json['id'],
      travelPlanId: json['travelPlanId'],
      userId: json['userId'],
      share: json['share'] ?? false,
      luggageList: [],
    );
  }

  static Map<String, dynamic> _luggageToJson(Luggage luggage) {
    return {
      'id': luggage.id,
      'userId': luggage.userId,
      'name': luggage.name,
      'description': luggage.description,
      'category': luggage.category?.index,
      'quantity': luggage.quantity,
      'unit': luggage.unit,
      'weight': luggage.weight,
      'volume': luggage.volume,
      'length': luggage.length,
      'width': luggage.width,
      'height': luggage.height,
      'color': luggage.color,
      'status': luggage.status,
      'isEssential': luggage.isEssential,
      'isFragile': luggage.isFragile,
      'isValuable': luggage.isValuable,
      'isInSuitcase': luggage.isInSuitcase,
      'packTime': luggage.packTime?.toIso8601String(),
      'unpackTime': luggage.unpackTime?.toIso8601String(),
      'remark': luggage.remark,
      'tags': luggage.tags,
      'imageUrl': luggage.imageUrl,
      'createTime': luggage.createTime.toIso8601String(),
      'updateTime': luggage.updateTime?.toIso8601String(),
    };
  }

  static Luggage _luggageFromJson(Map<String, dynamic> json) {
    return Luggage(
      id: json['id'],
      userId: json['userId'],
      name: json['name'],
      description: json['description'],
      category: json['category'] != null ? LuggageCategory.values[json['category']] : null,
      quantity: json['quantity'] ?? 1,
      unit: json['unit'],
      weight: json['weight'],
      volume: json['volume'],
      length: json['length'],
      width: json['width'],
      height: json['height'],
      color: json['color'],
      status: json['status'] ?? 0,
      isEssential: json['isEssential'],
      isFragile: json['isFragile'],
      isValuable: json['isValuable'],
      isInSuitcase: json['isInSuitcase'] ?? false,
      packTime: json['packTime'] != null ? DateTime.parse(json['packTime']) : null,
      unpackTime: json['unpackTime'] != null ? DateTime.parse(json['unpackTime']) : null,
      remark: json['remark'],
      tags: json['tags'],
      imageUrl: json['imageUrl'],
      createTime: DateTime.parse(json['createTime']),
      updateTime: json['updateTime'] != null ? DateTime.parse(json['updateTime']) : null,
    );
  }
}
