import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vape_zone/Backend/Provider/Services/checkout_services.dart';
import 'package:vape_zone/Backend/Provider/Utilities/utils.dart';
import 'package:vape_zone/components/my_button.dart';
import 'package:vape_zone/components/my_textfield.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    final checkoutServices =
        Provider.of<CheckoutServices>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, right: 12, left: 12),
        child: ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Text(
              'I\'m not a coil, but I\'m still into you...',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: mediaQuery.height * 0.04,
              ),
            ),
            Form(
              key: checkoutServices.formKey,
              child: Column(
                children: [
                  MyTextFormField(
                    labelText: 'Name',
                    obscure: false,
                    controller: checkoutServices.customerNameController,
                  ),
                  MyTextFormField(
                    labelText: 'Address',
                    obscure: false,
                    controller: checkoutServices.customerAddressController,
                  ),
                  MyTextFormField(
                    labelText: 'Email',
                    obscure: false,
                    controller: checkoutServices.customerEmailController,
                  ),
                  MyTextFormField(
                    inputType: TextInputType.number,
                    labelText: 'Contact Number',
                    obscure: false,
                    controller: checkoutServices.customerPhoneController,
                  ),
                ],
              ),
            ),
            MyButton(
              buttontext: 'Place Order',
              onTap: () {
                if (checkoutServices.formKey.currentState!.validate()) {
                  checkoutServices.confirmOrder();
                } else {
                  Utils().toastMessage('Please fill all Fields!');
                }
              },
              loading: checkoutServices.loading,
            ),
            SizedBox(
              height: mediaQuery.height * 0.02,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Happy Vaping! Come Back Soon!',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: mediaQuery.height * 0.02),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
