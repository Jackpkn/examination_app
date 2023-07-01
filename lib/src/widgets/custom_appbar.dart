// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final Widget child;
  
  const CustomAppbar({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      toolbarHeight: 70,
      title: child,
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14)),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 7, 143, 255),
                Color.fromARGB(255, 5, 133, 238)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
      ),
    );
  }
}
