import 'package:flutter/material.dart';
import 'package:vape_zone/Admin%20Controls/upload.dart';

import '../components/text.dart';
import 'orders.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin App Vape Zone'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            MyText(
              text: 'Inventory.',
              fontSize: 56,
              fontWeight: FontWeight.normal,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: 'heroTag2',
              tooltip: 'Add Product',
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              child: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.surface,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const UploadPage(),
                ));
              }),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
              heroTag: 'heroTag1',
              tooltip: 'Orders',
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              child: Icon(
                Icons.add_shopping_cart,
                color: Theme.of(context).colorScheme.surface,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const OrderPage(),
                ));
              }),
        ],
      ),
    );
  }
}
