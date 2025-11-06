import 'package:structure_mvvm/core/config/app_environment.dart';

class AppConfig {
  final String baseUrl;
  final String envName;

  AppConfig._({required this.baseUrl, required this.envName});

  /// Factory constructor to select environment
  factory AppConfig.forEnvironment(AppEnvironment environment) {
    switch (environment) {
      case AppEnvironment.local:
        return AppConfig._(
          baseUrl: "http://10.0.2.2:3000", // localhost for Android emulator
          envName: "LOCAL",
        );
      case AppEnvironment.staging:
        return AppConfig._(
          baseUrl: "https://staging.yourapp.com/api",
          envName: "STAGING",
        );
      case AppEnvironment.production:
        return AppConfig._(
          baseUrl: "https://api.yourapp.com",
          envName: "PRODUCTION",
        );
    }
  }
}
