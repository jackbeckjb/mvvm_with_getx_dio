import 'package:get_it/get_it.dart';
import 'package:structure_mvvm/viewModels/controller/user_controller.dart';
import 'package:structure_mvvm/viewModels/service/splash_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // services
  getIt.registerLazySingleton<SplashService>(() => SplashService());
  // getIt.registerLazySingleton<AuthService>(() => AuthService());
  // getIt.registerSingletonAsync(() async => MapService()..initMarkers());

  // Controllers
  getIt.registerLazySingleton<UserController>(() => UserController());
  // getIt.registerLazySingleton<SignUpController>(() => SignUpController());

  // Add other services here as needed
  // getIt.registerLazySingleton<ApiService>(() => ApiService());
  // getIt.registerLazySingleton<DatabaseService>(() => DatabaseService());
}
