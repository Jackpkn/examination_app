// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class GlobalContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color color;
  final BorderRadiusGeometry? borderRadius;
  const GlobalContainer({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
    required this.color,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          width: 0.8,
          color: const Color.fromARGB(
            255,
            235,
            229,
            229,
          ),
        ),
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
