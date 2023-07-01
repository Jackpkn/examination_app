import 'package:flutter/material.dart';

import '../models/question_model.dart';
import '../widgets/app_style.dart';
import '../widgets/global_container.dart';
import '../widgets/reusable_text.dart';

class SubjectWise extends StatelessWidget {
  const SubjectWise({super.key});

  @override
  Widget build(BuildContext context) {
    for (var element in q[0].questions) {
      print(element.keys);
    }
    return GlobalContainer(
      height: 290,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ReusableText(
                text: 'Total question: 30',
                textStyle: appStyle(
                  fw: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
