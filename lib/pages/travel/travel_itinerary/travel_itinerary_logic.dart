import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:waygo/service/travel_data_service.dart';
import 'package:waygo/model/travel/travel.dart';
import 'travel_itinerary_state.dart';

class TravelItineraryLogic extends GetxController {
  final TravelItineraryState state = TravelItineraryState();

  @override
  void onInit() {
    super.onInit();
    // 初始化示例数据
    initSampleData();
  }

  /// 初始化示例数据
  void initSampleData() {
    final List<ItineraryItem> sampleItems = [
      ItineraryItem(
        id: 1,
        itineraryId: 1,
        status: 0,
        title: '春熙路',
        description: '成都最繁华的商业步行街，集合出发地点。这里汇聚了众多国际品牌和本土特色店铺，是购物、美食、娱乐的绝佳去处。建议在这里拍照留念，感受成都的现代都市魅力。',
        startTime: DateTime.now().add(Duration(hours: 1)),
        endTime: DateTime.now().add(Duration(hours: 3)),
        type: 0,
        // 景点
        sort: 1,
      ),
      ItineraryItem(
        id: 2,
        itineraryId: 1,
        status: 0,
        title: '自驾',
        description: '约30分钟车程，建议避开早晚高峰时段。路线：春熙路 → 宽窄巷子，途经天府广场，可欣赏沿途城市风光。',
        startTime: DateTime.now().add(Duration(hours: 3)),
        endTime: DateTime.now().add(Duration(hours: 3, minutes: 30)),
        type: 1,
        // 交通
        sort: 2,
      ),
      ItineraryItem(
        id: 3,
        itineraryId: 1,
        status: 0,
        title: '宽窄巷子',
        description: '成都三大历史文化保护区之一。',
        startTime: DateTime.now().add(Duration(hours: 3, minutes: 30)),
        endTime: DateTime.now().add(Duration(hours: 5, minutes: 30)),
        type: 0,
        // 景点
        sort: 3,
      ),
      ItineraryItem(
        id: 4,
        itineraryId: 1,
        status: 0,
        title: '地铁',
        description: '乘坐地铁2号线，从宽窄巷子站到春熙路站，约15分钟。地铁内空调舒适，是夏季出行的理想选择。',
        startTime: DateTime.now().add(Duration(hours: 5, minutes: 30)),
        endTime: DateTime.now().add(Duration(hours: 5, minutes: 45)),
        type: 1,
        // 交通
        sort: 4,
      ),
      ItineraryItem(
        id: 5,
        itineraryId: 1,
        status: 0,
        title: '成都中心假日酒店',
        description: '位于市中心的高档酒店，交通便利，设施完善。房间宽敞舒适，服务周到。酒店内设有餐厅、健身房等配套设施，是商务和休闲出行的理想选择。',
        startTime: DateTime.now().add(Duration(hours: 6)),
        endTime: DateTime.now().add(Duration(hours: 8)),
        type: 2,
        // 住宿
        sort: 5,
      ),
      ItineraryItem(
        id: 6,
        itineraryId: 1,
        status: 0,
        title: '小贴士',
        description: '成都夏季多雨，建议随身携带雨伞或雨衣。同时注意防晒，准备防晒霜和遮阳帽。春熙路和宽窄巷子都是热门景点，建议错峰出行避免拥挤。',
        type: 3,
        // 备注
        sort: 6,
      ),
      ItineraryItem(
        id: 7,
        itineraryId: 1,
        status: 0,
        title: '都江堰景区',
        description:
            '世界文化遗产，中国古代水利工程的杰出代表。由李冰父子在公元前256年修建，至今仍在发挥作用。景区内可以参观二王庙、伏龙观、安澜索桥等景点，了解古代水利科技的精妙之处。建议请导游讲解，深入了解其历史价值。',
        startTime: DateTime.now().add(Duration(days: 1, hours: 9)),
        endTime: DateTime.now().add(Duration(days: 1, hours: 12)),
        type: 0,
        // 景点
        sort: 7,
      ),
      ItineraryItem(
        id: 8,
        itineraryId: 1,
        status: 0,
        title: '高铁',
        description: '从成都东站乘坐高铁前往都江堰，约40分钟车程。高铁班次频繁，建议提前购票。都江堰站距离景区约10分钟车程，可乘坐公交车或打车前往。',
        startTime: DateTime.now().add(Duration(days: 1, hours: 7)),
        endTime: DateTime.now().add(Duration(days: 1, hours: 7, minutes: 40)),
        type: 1,
        // 交通
        sort: 8,
      ),
      ItineraryItem(
        id: 9,
        itineraryId: 1,
        status: 0,
        title: '青城山',
        description:
            '道教名山，世界文化遗产，以"青城天下幽"著称。山上有前山和后山两个景区，前山以道教宫观为主，后山以自然风光见长。建议乘坐索道上山，徒步下山，既能节省体力又能欣赏不同角度的美景。山上空气清新，是避暑纳凉的好去处。',
        startTime: DateTime.now().add(Duration(days: 1, hours: 14)),
        endTime: DateTime.now().add(Duration(days: 1, hours: 18)),
        type: 0,
        // 景点
        sort: 9,
      ),
      ItineraryItem(
        id: 10,
        itineraryId: 1,
        status: 0,
        title: '青城山下民宿',
        description:
            '体验当地特色的民宿风情，感受山居生活的宁静与惬意。民宿主人热情好客，提供地道的农家菜。房间虽然简单但干净舒适，晚上可以听到虫鸣鸟叫，享受远离城市喧嚣的宁静时光。',
        startTime: DateTime.now().add(Duration(days: 1, hours: 19)),
        endTime: DateTime.now().add(Duration(days: 2, hours: 8)),
        type: 2,
        // 住宿
        sort: 10,
      ),
      ItineraryItem(
        id: 11,
        itineraryId: 1,
        status: 0,
        title: '包车',
        description: '从青城山包车前往乐山大佛，约2小时车程。包车服务灵活，可以随时停车拍照。沿途经过乐山市区，可以欣赏岷江风光。建议选择正规包车公司，确保安全。',
        startTime: DateTime.now().add(Duration(days: 2, hours: 8)),
        endTime: DateTime.now().add(Duration(days: 2, hours: 10)),
        type: 1,
        // 交通
        sort: 11,
      ),
      ItineraryItem(
        id: 12,
        itineraryId: 1,
        status: 0,
        title: '成都火锅',
        description: '品尝正宗的成都火锅，麻辣鲜香，是成都美食的代表。推荐尝试毛肚、黄喉、鸭肠等特色食材，配以特制的蘸料，体验地道的川菜文化。',
        startTime: DateTime.now().add(Duration(days: 1, hours: 12)),
        endTime: DateTime.now().add(Duration(days: 1, hours: 13, minutes: 30)),
        type: 4,
        // 餐饮
        sort: 12,
      ),
      ItineraryItem(
        id: 13,
        itineraryId: 1,
        status: 0,
        title: '熊猫基地参观',
        description: '参观成都大熊猫繁育研究基地，近距离观察可爱的大熊猫。了解大熊猫的生活习性和保护工作，是成都旅游的必去景点。',
        startTime: DateTime.now().add(Duration(days: 2, hours: 10, minutes: 30)),
        endTime: DateTime.now().add(Duration(days: 2, hours: 12, minutes: 30)),
        type: 5,
        // 活动
        sort: 13,
      ),
      ItineraryItem(
        id: 14,
        itineraryId: 1,
        status: 0,
        title: '春熙路购物',
        description: '在春熙路购买成都特产和纪念品，如蜀绣、竹编工艺品、川茶等。这里汇集了各种特色店铺，是购物的好去处。',
        startTime: DateTime.now().add(Duration(days: 1, hours: 5, minutes: 30)),
        endTime: DateTime.now().add(Duration(days: 1, hours: 6)),
        type: 6,
        // 购物
        sort: 14,
      ),
      ItineraryItem(
        id: 15,
        itineraryId: 1,
        status: 0,
        title: '川剧变脸表演',
        description: '观看精彩的川剧变脸表演，体验四川传统文化艺术的魅力。变脸是川剧的绝技，表演者能在瞬间变换多种脸谱，令人叹为观止。',
        startTime: DateTime.now().add(Duration(days: 1, hours: 20)),
        endTime: DateTime.now().add(Duration(days: 1, hours: 21, minutes: 30)),
        type: 7,
        // 娱乐
        sort: 15,
      ),
    ];

    // 将ItineraryItem转换为Map格式以保持UI兼容性
    _convertItineraryItemsToMap(sampleItems);
  }

