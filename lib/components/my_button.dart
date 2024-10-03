// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

/// A custom button widget with a loading indicator.
///
/// This widget displays a button with a given text and a loading indicator
/// when the `loading` property is `true`. The button's color scheme is
/// determined by the app's theme.
///
/// Example:
///
/// MyButton(
///   buttontext: 'Login',
///   onTap: () async {
///     // Perform some asynchronous operation
///     await Future.delayed(Duration(seconds: 2));
///   },
///   loading: true,
/// )
///
class MyButton extends StatelessWidget {
  /// The text to display on the button.
  final String buttontext;

  /// The callback to execute when the button is tapped.
  final VoidCallback onTap;

  /// Whether to display the loading indicator.
  final bool loading;

  const MyButton({
    super.key,
    required this.buttontext,
    required this.onTap,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 12, left: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          constraints: BoxConstraints(
            minWidth: 60,
          ),
          height: mediaQuery.height * 0.07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          child: loading
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .41,
                      vertical: MediaQuery.of(context).size.height * .015),
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                )
              : Center(
                  child: Text(
                  buttontext,
                  style: TextStyle(
                    fontSize: mediaQuery.height * 0.02,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.background,
                  ),
                )),
        ),
      ),
    );
  }
}
