// ignore_for_file: deprecated_member_use
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:vape_zone/Backend/Cart/cart_page.dart';
import 'package:vape_zone/Interface/product_list.dart';
import 'package:vape_zone/components/container.dart';
import 'package:vape_zone/components/text.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // Text editing controller for search
  final TextEditingController searchController = TextEditingController();

  // FocusNode to track focus state of the search bar
  final FocusNode searchFocusNode = FocusNode(); // Correctly initialized

  // Boolean to track if the search bar is focused
  bool isFocused = false;

  // List for category details
  final List customCardDetails = [
    ['assets/images/pods.jpeg', 'Pods'],
    ['assets/images/juices.jpeg', 'Liquor'],
    ['assets/images/vapes.jpeg', 'Vapes'],
    ['assets/images/disposable.jpeg', 'Disposable Pods'],
    ['assets/images/coils.jpeg', 'Coils'],
    ['assets/images/accessories.jpeg', 'Accessories'],
    ['assets/images/used vape.jpeg', 'Used Devices'],
    ['assets/images/offers.jpeg', 'Offers'],
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   searchFocusNode.addListener(() {
  //     setState(() {
  //       isFocused = searchFocusNode.hasFocus;
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   searchFocusNode.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        primary: true,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        actions: [
          PersistentShoppingCart().showCartItemCountWidget(
            cartItemCountWidgetBuilder: (itemCount) => IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const CartPage(),
                  ),
                );
              },
              icon: Badge(
                backgroundColor: Colors.red,
                textColor: Colors.white,
                label: Text(itemCount.toString()),
                child: const Icon(Icons.shopping_bag_outlined),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            MyText(
              text: 'Smooth Clouds, Better Choices.',
              fontSize: mediaQuery.height * 0.04,
              fontWeight: FontWeight.normal,
              color: Theme.of(context).colorScheme.secondary,
            ),
            // AnimatedContainer(
            //   duration: const Duration(milliseconds: 300),
            //   width: isFocused
            //       ? MediaQuery.of(context).size.width * 0.95
            //       : MediaQuery.of(context).size.width * 0.85,
            //   child: MyTextfield(
            //     controller: searchController,
            //     text: 'Search',
            //     focusNode: searchFocusNode, // Attach the focus node here
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.012),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: MyText(
                  text: 'Products',
                  fontSize: mediaQuery.height * 0.03,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: customCardDetails.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return CustomCard(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => ProductListPage(
                            collectionName: customCardDetails[index][1],
                          ),
                        ),
                      );
                    },
                    backgroundImage: customCardDetails[index][0],
                    title: customCardDetails[index][1],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
