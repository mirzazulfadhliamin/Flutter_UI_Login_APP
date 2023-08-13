import 'package:flutter/material.dart';

import 'package:login_page1/pages/spashscreen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF795548), // Brown primary color
        secondaryHeaderColor: Color(0xFFCDDC39), // Lime accent color
        scaffoldBackgroundColor:
            Color.fromARGB(255, 253, 245, 230), // Cream background color
        primaryTextTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black), // Warna teks utama
          bodyText2: TextStyle(color: Colors.black), // Warna teks utama
          headline6: TextStyle(color: Colors.black),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF795548), // Brown app bar color
          foregroundColor: Colors.white, // Warna teks app bar
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 16.0,
            color: Colors.black87,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF795548), // Brown FAB color
        ),
      ),
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}
