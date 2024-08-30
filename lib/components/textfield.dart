import 'package:flutter/material.dart';

class MyTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final FocusNode? focusNode;

  const MyTextfield({
    super.key,
    required this.controller,
    required this.text,
    this.focusNode,
  });

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  @override
  Widget build(BuildContext context) {
    final onPrimaryColor = Theme.of(context).colorScheme.onPrimary;

    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: TextField(
        onChanged: (value) {
          setState(() {});
        },
        controller: widget.controller,
        focusNode: widget.focusNode,
        cursorColor: onPrimaryColor, // Set cursor color
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          labelText: widget.text,
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
