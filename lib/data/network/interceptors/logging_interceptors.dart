import 'package:dio/dio.dart';
import 'package:structure_mvvm/res/log/app_logger.dart';

/// Simple request/response logger
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLogger.info("➡️ ${options.method} ${options.uri}");
    AppLogger.info("Headers: ${options.headers}");
    AppLogger.info("Data: ${options.data}");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogger.info("✅ [${response.statusCode}] ${response.data}");
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger.error("❌ [${err.response?.statusCode}] ${err.message}");
    handler.next(err);
  }
}
