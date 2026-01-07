import 'package:structure_mvvm/core/enums/app_environment_enum.dart';

class AppConfig {
  final String baseUrl;
  final String envName;

  AppConfig._({required this.baseUrl, required this.envName});

  /// Factory constructor to select environment
  factory AppConfig.forEnvironment(AppEnvironment environment) {
    switch (environment) {
      case AppEnvironment.local:
        return AppConfig._(
          baseUrl:
              "https://mp2fa6e33a91ef2e9bac.free.beeceptor.com", // localhost for Android emulator
          envName: "LOCAL",
        );
      case AppEnvironment.staging:
        return AppConfig._(
          baseUrl: "https://mp2fa6e33a91ef2e9bac.free.beeceptor.com",
          envName: "STAGING",
        );
      case AppEnvironment.production:
        return AppConfig._(
          baseUrl: "https://mp2fa6e33a91ef2e9bac.free.beeceptor.com",
          envName: "PRODUCTION",
        );
    }
  }
}
