import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:provider/provider.dart';
import 'package:vape_zone/Backend/Cart/Checkout%20Page/check_out_page.dart';
import 'package:vape_zone/Backend/Provider/Services/checkout_services.dart';
import 'package:vape_zone/components/cart_tile_widget.dart';
import 'package:vape_zone/components/empty_cart_msg_widget.dart';
import 'package:vape_zone/components/my_button.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final checkoutServices =
        Provider.of<CheckoutServices>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: PersistentShoppingCart().showCartItems(
                  cartTileWidget: ({required data}) =>
                      CartTileWidget(data: data),
                  showEmptyCartMsgWidget: const EmptyCartMsgWidget(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Card(
                  color: Colors.grey.shade900,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PersistentShoppingCart().showTotalAmountWidget(
                      cartTotalAmountWidgetBuilder: (totalAmount) {
                        return Visibility(
                          visible: totalAmount == 0.0 ? false : true,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total:',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                    ),
                                  ),
                                  Text(
                                    totalAmount.toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              MyButton(
                                buttontext: 'CheckOut',
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const CheckOutPage()));
                                },
                                loading: checkoutServices.loading,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
