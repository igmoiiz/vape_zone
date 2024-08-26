import 'package:flutter/material.dart';
import 'package:vape_zone/components/text.dart';
import 'package:vape_zone/components/textfield.dart';

import '../components/drawer.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            MyText(
                text: 'Smooth Clouds, Better Choices.',
                fontSize: 56,
                fontWeight: FontWeight.normal,
                color: Theme.of(context).colorScheme.secondary),
            MyTextfield(
              controller: searchController,
              text: 'Search',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: MyText(
                  text: 'Products',
                  fontSize: 28,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
