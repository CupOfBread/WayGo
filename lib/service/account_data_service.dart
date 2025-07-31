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
      const AccountRecordType(id: 1, code: 'expense', name: '支出', iconUrl: '', isSysDefault: true, direction: -1),
      const AccountRecordType(id: 2, code: 'income', name: '收入', iconUrl: '', isSysDefault: true, direction: 1),
      const AccountRecordType(id: 3, code: 'transfer', name: '转账', iconUrl: '', isSysDefault: true, direction: -1),
      const AccountRecordType(id: 4, code: 'balance', name: '余额', iconUrl: '', isSysDefault: true, direction: 1),
      const AccountRecordType(id: 5, code: 'refund', name: '退款', iconUrl: '', isSysDefault: true, direction: 1),
    ];
    final categories = [
      const AccountRecordCategory(id: 1, code: 'scenic', name: '景点', iconUrl: '', isSysDefault: true),
      const AccountRecordCategory(id: 2, code: 'food', name: '餐饮', iconUrl: '', isSysDefault: true),
      const AccountRecordCategory(id: 3, code: 'hotel', name: '住宿', iconUrl: '', isSysDefault: true),
      const AccountRecordCategory(id: 4, code: 'traffic', name: '交通', iconUrl: '', isSysDefault: true),
      const AccountRecordCategory(id: 5, code: 'shopping', name: '购物', iconUrl: '', isSysDefault: true),
      const AccountRecordCategory(id: 6, code: 'entertainment', name: '娱乐', iconUrl: '', isSysDefault: true),
      const AccountRecordCategory(id: 7, code: 'other', name: '其他', iconUrl: '', isSysDefault: true),
      const AccountRecordCategory(id: 8, code: 'communication', name: '通讯', iconUrl: '', isSysDefault: true),
      const AccountRecordCategory(id: 9, code: 'medical', name: '医疗', iconUrl: '', isSysDefault: true),
      const AccountRecordCategory(id: 10, code: 'relationship', name: '人情', iconUrl: '', isSysDefault: true),
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
