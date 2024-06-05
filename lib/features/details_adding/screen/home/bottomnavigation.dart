import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical/features/details_adding/screen/Profile/profile.dart';
import 'package:medical/features/details_adding/screen/doctor%20Consultation/bookingdoctor.dart';
import 'package:medical/features/details_adding/screen/doctor%20Consultation/chatwithdoctor.dart';
import 'package:medical/features/details_adding/screen/doctor%20Consultation/findDoctor.dart';
import 'package:medical/features/details_adding/screen/doctor%20Consultation/shedule.dart';
import 'package:medical/features/details_adding/screen/home/homepage.dart';
import 'package:medical/features/details_adding/screen/onlinePharmacy/article.dart';
import 'package:medical/features/details_adding/screen/onlinePharmacy/pharmacy.dart';

import '../../../../colour.dart';

import '../../../../colour.dart';

class BottomNavigationPage extends StatefulWidget {
  final String email;
  final String password;
  const BottomNavigationPage({super.key,
    required this.email,
    required this.password});

  @override
  State<BottomNavigationPage> createState() => _HomeState();
}

class _HomeState extends State<BottomNavigationPage> {
  List pages=[
    HomePage(),
    articles(),
    ShedulePage(),
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
              label: 'Shedule'),
          BottomNavigationBarItem(icon: Icon(Icons.person ),
              label: 'Profile'),
        ],

      ),
    );
  }
}
