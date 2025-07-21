import 'package:logger/logger.dart';

class LogUtil {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
    ),
  );

  static void debug(Object msg) {
    _logger.d("${DateTime.now().toString()}\n$msg");
  }

  static void info(Object msg) {
    _logger.i("${DateTime.now().toString()}\n$msg");
  }

  static void warn(Object msg) {
    _logger.w("${DateTime.now().toString()}\n$msg");
  }

  static void error(Object msg) {
    _logger.e("${DateTime.now().toString()}\n$msg");
  }
}