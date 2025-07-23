import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waygo/pages/travel/travel_luggage/travel_luggage_logic.dart';

class TravelLuggagePage extends StatelessWidget {
  const TravelLuggagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(TravelLuggageLogic());
    final categories = logic.state.categories;
    int total = categories.fold(0, (sum, cat) => sum + cat.items.length);
    int checked = categories.fold(
      0,
      (sum, cat) => sum + cat.items.where((item) => item.checked.value).length,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 4),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: const Color(0xFFF7F7FA),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A90E2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(
                      Icons.luggage,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '已整理 $checked/$total 件 物品',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemCount: logic.state.categories.length,
            itemBuilder: (context, catIdx) {
              final category = logic.state.categories[catIdx];
              return Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  leading: Container(
                    decoration: BoxDecoration(
                      color: category.color.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: Icon(category.icon, color: category.color, size: 22),
                  ),
                  title: Text(
                    category.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: category.color,
                      fontSize: 16,
                    ),
                  ),
                  children: category.items.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Card(
                        elevation: 0,
                        color: item.checked.value ? const Color(0xFFE3F2FD) : Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Obx(() => CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                          title: Text(
                            item.name,
                            style: TextStyle(
                              decoration: item.checked.value ? TextDecoration.lineThrough : null,
                              color: item.checked.value ? Colors.grey : Colors.black87,
                              fontSize: 15,
                            ),
                          ),
                          value: item.checked.value,
                          activeColor: category.color,
                          onChanged: (val) {
                            logic.toggleItemChecked(catIdx, item, val ?? false);
                          },
                        )),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class LuggageCategory {
  final String name;
  final IconData icon;
  final Color color;
  final List<LuggageItem> items;

  LuggageCategory({
    required this.name,
    required this.icon,
    required this.color,
    required this.items,
  });
}

class LuggageItem {
  final String name;
  RxBool checked;

  LuggageItem({required this.name, bool checked = false}) : checked = RxBool(checked);
}
