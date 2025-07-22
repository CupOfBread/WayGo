import 'dart:convert';

class JsonUtil {
  /// 将对象（Map/List/自定义对象）转为格式化json字符串
  static String encode(Object? object) {
    try {
      return const JsonEncoder.withIndent('  ').convert(object);
    } catch (e) {
      return object.toString();
    }
  }

  /// 将json字符串转为对象
  static dynamic decode(String jsonStr) {
    try {
      return json.decode(jsonStr);
    } catch (e) {
      return jsonStr;
    }
  }
} 