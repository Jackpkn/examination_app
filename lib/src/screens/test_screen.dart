import 'package:examination_app/src/screens/test_lending.dart';
import 'package:examination_app/src/widgets/app_style.dart';
import 'package:examination_app/src/widgets/global_container.dart';
import 'package:examination_app/src/widgets/reusable_text.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 70,
          title: const Text("Tests"),
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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: ListView.builder(
            itemCount: 1,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TestLending(),
                    ),
                  );
                },
                child: Container(
                  height: 70,
                  width: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  margin: const EdgeInsets.only(
                    top: 30,
                    right: 22,
                    left: 22,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: 'Test Title',
                        textStyle: appStyle(
                          fw: FontWeight.w600,
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Test title'),
                          GlobalContainer(
                            height: 30,
                            color: Colors.blue,
                            width: 90,
                            borderRadius: BorderRadius.circular(10),
                            child: const Text('Start test'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
