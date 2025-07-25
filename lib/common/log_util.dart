import 'package:logger/logger.dart';

import 'json_util.dart';

class LogUtil {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
  );

  /// info级别日志
  static void info(dynamic msg, {String? tag}) {
    _logger.i(_wrap(msg, tag));
  }

  /// debug级别日志
  static void debug(dynamic msg, {String? tag}) {
    _logger.d(_wrap(msg, tag));
  }

  /// warn级别日志
  static void warn(dynamic msg, {String? tag}) {
    _logger.w(_wrap(msg, tag));
  }

  /// error级别日志
  static void error(dynamic msg, {String? tag}) {
    _logger.e(_wrap(msg, tag));
  }

  /// 自动对象转json，带tag
  static String _wrap(dynamic msg, String? tag) {
    String content;
    if (msg is Map || msg is List) {
      content = JsonUtil.encode(msg);
    } else if (_hasToJson(msg)) {
      content = JsonUtil.encode((msg as dynamic).toJson());
    } else {
      content = msg.toString();
    }
    if (tag != null && tag.isNotEmpty) {
      return '[$tag] $content';
    }
    return content;
  }

  static bool _hasToJson(dynamic obj) {
    try {
      return obj != null && obj.toJson is Function;
    } catch (_) {
      return false;
    }
  }
}
