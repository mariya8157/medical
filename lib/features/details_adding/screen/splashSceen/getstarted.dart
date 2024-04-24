import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/colour.dart';
import 'package:medical/features/details_adding/screen/login%20&%20Sign%20Up/login.dart';
import 'package:medical/features/details_adding/screen/login%20&%20Sign%20Up/signup.dart';

import '../../../../icons.dart';
import '../../../../main.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: width*0.35,
              width: width*0.35,
              child: SvgPicture.asset(ImageIcons.medics1),
          ),),SizedBox(height: width*0.05,),
          Text("Let’s get started!",
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: width*0.06
            ),
          ),SizedBox(height: width*0.04,),
          Text("Login to enjoy the features we’ve\n    provided, and stay healthy!",
            style: TextStyle(
                color: Colour.color5,
                fontSize: width*0.04
            ),),
          SizedBox(height: width*0.05,),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(email: '', password: '',),));
            },
            child: Container(
              height: width*0.14,
              width: width*0.75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.08),
                  color:Colour.primarycolour
              ),
              child: Center(
                child: Text("Login",
                  style: TextStyle(
                      color: Colour.secondarycolour,
                      fontSize: width*0.05
                  ),),
              ),
            ),
          ),
          SizedBox(height: width*0.04,),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(),));

            },
            child: Container(
              height: width*0.14,
              width: width*0.75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.08),
                  color: Colour.secondarycolour,
                  border: Border.all(
                      color: Colour.primarycolour
                  )
              ),
              child: Center(
                child: Text("Sign Up",
                  style: TextStyle(
                      color: Colour.primarycolour,
                      fontSize: width*0.05
                  ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
