import 'package:flutter/material.dart';
import 'package:intro_ui/pages/home_page.dart';
import 'package:intro_ui/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName:(context) => const HomePage()
      },
      home: const IntroPage(),
    );
  }
}
