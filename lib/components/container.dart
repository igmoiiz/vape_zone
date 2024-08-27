import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final String image;
  const MyContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              offset: Offset(4, 4),
              blurRadius: 2,
              spreadRadius: 0.2,
            ),
            BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(-4, -4),
              blurRadius: 2,
              spreadRadius: 0.2,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              'Product 1',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
