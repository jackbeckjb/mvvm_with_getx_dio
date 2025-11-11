import 'package:structure_mvvm/core/config/app_config.dart';
import 'package:structure_mvvm/core/enums/app_environment_enum.dart';

import '../../res/log/app_logger.dart';

class Environment {
  static late final AppConfig _config;

  static void init(AppEnvironment environment) {
    _config = AppConfig.forEnvironment(environment);
    AppLogger.info("Running in ${_config.envName} mode");
  }

  static AppConfig get config => _config;
}
