
import 'package:flutter/material.dart';
import 'package:medical/findDoctor.dart';


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
            home:FindDoctor()
    ),);
  }
}
