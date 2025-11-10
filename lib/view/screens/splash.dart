import 'package:flutter/material.dart';
import 'package:structure_mvvm/viewModels/service/splash_service.dart';

class SplashScreen extends StatefulWidget {
  final SplashService service;
  const SplashScreen({super.key, required this.service});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    widget.service.initApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Splash')));
  }
}