  /// 根据ID加载行程数据
  Future<void> loadItineraryById(int itineraryId) async {
    try {
      state.isLoading.value = true;
      state.errorMessage.value = '';

      // 从service根据ID获取行程项目数据
      final items = await TravelDataService.getItineraryItemsByItinerary(itineraryId);

      if (items.isNotEmpty) {
        // 将ItineraryItem转换为Map格式
        _convertItineraryItemsToMap(items);
      } else {
        state.errorMessage.value = '未找到指定的行程数据';
      }
    } catch (e) {
      state.errorMessage.value = '加载行程数据失败: $e';
      print('加载行程数据失败: $e');
    } finally {
      state.isLoading.value = false;
    }
  }

  /// 将ItineraryItem列表转换为Map格式
  void _convertItineraryItemsToMap(List<ItineraryItem> items) {
    final List<Map<String, dynamic>> convertedItems = [];

    for (var item in items) {
      final Map<String, dynamic> mapItem = {
        'id': item.id,
        'itineraryId': item.itineraryId,
        'status': item.status,
        'type': _getTypeString(item.type),
        'title': item.title,
        'desc': item.description,
        'startTime': item.startTime,
        'endTime': item.endTime,
        'coordinate': item.coordinate,
        'sort': item.sort,
        'trafficDetailId': item.trafficDetailId,
        'accommodationDetailId': item.accommodationDetailId,
        'foodDetailId': item.foodDetailId,
        'image': null, // 暂时设为null，后续可以从其他字段获取
      };

      // 如果是交通类型，添加mode字段
      if (item.type == 1) {
        mapItem['mode'] = item.title;
      }

      convertedItems.add(mapItem);
    }

    state.itineraryItems.value = convertedItems;
  }

