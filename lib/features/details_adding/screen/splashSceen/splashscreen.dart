import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical/colour.dart';
import 'package:medical/icons.dart';

import '../../../../main.dart';
import '../../../../pageone.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(
      seconds: 5
    )).then((value) =>
         Navigator.push(context, MaterialPageRoute(builder: (context) => PageOne(),)));
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
       ),Text("Medics",style: TextStyle(
              fontSize:width*0.1,
          fontWeight: FontWeight.w900,
          color: Colour.secondarycolour),)
        ],
      ),

    );
  }
}
