import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical/features/details_adding/screen/Profile/profile.dart';
import 'package:medical/features/details_adding/screen/home/homepage.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/colour.dart';
import '../doctor_consultation/schedule.dart';
import '../online_pharmacy/article.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});


  @override
  State<BottomNavigationPage> createState() => _HomeState();
}

class _HomeState extends State<BottomNavigationPage> {
  List pages=[
    HomePage(),
    Articles(),
    SchedulePage(),
    ProfilePage()
  ];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        selectedItemColor:Colour.primarycolour ,
        unselectedItemColor: Colour.gray,
        currentIndex: selectedIndex,
        onTap: (value){
          selectedIndex=value;
          setState(() {

          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),
              label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.article_outlined),
              label: 'Article'),
          BottomNavigationBarItem(icon:Icon(CupertinoIcons.calendar
          ),
              label: 'Schedule'),
          BottomNavigationBarItem(icon: Icon(Icons.person ),
              label: 'Profile'),
        ],

      ),
    );
  }
}
