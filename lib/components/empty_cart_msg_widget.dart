import 'package:flutter/material.dart';

class EmptyCartMsgWidget extends StatelessWidget {
  const EmptyCartMsgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: SizedBox(
      height: size.height * .7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your cart is empty',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 30,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              boxShadow: [
                BoxShadow(
                  color:
                      Theme.of(context).colorScheme.onPrimary.withOpacity(.2),
                  blurRadius: 4,
                  spreadRadius: 1,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'Shop now',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
