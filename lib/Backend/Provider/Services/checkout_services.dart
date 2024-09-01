// ignore_for_file: prefer_final_fields

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:vape_zone/Backend/Provider/Utilities/utils.dart';

class CheckoutServices extends ChangeNotifier {
  bool _loading = false;
  final formKey = GlobalKey<FormState>();

  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _customerAddressController =
      TextEditingController();
  final TextEditingController _customerPhoneController =
      TextEditingController();
  final TextEditingController _customerEmailController =
      TextEditingController();

  bool get loading => _loading;
  TextEditingController get customerNameController => _customerNameController;
  TextEditingController get customerAddressController =>
      _customerAddressController;
  TextEditingController get customerEmailController => _customerEmailController;
  TextEditingController get customerPhoneController => _customerPhoneController;

  //   method for order confirmation after checkout
  Future<void> confirmOrder() async {
    final shoppingCart = PersistentShoppingCart();
    // Retrieve cart data and total price
    Map<String, dynamic> cartData = shoppingCart.getCartData();

    // Extract cart items and total price
    List<PersistentShoppingCartItem> cartItems = cartData['cartItems'];
    double totalPrice = cartData['totalPrice'];

    // Send cart items to Firebase Firestore
    for (final cartItem in cartItems) {
      await FirebaseFirestore.instance.collection('Confirm-Orders').add({
        'productId': cartItem.productId,
        'productName': cartItem.productName,
        'unitPrice': cartItem.unitPrice,
        'quantity': cartItem.quantity,
        'totalPrice': totalPrice,
        'customerName': _customerNameController.text,
        'customerAddress': _customerAddressController.text,
        'customerEmail': _customerEmailController.text,
        'customerPhone': _customerPhoneController.text,
      }).then((value) {
        _loading = false;
        _customerNameController.clear();
        _customerAddressController.clear();
        _customerEmailController.clear();
        _customerPhoneController.clear();
        notifyListeners();
        Utils().toastMessage('Order Placed! you will receive a call soon!');
      }).onError((error, stackTrace) {
        _loading = false;
        notifyListeners();
        Utils().toastMessage(error.toString());
      });
    }

    log('Total Price: $totalPrice');
    // Clear the cart after sending data to Firestore
    shoppingCart.clearCart();
  }
}
