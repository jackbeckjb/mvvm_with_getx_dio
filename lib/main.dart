import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:structure_mvvm/core/enums/app_environment_enum.dart';
import 'package:structure_mvvm/core/config/environment.dart';
import 'package:structure_mvvm/core/service_locator.dart';
import 'package:structure_mvvm/res/localization/languages.dart';
import 'package:structure_mvvm/res/routes/routes.dart';
import 'package:structure_mvvm/res/routes/routes_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔥 Choose your environment here
  Environment.init(AppEnvironment.local);

  // 2️⃣ Apply custom HTTP overrides (allows self-signed SSL only in dev/local)
  // HttpOverrides.global = MyHttpOverrides();

  // Initialize GetIt service locator
  await setupServiceLocator();
  //  ApiClient().setTokens(access, refresh); // we need to place it at right place to save access token
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      child: GetMaterialApp(
        translations: Languages(),
        fallbackLocale: const Locale('en', 'US'),
        locale: const Locale('en', 'US'),
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesName.splashScreen,
        getPages: AppRoutes.appRoutes(),
      ),
    );
  }
}
