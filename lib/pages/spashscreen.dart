import 'package:flutter/material.dart';
import 'package:login_page1/pages/detail-page.dart';
import 'package:login_page1/pages/login.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (_, __, ___) => const LoginPage(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });

    return Scaffold(
      body: const Center(
        child: FlutterLogo(
          size: 100,
        ),
      ),
    );
  }
}
