import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/routes/app_routes.dart';
import 'splash_screen.dart';

class SplashGate extends StatefulWidget {
  const SplashGate({super.key});

  @override
  State<SplashGate> createState() => _SplashGateState();
}

class _SplashGateState extends State<SplashGate> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds:5), () {
      if (!mounted) return;

      Navigator.pushReplacementNamed(context, AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
