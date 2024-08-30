// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:provider/provider.dart';
import 'package:vape_zone/Backend/Cart/cart_page.dart';
import 'package:vape_zone/Backend/Provider/Services/product_services.dart';
import 'package:vape_zone/components/network_image_widget.dart';
import '../components/text.dart';

class ProductListPage extends StatefulWidget {
  var collectionName;
  ProductListPage({super.key, required this.collectionName});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        actions: [
          PersistentShoppingCart().showCartItemCountWidget(
            cartItemCountWidgetBuilder: (itemCount) => IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const CartPage()));
              },
              icon: Badge(
                backgroundColor: Colors.red,
                textColor: Colors.white,
                label: Text(itemCount.toString()),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
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
              text: 'Everything You Desire...',
              fontSize: 56,
              fontWeight: FontWeight.normal,
              color: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            _displayProduct(),
          ],
        ),
      ),
    );
  }

  Widget _displayProduct() {
    return Consumer<ProductServices>(
      builder: (context, value, child) {
        return Consumer<ProductServices>(
          builder: (context, value, child) {
            return StreamBuilder(
              stream:
                  value.fireStore.collection(widget.collectionName).snapshots(),
              builder: (context, snapshot) {
                //  checking if the data is being loaded
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  );
                }
                //  checking if there is any error
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error ${snapshot.error}'),
                  );
                }
                //  returning list view builder
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    NetworkImageWidget(
                                      imageUrl: snapshot.data!.docs[index]
                                          ['imageUrl'],
                                      height: 100,
                                      width: 100,
                                      borderRadius: 8,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.03,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data!.docs[index]['name'],
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .surface,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: .5,
                                              fontSize: 19,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                ['company'],
                                            style: TextStyle(
                                              color: Colors.grey.shade700,
                                            ),
                                          ),
                                          Text(
                                            'Rs. ${snapshot.data!.docs[index]['price']}',
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .surface,
                                            ),
                                          ),
                                          PersistentShoppingCart()
                                              .showAndUpdateCartItemWidget(
                                            notInCartWidget: Container(
                                              height: 30,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .inversePrimary,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Add to Cart',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                ),
                                              ),
                                            ),
                                            inCartWidget: Container(
                                              height: 30,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .inversePrimary,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Remove',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                ),
                                              ),
                                            ),
                                            product: PersistentShoppingCartItem(
                                                productId: snapshot.data!.docs[index]
                                                    ['productId'],
                                                productName: snapshot.data!.docs[index]
                                                    ['name'],
                                                unitPrice: double.parse(snapshot
                                                        .data!
                                                        .docs[index]['price']
                                                        .toString())
                                                    .clamp(0.0, 100000),
                                                productThumbnail: snapshot.data!
                                                    .docs[index]['imageUrl'],
                                                quantity: 1,
                                                productDescription:
                                                    snapshot.data!.docs[index]['company']),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
