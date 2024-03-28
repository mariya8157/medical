import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/icons.dart';

import '../../../../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      leading: SvgPicture.asset(ImageIcons.catogory8),
      title: Text("Login",style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: width*0.045
      )),
    ),
    );
  }
}
