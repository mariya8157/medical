import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/features/details_adding/screen/home/ambulance.dart';
import 'package:medical/features/details_adding/screen/home/bottomnavigation.dart';
import 'package:medical/features/details_adding/screen/home/docter.dart';
import 'package:medical/features/details_adding/screen/home/homepage.dart';
import 'package:medical/features/details_adding/screen/home/hospital.dart';
import 'package:medical/features/details_adding/screen/home/pharmacy1.dart';
import 'package:medical/features/details_adding/screen/home/topdoctor.dart';

import 'package:medical/features/details_adding/screen/online_pharmacy/pharmacy.dart';
import 'package:medical/models/user_model.dart';
import 'features/details_adding/screen/Profile/profile.dart';
import 'features/details_adding/screen/splashScreen/splashscreen.dart';
import 'firebase_options.dart';

UsersModel? currentModel;
var height;
var width;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const ProviderScope(child:MyApp()));
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
            home:SplashScreen(),
    ),);
  }
}
