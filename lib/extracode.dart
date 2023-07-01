// Padding(
//                 padding: const EdgeInsets.all(3.0),
//                 child: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             // 100
//                             builder: (context) => const TestScreen()));
//                       },
//                       child: GlobalContainer(
//                         height: 130,
//                         width: MediaQuery.of(context).size.width * 0.48,
//                         color: const Color.fromARGB(255, 216, 36, 23),
//                         borderRadius: BorderRadius.circular(5),
//                         child: const Column(children: [
//                           Icon(
//                             Icons.book,
//                             size: 60,
//                           ),
//                           Text('Tests'),
//                         ]),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 4,
//                     ),
//                     // width: MediaQuery.of(context).size.width * 0.48,
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             // 100
//                             builder: (context) => const TestScreen()));
//                       },
//                       child: GlobalContainer(
//                         height: 110,
//                         width: MediaQuery.of(context).size.width * 0.48,
//                         color: Colors.green,
//                         borderRadius: BorderRadius.circular(5),
//                         child: const Column(
//                           children: [
//                             Icon(
//                               Icons.book,
//                               size: 60,
//                             ),
//                             Text('Previous Year Questions'),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(3.0),
//                 child: Row(
//                   children: [
//                     // width: MediaQuery.of(context).size.width * 0.48,
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             // 100
//                             builder: (context) => const TestScreen()));
//                       },
//                       child: GlobalContainer(
//                         height: 110,
//                         width: MediaQuery.of(context).size.width * 0.48,
//                         color: const Color.fromARGB(255, 166, 62, 182),
//                         borderRadius: BorderRadius.circular(5),
//                         child: ReusableText(
//                             text: 'DAILY QUIZ',
//                             textStyle: appStyle(
//                                 fw: FontWeight.bold,
//                                 fontSize: 20,
//                                 color: Colors.white)),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 4,
//                     ),
//                     GlobalContainer(
//                       height: 120,
//                       width: MediaQuery.of(context).size.width * 0.48,
//                       color: const Color.fromARGB(255, 196, 143, 27),
//                       borderRadius: BorderRadius.circular(5),
//                       child: const Text(''),
//                     )
//                   ],
//                 ),
//               ),