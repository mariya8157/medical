import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/features/details_adding/screen/home/bottomnavigation.dart';
import 'package:medical/features/details_adding/screen/home/homepage.dart';
import 'package:medical/features/details_adding/screen/login_signup/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../core/constants/images.dart';
import '../../../../main.dart';
import '../../../../models/user_model.dart';
import 'getstarted.dart';
import 'onboarding.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  // bool login=false;
  //
  //
  //
  // splash() async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // login=prefs.getBool('login')??false;
  // print("gggggggggggggggggggggg77777777777777777777777777777777777777777777");
  // print(prefs.getString('id'));
  // userId = prefs.getString('id');
  //
  // // print("nnnnnnnnnnnnnnnnnnnnnaaaaaaaaaaaammmmmmmme****************00000000000");
  // // currentModel = await FirebaseFirestore.instance.collection("user").doc(userId).get().then((value) => UsersModel.fromMap(value.data() as Map<String,dynamic>));
  // // print("nnnnnnnnnnnnnnnnnnnnnaaaaaaaaaaaammmmmmmme****************1111111111");
  // // print(currentModel?.name);
  //
  //
  // // var userlist= await FirebaseFirestore.instance.collection("users").where("email",isEqualTo:prefs.getString('id')).get().then((value) => value.docs.map((e) {}));
  // // List<UsersModel> A =userlist.docs.map((e) => UsersModel.fromMap(e.data() as Map<String,dynamic>)).toList();
  // //
  // // currentModel=A[0];
  // // print(currentModel!.name);
  // // print("-------------wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");
  //
  //
  //
  //
  //
  //
  //
  //
  //
  // Future.delayed(Duration(
  //   seconds: 5
  // )).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) =>
  //   login==true?BottomNavigationPage():GetStartedPage()
  //   ,)));
  // }
  //
  //
  //
  // Future<UsersModel?> fetchUserData(String userId) async {
  //   final doc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
  //   if (doc.exists) {
  //     return UsersModel.fromMap(doc.data() as Map<String,dynamic>);
  //   }
  //   return null;
  // }
  //
  //
  // void loadUserData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userIds = await prefs.getString('id');
  //   if (userIds != null) {
  //     currentModel = await fetchUserData(userIds);
  //      print(currentModel?.name);
  //   }
  //   // Navigate to the next screen after loading user data
  // }
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(
      seconds: 5
    )).then((value) =>
         Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardingPage(),)));
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
           decoration: const BoxDecoration(
             image: DecorationImage(
                 image:AssetImage(ImagePictures.medics,)
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
