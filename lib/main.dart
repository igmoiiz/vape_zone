import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vape_zone/interface_pages/home.dart';
import 'package:vape_zone/interface_pages/shop.dart';
import 'package:vape_zone/theme/themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: const Home(),
    );
  }
}
