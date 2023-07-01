import 'package:examination_app/src/screens/test_screen.dart';
import 'package:examination_app/src/widgets/app_style.dart';
import 'package:examination_app/src/widgets/global_container.dart';
import 'package:examination_app/src/widgets/reusable_text.dart';
import 'package:examination_app/src/widgets/textform_input.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  Page1({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13, left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.menu),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.white,
                          ),
                          child: TextFormInput(
                            hintText: 'Search',
                            labelText: 'Search',
                            obscureText: false,
                            maxLines: 1,
                            onSaved: (v) {},
                            validator: (v) {
                              return null;
                            },
                            icon: const Icon(Icons.search),
                            controller: controller,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 100,
                    ),
                    child: Center(
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.90,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 227, 213, 213),
                          borderRadius: BorderRadius.circular(19),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      const VerticalDivider(
                        thickness: 4,
                        color: Colors.blue,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ReusableText(
                          text: 'Top Features',
                          textStyle: appStyle(
                            fw: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 170,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const TestScreen()));
                        },
                        child: Container(
                          height: 140,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color.fromARGB(255, 209, 105, 140),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: GlobalContainer(
                                  height: 40,
                                  width: 40,
                                  color: Colors.white24,
                                  borderRadius: BorderRadius.circular(50),
                                  child: const Text(''),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Top coaching expert faculty curate JEE/NEET test series',
                                  style: TextStyle(
                                    color: Color.fromARGB(
                                      255,
                                      233,
                                      227,
                                      227,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 9, top: 5),
                                child: ReusableText(
                                  text: 'Tests',
                                  textStyle: appStyle(
                                      fw: FontWeight.bold,
                                      fontSize: 22,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
