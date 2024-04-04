import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical/colour.dart';
import 'package:medical/features/details_adding/screen/Profile/profile.dart';
import 'package:medical/features/details_adding/screen/doctor%20Consultation/bookingdoctor.dart';
import 'package:medical/features/details_adding/screen/doctor%20Consultation/chatwithdoctor.dart';
import 'package:medical/features/details_adding/screen/doctor%20Consultation/findDoctor.dart';
import 'package:medical/features/details_adding/screen/home/homepage.dart';
import 'package:medical/features/details_adding/screen/onlinePharmacy/article.dart';
import 'package:medical/icons.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _HomeState();
}

class _HomeState extends State<BottomNavigationPage> {
  List pages=[
    HomePage(),
    FindDoctor(),
    articles(),
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
          BottomNavigationBarItem(icon:Icon(Icons.call
          ),
              label: 'Doctors'),
          BottomNavigationBarItem(icon: Icon(Icons.local_pharmacy),
              label: 'Pharmacy'),
          BottomNavigationBarItem(icon: Icon(Icons.person ),
              label: 'Profile'),
        ],

      ),
    );
  }
}
