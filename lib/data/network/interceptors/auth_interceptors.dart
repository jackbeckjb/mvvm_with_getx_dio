import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:structure_mvvm/res/log/app_logger.dart';
import 'package:structure_mvvm/utils/utils.dart';

/// Handles authentication token refresh and retry logic
class AuthInterceptor extends QueuedInterceptorsWrapper {
  final Dio dio;
  String? _accessToken;
  String? _refreshToken;

  AuthInterceptor(this.dio);

  void setTokens(String access, String refresh) {
    _accessToken = access;
    _refreshToken = refresh;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_accessToken != null) {
      options.headers['authToken'] = _accessToken;
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && _refreshToken != null) {
      AppLogger.info("🔄 Attempting to refresh token...");
      final success = await _refreshAccessToken();
      if (success) {
        final newRequest = await _retryRequest(err.requestOptions);
        return handler.resolve(newRequest);
      }
    }
    handler.next(err);
  }

  Future<bool> _refreshAccessToken() async {
    try {
      final res = await dio.post(
        '/auth/refresh',
        data: {'refreshToken': _refreshToken},
      );
      if (res.statusCode == 200 && res.data['token'] != null) {
        _accessToken = res.data['token'];
        dio.options.headers['authToken'] = _accessToken;
        AppLogger.info("✅ Token refreshed successfully");
        return true;
      }
    } catch (e) {
      Utils.errorSnackBar(
        Get.context!,
        "Token refresh failed. Please login again.",
      );
      AppLogger.error("Token refresh failed: $e");
    }
    return false;
  }

  Future<Response<dynamic>> _retryRequest(RequestOptions requestOptions) async {
    AppLogger.info("🔁 Retrying failed request...");
    final newOptions = Options(
      method: requestOptions.method,
      headers: dio.options.headers,
      responseType: requestOptions.responseType,
    );
    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: newOptions,
    );
  }
}