  /// 将数字类型转换为字符串类型
  String _getTypeString(int type) {
    switch (type) {
      case 0:
        return 'place'; // 景点
      case 1:
        return 'traffic'; // 交通
      case 2:
        return 'hotel'; // 住宿
      case 3:
        return 'note'; // 备注
      case 4:
        return 'food'; // 餐饮
      case 5:
        return 'activity'; // 活动
      case 6:
        return 'shopping'; // 购物
      case 7:
        return 'entertainment'; // 娱乐
      default:
        return 'other';
    }
  }

  /// 筛选行程项目
  void filterItems(String filterType) {
    state.selectedFilter.value = filterType;
  }

  /// 切换选中的天数标签
  void switchDay(int dayIndex) {
    state.selectedDayIndex.value = dayIndex;
  }

  /// 获取筛选后的项目列表
  List<Map<String, dynamic>> getFilteredItems() {
    if (state.selectedFilter.value == 'all') {
      return state.itineraryItems;
    }

    return state.itineraryItems
        .where((item) => item['type'] == state.selectedFilter.value)
        .toList();
  }

  /// 开始编辑项目
  void startEditItem(int index) {
    state.isEditing.value = true;
    state.editingItemIndex.value = index;
  }

  /// 结束编辑
  void endEdit() {
    state.isEditing.value = false;
    state.editingItemIndex.value = -1;
  }

  /// 更新项目
  void updateItem(int index, Map<String, dynamic> updatedItem) {
    if (index >= 0 && index < state.itineraryItems.length) {
      state.itineraryItems[index] = updatedItem;
      // 这里可以调用service保存到后端
    }
  }

  /// 删除项目
  void deleteItem(int index) {
    if (index >= 0 && index < state.itineraryItems.length) {
      state.itineraryItems.removeAt(index);
      // 这里可以调用service删除后端数据
    }
  }

  /// 添加新项目
  void addItem(Map<String, dynamic> newItem) {
    state.itineraryItems.add(newItem);
    // 这里可以调用service保存到后端
  }

  /// 获取类型的中文显示文本
  String getTypeText(String? type) {
    switch (type) {
      case 'place':
        return '景点';
      case 'traffic':
        return '交通';
      case 'hotel':
        return '酒店';
      case 'note':
        return '备注';
      case 'food':
        return '餐饮';
      case 'activity':
        return '活动';
      case 'shopping':
        return '购物';
      case 'entertainment':
        return '娱乐';
      default:
        return '其他';
    }
  }

  /// 构建通用项目Widget
  Widget buildGeneralItem(Map<String, dynamic> item, int index) {
    // 根据类型确定颜色
    Color iconColor;

    switch (item['type']) {
      case 'place':
        iconColor = Colors.orange;
        break;
      case 'traffic':
        iconColor = Colors.blue;
        break;
      case 'hotel':
        iconColor = Colors.green;
        break;
      case 'note':
        iconColor = Colors.amber;
        break;
      case 'food':
        iconColor = Colors.red;
        break;
      case 'activity':
        iconColor = Colors.purple;
        break;
      case 'shopping':
        iconColor = Colors.pink;
        break;
      case 'entertainment':
        iconColor = Colors.indigo;
        break;
      default:
        iconColor = Colors.grey;
    }

    return Container(
      key: Key('${item['type']}_${index}'),
      decoration: BoxDecoration(),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(color: iconColor, borderRadius: BorderRadius.circular(4)),
            child: Text(
              getTypeText(item['type']),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'] ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  item['desc'] ?? '',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建交通项目Widget
  Widget buildTrafficItem(Map<String, dynamic> item, int index) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              child: Icon(
                item['mode'] == '自驾' ? Icons.directions_car : Icons.directions_transit,
                color: Colors.grey,
                size: 20,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                '${item['mode'] ?? ''}${item['desc'] != null ? ' - ${item['desc']}' : ''}',
                style: const TextStyle(color: Colors.grey, fontSize: 12),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建天数标签组件
  Widget buildDayTags() {
    // 生成天数标签列表（这里可以根据实际数据动态生成）
    final List<String> dayTags = ['总览', '第一天', '第二天', '第三天', '第四天', '第五天'];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:
              dayTags.asMap().entries.map((entry) {
                final index = entry.key;
                final dayTag = entry.value;
                final isSelected = state.selectedDayIndex.value == index;

                return GestureDetector(
                  onTap: () => switchDay(index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF6C63FF) : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected ? const Color(0xFF6C63FF) : Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      dayTag,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey.shade600,
                        fontSize: 12,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
