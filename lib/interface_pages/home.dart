import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:vape_zone/interface_pages/intro.dart';
import 'package:vape_zone/interface_pages/shop.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: const [
          IntroPage(),
          ShopPage(),
        ],
      ),
    );
  }
}
