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
    final List<Map<String, dynamic>> sampleData = [
      {
        'type': 'place',
        'title': '春熙路',
        'desc': '成都最繁华的商业步行街，集合出发地点。这里汇聚了众多国际品牌和本土特色店铺，是购物、美食、娱乐的绝佳去处。建议在这里拍照留念，感受成都的现代都市魅力。',
        'image': null,
      },
      {
        'type': 'traffic',
        'mode': '自驾',
        'desc': '约30分钟车程，建议避开早晚高峰时段。路线：春熙路 → 宽窄巷子，途经天府广场，可欣赏沿途城市风光。',
      },
      {
        'type': 'place',
        'title': '宽窄巷子',
        'desc':
            '成都三大历史文化保护区之一。',
        'image': null,
      },
      {'type': 'traffic', 'mode': '地铁', 'desc': '乘坐地铁2号线，从宽窄巷子站到春熙路站，约15分钟。地铁内空调舒适，是夏季出行的理想选择。'},
      {
        'type': 'hotel',
        'title': '成都中心假日酒店',
        'desc': '位于市中心的高档酒店，交通便利，设施完善。房间宽敞舒适，服务周到。酒店内设有餐厅、健身房等配套设施，是商务和休闲出行的理想选择。',
      },
      {
        'type': 'note',
        'title': '小贴士',
        'desc': '成都夏季多雨，建议随身携带雨伞或雨衣。同时注意防晒，准备防晒霜和遮阳帽。春熙路和宽窄巷子都是热门景点，建议错峰出行避免拥挤。',
        'image': null,
      },
      {
        'type': 'place',
        'title': '都江堰景区',
        'desc':
            '世界文化遗产，中国古代水利工程的杰出代表。由李冰父子在公元前256年修建，至今仍在发挥作用。景区内可以参观二王庙、伏龙观、安澜索桥等景点，了解古代水利科技的精妙之处。建议请导游讲解，深入了解其历史价值。',
        'image': null,
      },
      {
        'type': 'traffic',
        'mode': '高铁',
        'desc': '从成都东站乘坐高铁前往都江堰，约40分钟车程。高铁班次频繁，建议提前购票。都江堰站距离景区约10分钟车程，可乘坐公交车或打车前往。',
      },
      {
        'type': 'place',
        'title': '青城山',
        'desc':
            '道教名山，世界文化遗产，以"青城天下幽"著称。山上有前山和后山两个景区，前山以道教宫观为主，后山以自然风光见长。建议乘坐索道上山，徒步下山，既能节省体力又能欣赏不同角度的美景。山上空气清新，是避暑纳凉的好去处。',
        'image': null,
      },
      {
        'type': 'hotel',
        'title': '青城山下民宿',
        'desc': '体验当地特色的民宿风情，感受山居生活的宁静与惬意。民宿主人热情好客，提供地道的农家菜。房间虽然简单但干净舒适，晚上可以听到虫鸣鸟叫，享受远离城市喧嚣的宁静时光。',
      },
      {
        'type': 'traffic',
        'mode': '包车',
        'desc': '从青城山包车前往乐山大佛，约2小时车程。包车服务灵活，可以随时停车拍照。沿途经过乐山市区，可以欣赏岷江风光。建议选择正规包车公司，确保安全。',
      },
    ];

    state.itineraryItems.value = sampleData;
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
        'type': _getTypeString(item.type),
        'title': item.title,
        'desc': item.description,
        'image': null, // 暂时设为null，后续可以从其他字段获取
      };

      // 如果是交通类型，添加mode字段
      if (item.type == 1) {
        // 假设1代表交通类型
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
      default:
        return 'other';
    }
  }

  /// 筛选行程项目
  void filterItems(String filterType) {
    state.selectedFilter.value = filterType;
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
      case 'hotel':
        return '酒店';
      case 'note':
        return '备注';
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
      case 'hotel':
        iconColor = Colors.green;
        break;
      case 'note':
        iconColor = Colors.amber;
        break;
      default:
        iconColor = Colors.grey;
    }

    return Container(
      key: Key('${item['type']}_${index}'),
      decoration: BoxDecoration(),
      padding: const EdgeInsets.all(14),
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
          // 右侧图片（如果有）
          if (item['image'] != null) ...[
            const SizedBox(width: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(item['image'], width: 48, height: 48, fit: BoxFit.cover),
            ),
          ],
        ],
      ),
    );
  }
}
