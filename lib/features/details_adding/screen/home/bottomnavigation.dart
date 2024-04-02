import 'package:flutter/material.dart';
import 'package:medical/colour.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _HomeState();
}

class _HomeState extends State<BottomNavigationPage> {
  List pages=[

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
          BottomNavigationBarItem(icon: Icon(Icons.email),
              label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined),
              label: 'Booking'),
          BottomNavigationBarItem(icon: Icon(Icons.person ),
              label: 'Profile'),
        ],

      ),
    );
  }
}
