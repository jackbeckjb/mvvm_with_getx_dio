import 'package:flutter/material.dart';
import 'package:structure_mvvm/core/config/app_environment.dart';
import 'package:structure_mvvm/core/config/environment.dart';

void main() {
 WidgetsFlutterBinding.ensureInitialized();

  // 🔥 Choose your environment here
  Environment.init(AppEnvironment.local);

  // Initialize GetIt service locator
  // await setupServiceLocator();
  //  ApiClient().setTokens(access, refresh); // we need to place it at right place to save access token
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
