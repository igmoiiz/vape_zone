import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:provider/provider.dart';
import 'package:vape_zone/Backend/Provider/Services/checkout_services.dart';
import 'package:vape_zone/Backend/Provider/Services/product_services.dart';
import 'package:vape_zone/firebase_options.dart';
import 'package:vape_zone/Backend/theme/themes.dart';

import 'Interface/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PersistentShoppingCart().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ProductServices()),
    ChangeNotifierProvider(create: (context) => CheckoutServices()),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: const Home(),
    );
  }
}
