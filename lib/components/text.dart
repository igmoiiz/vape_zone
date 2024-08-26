import 'package:flutter/cupertino.dart';

class MyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  const MyText(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Text(
        text,
        style:
            TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
      ),
    );
  }
}
