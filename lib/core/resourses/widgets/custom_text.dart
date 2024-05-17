
import 'package:flutter/material.dart';
class CustomTextApp extends StatelessWidget {
  const CustomTextApp({
    super.key,
    required this.text,
    required this.textTheme
  });
  final String text;
  final TextStyle textTheme;
  @override
  Widget build(BuildContext context) {
    return  Text(
      maxLines: 3,
      text,
      style: textTheme,
    );
  }
}
