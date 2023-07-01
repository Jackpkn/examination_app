import 'package:flutter/material.dart';

class DrawerGridView extends StatelessWidget {
  final int? itemCount;
  final Widget widget;
  const DrawerGridView({
    Key? key,
    this.itemCount,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 6,
          mainAxisExtent: 30,
          childAspectRatio: 15 / 9),
      itemBuilder: (context, index) {
        return widget;
      },
    );
  }
}
