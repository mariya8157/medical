
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/features/details_adding/screen/doctor%20Consultation/doctordetails.dart';
import 'package:medical/features/details_adding/screen/login%20&%20Sign%20Up/login.dart';
import 'package:medical/features/details_adding/screen/onlinePharmacy/pharmacy.dart';


import 'features/details_adding/screen/doctor Consultation/findDoctor.dart';
import 'features/details_adding/screen/onlinePharmacy/article.dart';


var height;
var width;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(  MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;

    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: GoogleFonts.interTextTheme()
            ),
            home:DoctordetailsPage()
    ),);
  }
}
