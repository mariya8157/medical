import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/colour.dart';
import '../../../../../main.dart';
import '../../Profile/screen/profile.dart';
import '../../doctor_consultation/screen/schedule.dart';
import 'article.dart';
import 'homepage.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _HomeState();
}

class _HomeState extends State<BottomNavigationPage> {
  List pages = [HomePage(), Articles(), SchedulePage(), ProfilePage()];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle:
            TextStyle(fontSize: width * 0.03, fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        selectedItemColor: Colour.primarycolour,
        unselectedItemColor: Colour.gray,
        currentIndex: selectedIndex,
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined), label: 'Article'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.calendar), label: 'Schedule'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
