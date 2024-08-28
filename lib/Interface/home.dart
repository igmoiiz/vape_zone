import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:vape_zone/Interface/intro.dart';
import 'package:vape_zone/Interface/shop.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        enableLoop: false,
        initialPage: 0,
        pages: const [
          IntroPage(),
          ShopPage(),
        ],
      ),
    );
  }
}
