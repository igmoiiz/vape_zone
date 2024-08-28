import 'package:flutter/material.dart';
import 'package:vape_zone/components/container.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => CustomCard(
          backgroundImage: 'assets/images/pods.jpeg',
          title: 'Pods',
          onTap: () {},
        ),
      ),
    );
  }
}
