import 'dart:convert';

class JsonUtil {
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