// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flexify/flexify.dart';
import 'package:flutter/cupertino.dart';
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
  //  search Controller
  final TextEditingController searchController = TextEditingController();
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
                    CupertinoPageRoute(builder: (context) => const CartPage()));
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
              fontSize: 46.rt,
              fontWeight: FontWeight.normal,
              color: Theme.of(context).colorScheme.secondary,
            ),
            //  sized box
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 12, left: 12),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This Field can\'t be empty';
                  } else {
                    return null;
                  }
                },
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Search Products',
                  filled: true,
                  hintStyle:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary), // Default border color
                    borderRadius: BorderRadius.circular(4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary), // Border color when focused
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            //  sized box
            10.verticalSpace,
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
                      String name = snapshot.data!.docs[index]['name'];
                      if (name
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase()) ||
                          name
                              .toUpperCase()
                              .contains(searchController.text.toUpperCase())) {
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
                                        height: 100.rh,
                                        width: 100.rw,
                                        borderRadius: 8,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ['name'],
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: .5,
                                                fontSize: 19.rt,
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
                                                fontSize: 17.rt,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                              ),
                                            ),
                                            PersistentShoppingCart()
                                                .showAndUpdateCartItemWidget(
                                              notInCartWidget: Container(
                                                height: 30.rh,
                                                width: 80.rw,
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
                                                height: 30.rh,
                                                width: 80.rw,
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
                                                  productId: snapshot.data!
                                                      .docs[index]['productId'],
                                                  productName: snapshot.data!
                                                      .docs[index]['name'],
                                                  unitPrice: double.parse(
                                                      snapshot.data!
                                                          .docs[index]['price']
                                                          .toString()),
                                                  productThumbnail: snapshot
                                                      .data!
                                                      .docs[index]['imageUrl'],
                                                  quantity: 1,
                                                  productDescription: snapshot
                                                      .data!
                                                      .docs[index]['company']),
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
                      } else {
                        return Container();
                      }
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
