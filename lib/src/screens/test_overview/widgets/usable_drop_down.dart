// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../widgets/app_style.dart';
import '../../../widgets/reusable_text.dart';

class UsableDropDown extends StatelessWidget {
  final String title;
  final String subtitle1;
  final String subtitle2;
  final IconData? icon;
  final IconData? titleIcon;
  final VoidCallback? callback;
  const UsableDropDown({
    Key? key,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    this.icon,
    this.titleIcon,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
           Row(children: [  Icon(titleIcon),
        const SizedBox(width: 5),
        ReusableText(
          text: title,
          textStyle: appStyle(
            fw: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),],),
        Row(
          children: [
            RichText(
              text: TextSpan(
                text: subtitle1,
                style: appStyle(
                  fw: FontWeight.bold,
                  fontSize: 16,
                  color: const Color.fromARGB(255, 74, 176, 178),
                ),
                children: [
                  TextSpan(
                    text: subtitle2,style: appStyle(
                        fw: FontWeight.bold,
                        fontSize: 16,
                        color: const Color.fromARGB(255, 196, 183, 183),
                      )
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: callback,
              icon:   Icon(
                icon,
              ),
            )
          ],
        )
      ],
    );
  }
}
