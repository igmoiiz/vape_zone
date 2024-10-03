// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

/// A custom text field widget with a label, optional suffix icon, and validation.
class MyTextFormField extends StatelessWidget {
  /// The label text to display above the text field.
  final String labelText;

  /// Whether the text field should obscure the input (e.g., for passwords).
  final bool obscure;

  /// The text editing controller for the text field.
  final TextEditingController controller;

  /// An optional suffix icon to display at the end of the text field.
  var suffixIcon;
  var inputType;

  /// Creates a new instance of [MyTextFormField].
  MyTextFormField({
    super.key,
    required this.labelText,
    required this.obscure,
    required this.controller,
    this.suffixIcon,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 12, left: 12),
      child: TextFormField(
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        keyboardType: inputType,
        validator: (value) {
          if (value!.isEmpty) {
            return 'This Field can\'t be empty';
          } else {
            return null;
          }
        },
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          suffix: suffixIcon,
          labelText: labelText,
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          filled: true,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
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
    );
  }
}

/// Example usage:
///
/// class MyForm extends StatefulWidget {
///   @override
///   _MyFormState createState() => _MyFormState();
/// }
///
/// class _MyFormState extends State<MyForm> {
///   final _controller = TextEditingController();
///
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       body: Padding(
///         padding: const EdgeInsets.all(20.0),
///         child: MyTextfield(
///           labelText: 'Enter your name',
///           obscure: false,
///           controller: _controller,
///           suffixIcon: Icon(Icons.person),
///         ),
///       ),
///     );
///   }
/// }
/// 