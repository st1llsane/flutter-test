import 'package:flutter/material.dart';
import 'package:flutter_first/pages/intro_page.dart';
import 'package:flutter_first/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

final Map<String, WidgetBuilder> routes = {
  '/intro-page': (context) => const IntroPage(),
  '/home-page': (context) => const HomePage(),
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: routes,
    );
  }
}
