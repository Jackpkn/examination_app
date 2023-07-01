import 'package:flutter/material.dart';
import 'constants/color.dart';
import 'methods/page_export.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kBottomColor,
        unselectedItemColor: unSBottomColor,
        currentIndex: currentIndex,
        onTap: changeIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'COACHING'),
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard), label: 'LEADERBOARD'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'ME'),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children:   [
          Page1(),
          const Page2(),
          const Page3(),
          const Page4(),
        ],
      ),
    );
  }
}
