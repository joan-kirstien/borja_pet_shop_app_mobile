import 'package:flutter/material.dart';
import 'package:flutter1_pet_shop_app_borja/onBoardScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pet Shop App',
      debugShowCheckedModeBanner: false,
      home: OnBoardScreen(),
    );
  }
}
