import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final FocusNode? focusNode;

  const MyTextfield({
    Key? key,
    required this.controller,
    required this.text,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onPrimaryColor = Theme.of(context).colorScheme.onPrimary;

    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        cursorColor: onPrimaryColor, // Set cursor color
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          labelText: text,
          labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.secondary), // Label color
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: onPrimaryColor), // Focused border color
          ),
        ),
      ),
    );
  }
}
