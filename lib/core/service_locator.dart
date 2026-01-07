import 'package:get_it/get_it.dart';
import 'package:structure_mvvm/data/network/api_client.dart';
import 'package:structure_mvvm/data/network/network_api_service.dart';
import 'package:structure_mvvm/data/repository/user/user_repo.dart';
import 'package:structure_mvvm/viewModels/controller/user_controller.dart';
import 'package:structure_mvvm/viewModels/service/splash_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // services
  getIt.registerLazySingleton<SplashService>(() => SplashService());
  getIt.registerLazySingleton<NetworkApiServices>(
    () => NetworkApiServices(ApiClient().client),
  );
  getIt.registerLazySingleton<UserRepo>(
    () => UserRepo(getIt<NetworkApiServices>()),
  );
  // getIt.registerLazySingleton<AuthService>(() => AuthService());
  // getIt.registerSingletonAsync(() async => MapService()..initMarkers());

  // Controllers
  getIt.registerLazySingleton<UserController>(() => UserController(getIt()));
  // getIt.registerLazySingleton<SignUpController>(() => SignUpController());

  // Add other services here as needed
  // getIt.registerLazySingleton<ApiService>(() => ApiService());
  // getIt.registerLazySingleton<DatabaseService>(() => DatabaseService());
}
