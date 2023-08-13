import 'package:flutter/material.dart';
import 'package:login_page1/pages/add_task.dart';

import 'package:login_page1/pages/login.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (_, __, ___) => LoginPage(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });

    return const Scaffold(
      body:  Center(
        child: FlutterLogo(
          size: 100,
        ),
      ),
    );
  }
}
