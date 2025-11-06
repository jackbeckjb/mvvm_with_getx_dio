import 'package:dio/dio.dart';
import 'package:structure_mvvm/core/config/environment.dart';
import 'package:structure_mvvm/data/network/interceptors/auth_interceptors.dart';
import 'package:structure_mvvm/data/network/interceptors/logging_interceptors.dart';
import 'package:structure_mvvm/res/log/app_logger.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  late final Dio dio;

  factory ApiClient() => _instance;

  ApiClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: Environment.config.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    // Attach global interceptors
    dio.interceptors.addAll([LoggingInterceptor(), AuthInterceptor(dio)]);

    AppLogger.info(
      "✅ ApiClient initialized with baseUrl: ${Environment.config.baseUrl}",
    );
  }

  void setTokens(String access, String refresh) {
    final accessToken = {"authToken": access};
    final refreshToken = {"authToken": access};
    dio.options.headers.addEntries(accessToken.entries);
    dio.options.headers.addEntries(refreshToken.entries);
  }

  Dio get client => dio;
}
