import 'package:flexify/flexify.dart';
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
                fontSize: 22.rt,
              ),
            ),
            20.verticalSpace,
            Container(
              height: 30.rh,
              width: 80.rw,
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
              child: const Center(
                child: Text(
                  'Shop now',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
