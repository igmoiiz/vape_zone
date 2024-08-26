import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  const MyTextfield({super.key, required this.controller, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ), // Customize label color when not focused
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onPrimary,
                width: 2.0), // Border when focused
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                width: 1.0), // Border when not focused
          ),
        ),
      ),
    );
  }
}
