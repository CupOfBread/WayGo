import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LuggageItem {
  final String name;
  RxBool checked;
  LuggageItem({required this.name, bool checked = false}) : checked = RxBool(checked);
}

class LuggageCategory {
  final String name;
  final IconData icon;
  final Color color;
  final List<LuggageItem> items;
  LuggageCategory({required this.name, required this.icon, required this.color, required this.items});
}

class TravelLuggageState {
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
} 