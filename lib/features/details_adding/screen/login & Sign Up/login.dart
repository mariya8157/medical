import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/colour.dart';
import 'package:medical/icons.dart';

import '../../../../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final passwordValidation=RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");
  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      leading: SvgPicture.asset(ImageIcons.catogory8),
      title: Text("Login",style: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: width*0.05
      )),
      centerTitle: true,
    ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width*0.03),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: width*0.01,),
                Container(
                  decoration: BoxDecoration(
                    color: Colour.color3,
                    borderRadius: BorderRadius.circular(width*0.07)
                  ),
                  child: TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500,color: Colour.thirdcolour),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(width*0.03),
                        child: SvgPicture.asset(ImageIcons.email),
                      ),
                      labelText: "Enter your email",
                      labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.04, color: Colour.color1),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colour.color2,
                        ),
                        borderRadius: BorderRadius.circular(width*0.07)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colour.color2
                        ),
                        borderRadius: BorderRadius.circular(width*0.07),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: width*0.05,),
                Container(
                  decoration: BoxDecoration(
                    color: Colour.color3,
                    borderRadius: BorderRadius.circular(width*0.07)
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if(!passwordValidation.hasMatch(value!)){
                        return "*The password you entered is wrong";
                      }
                      else{
                       return null;
                      }
                    },
                    style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500,color: Colour.thirdcolour),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(width*0.03),
                        child: SvgPicture.asset(ImageIcons.lock),
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(width*0.03),
                        child: SvgPicture.asset(ImageIcons.eyeOff),
                      ),
                      labelText: "Enter your password",
                      labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.04, color: Colour.color1),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colour.color2,
                        ),
                        borderRadius: BorderRadius.circular(width*0.07)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colour.color2
                        ),
                        borderRadius: BorderRadius.circular(width*0.07),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text("Forgot Password?",
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: width*0.033,color: Colour.primarycolour),),
                    ),
                  ],),
                SizedBox(height: width*0.05,),
                Container(
                  height: width*0.16,
                  width: width*0.93,
                  decoration: BoxDecoration(
                    color: Colour.primarycolour,
                    borderRadius: BorderRadius.circular(width*0.07)
                  ),
                  child: Center(
                    child: Text("Login",
                    style: TextStyle(
                      fontSize: width*0.045,
                      fontWeight: FontWeight.w600,
                      color: Colour.secondarycolour
                    ),),
                  ),
                ),
                SizedBox(height: width*0.05,),
                Container(
                    height: width*0.07,
                    width: width*0.67,
                    child: Row(
                      children: [
                        Text("Don’t have an account ? ",
                          style: TextStyle(
                              fontSize: width*0.035,
                              fontWeight: FontWeight.w500,
                              color: Colour.color5
                          ),),
                           Text("Sign Up",
                            style: TextStyle(
                                fontSize: width*0.035,
                                fontWeight: FontWeight.w600,
                                color: Colour.primarycolour
                            ),),
                      ],
                    )
                ),
                SizedBox(height: width*0.05,),
                Stack(
                  children: [
                    Divider(
                      color: Colors.red,
                      indent: width*0.08,
                      endIndent: width*0.08,
                      thickness: width*0.02,
                    ),
                    Text(("OR"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
