import 'package:flutter/material.dart';

class TravelLuggagePage extends StatefulWidget {
  const TravelLuggagePage({Key? key}) : super(key: key);

  @override
  State<TravelLuggagePage> createState() => _TravelLuggagePageState();
}

class _TravelLuggagePageState extends State<TravelLuggagePage> {
  // 示例数据
  final List<LuggageCategory> categories = [
    LuggageCategory(
      name: '衣物',
      icon: Icons.checkroom,
      color: Color(0xFF4A90E2),
      items: [
        LuggageItem(name: 'T恤'),
        LuggageItem(name: '牛仔裤'),
        LuggageItem(name: '外套'),
      ],
    ),
    LuggageCategory(
      name: '洗漱用品',
      icon: Icons.bathtub,
      color: Color(0xFF7ED957),
      items: [
        LuggageItem(name: '牙刷'),
        LuggageItem(name: '牙膏'),
        LuggageItem(name: '毛巾'),
      ],
    ),
    LuggageCategory(
      name: '电子产品',
      icon: Icons.devices_other,
      color: Color(0xFFFFA726),
      items: [
        LuggageItem(name: '充电器'),
        LuggageItem(name: '耳机'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    int total = categories.fold(0, (sum, cat) => sum + cat.items.length);
    int checked = categories.fold(0, (sum, cat) => sum + cat.items.where((item) => item.checked).length);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 4),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
                    child: const Icon(Icons.luggage, color: Colors.white, size: 16),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '已整理 $checked/$total 件 物品',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
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
            itemCount: categories.length,
            itemBuilder: (context, catIdx) {
              final category = categories[catIdx];
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
                    style: TextStyle(fontWeight: FontWeight.bold, color: category.color, fontSize: 16),
                  ),
                  children: category.items.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Card(
                        elevation: 0,
                        color: item.checked ? const Color(0xFFE3F2FD) : Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                          title: Text(
                            item.name,
                            style: TextStyle(
                              decoration: item.checked ? TextDecoration.lineThrough : null,
                              color: item.checked ? Colors.grey : Colors.black87,
                              fontSize: 15,
                            ),
                          ),
                          value: item.checked,
                          activeColor: category.color,
                          onChanged: (val) {
                            setState(() {
                              item.checked = val ?? false;
                            });
                          },
                        ),
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
  LuggageCategory({required this.name, required this.icon, required this.color, required this.items});
}

class LuggageItem {
  final String name;
  bool checked;
  LuggageItem({required this.name, this.checked = false});
} 