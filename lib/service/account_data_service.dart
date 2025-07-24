import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:waygo/model/account/account_record_type.dart';
import 'package:waygo/model/account/account_record_category.dart';

class AccountDataService {
  static Future<void> saveAccountRecordData({
    required List<AccountRecordType> types,
    required List<AccountRecordCategory> categories,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final typeListJson = jsonEncode(types.map((e) => e.toJson()).toList());
    final categoryListJson = jsonEncode(categories.map((e) => e.toJson()).toList());
    await prefs.setString('account_record_types', typeListJson);
    await prefs.setString('account_record_categories', categoryListJson);
  }

  static Future<void> initDefaultAccountRecordData() async {
    final types = [
      AccountRecordType('expense', '', id: 1, name: '支出', isSysDefault: true, direction: -1),
      AccountRecordType('income', '', id: 2, name: '收入', isSysDefault: true, direction: 1),
      AccountRecordType('transfer', '', id: 3, name: '转账', isSysDefault: true, direction: -1),
      AccountRecordType('balance', '', id: 4, name: '余额', isSysDefault: true, direction: 1),
      AccountRecordType('refund', '', id: 5, name: '退款', isSysDefault: true, direction: 1),
    ];
    final categories = [
      AccountRecordCategory('scenic', '', id: 1, name: '景点', isSysDefault: true),
      AccountRecordCategory('food', '', id: 2, name: '餐饮', isSysDefault: true),
      AccountRecordCategory('hotel', '', id: 3, name: '住宿', isSysDefault: true),
      AccountRecordCategory('traffic', '', id: 4, name: '交通', isSysDefault: true),
      AccountRecordCategory('shopping', '', id: 5, name: '购物', isSysDefault: true),
      AccountRecordCategory('entertainment', '', id: 6, name: '娱乐', isSysDefault: true),
      AccountRecordCategory('other', '', id: 7, name: '其他', isSysDefault: true),
      AccountRecordCategory('communication', '', id: 8, name: '通讯', isSysDefault: true),
      AccountRecordCategory('medical', '', id: 9, name: '医疗', isSysDefault: true),
      AccountRecordCategory('relationship', '', id: 10, name: '人情', isSysDefault: true),
    ];
    await saveAccountRecordData(types: types, categories: categories);
  }

  static Future<List<AccountRecordType>> getAccountRecordTypes() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString('account_record_types');
    if (jsonStr == null) return [];
    final list = jsonDecode(jsonStr) as List;
    return list.map((e) => AccountRecordType.fromJson(e)).toList();
  }

  static Future<List<AccountRecordCategory>> getAccountRecordCategories() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString('account_record_categories');
    if (jsonStr == null) return [];
    final list = jsonDecode(jsonStr) as List;
    return list.map((e) => AccountRecordCategory.fromJson(e)).toList();
  }
}
