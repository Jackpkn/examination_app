import 'package:flutter/material.dart';

TextStyle appStyle(
    {required FontWeight? fw,
    required double? fontSize,
    required Color? color}) {
  return TextStyle(
    fontWeight: fw,
    fontSize: fontSize,
    color: color,
  );
}
