import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/images.dart';
import '../../../../main.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingPage(),
        )));
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
              height: width * 0.45,
              width: width * 0.45,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                ImagePictures.medics,
              ))),
            ),
          ),
          Text(
            "Medics",
            style: GoogleFonts.inter(
                fontSize: width * 0.12,
                fontWeight: FontWeight.w900,
                color: Colour.secondarycolour),
          )
        ],
      ),
    );
  }
}
