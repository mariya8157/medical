import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/features/details_adding/screen/home/bottomnavigation.dart';
import 'package:medical/features/details_adding/screen/home/homepage.dart';
import 'package:medical/features/details_adding/screen/splashSceen/getstarted.dart';
import 'package:medical/features/details_adding/screen/splashSceen/onbording.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../colour.dart';
import '../../../../icons.dart';
import '../../../../main.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  bool login=false;
  splash() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  login=prefs.getBool('login')??false;


  Future.delayed(Duration(
    seconds: 5
  )).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) =>
    login==true?BottomNavigationPage(email: emailController.text, password:passwordController.text):GetStartedPage()
    ,)));
  }
  void initState() {
    // TODO: implement initState
    splash();
    Future.delayed(Duration(
      seconds: 5
    )).then((value) =>
         Navigator.push(context, MaterialPageRoute(builder: (context) => OnBordingPage(),)));
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.primarycolour,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       Center(
         child: Container(
           height: width*0.45,
           width: width*0.45,
           decoration: BoxDecoration(
             image: DecorationImage(
                 image:AssetImage(ImageIcons.medics,)
             )
           ),
         ),
       ),Text("Medics",style: GoogleFonts.inter(
              fontSize:width*0.12,
          fontWeight: FontWeight.w900,
          color: Colour.secondarycolour),)
        ],
      ),

    );
  }
}
