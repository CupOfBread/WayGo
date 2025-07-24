import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:waygo/common/log_util.dart';

Future<void> setupServiceLocator() async {
  await _requestLocationPermission();
  initDio();
}

Future<void> _requestLocationPermission() async {
  var status = await Permission.location.status;
  if (!status.isGranted) {
    status = await Permission.location.request();
    if (!status.isGranted) {
      LogUtil.info('定位权限未被授予');
    } else {
      LogUtil.info('定位权限已授予');
    }
  } else {
    LogUtil.info('定位权限已授予');
  }
}

void initDio() {
  final dio = Dio();

  dio.options.baseUrl = "https://lamburger-dev.cupbread.cn";
  dio.options.connectTimeout = const Duration(seconds: 10);
  dio.options.receiveTimeout = const Duration(seconds: 3);
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        LogUtil.info("HTTP Req\nURL: ${options.uri}, METHOD: ${options.method}\n"
            "HEADERS: ${options.headers}\n"
            "PARAMS: ${options.queryParameters}\n"
            "DATA: ${options.data}");
        return handler.next(options);
      },
      onResponse: (response, ResponseInterceptorHandler handler) {
        LogUtil.info("HTTP Resp\nURL: ${response.requestOptions.uri}, METHOD: ${response.requestOptions.method}\n"
            "PARAMS: ${response.statusCode}\n"
            "DATA: ${response.data.toString().length > 800 ? response.data.toString().substring(0, 800) : response.data}");
        return handler.next(response);
      },
      onError: (DioException error, ErrorInterceptorHandler handler) {
        return handler.next(error);
      },
    ),
  );

  Get.put(dio, tag: "dio");
}
