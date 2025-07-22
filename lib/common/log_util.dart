import 'package:logger/logger.dart';
import 'dart:convert';
import 'json_util.dart';

class LogUtil {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      colors: true,
      printEmojis: true,
      printTime: true,
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
    if (msg is String) {
      content = msg;
    } else {
      content = JsonUtil.encode(msg);
    }
    if (tag != null && tag.isNotEmpty) {
      return '[$tag] $content';
    }
    return content;
  }
}