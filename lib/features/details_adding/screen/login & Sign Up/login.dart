import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  bool selectIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      leading: Padding(
        padding:  EdgeInsets.all(width*0.005),
        child: SvgPicture.asset(ImageIcons.catogory8),
      ),
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
                    obscureText: selectIcon?false:true,
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
                      suffixIcon: InkWell(
                        onTap: () {
                          selectIcon=!selectIcon;
                          setState(() {

                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(width*0.045),
                          child: Container(
                            height: width*0.09,
                            width: width*0.09,
                              child: selectIcon?SvgPicture.asset(ImageIcons.eye,color: Colour.color1,):
                              SvgPicture.asset(ImageIcons.eyeOff)),
                        ),
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
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: width*0.033,
                            color: Colour.primarycolour),),
                    ),
                  ],),
                SizedBox(height: width*0.05,),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return AlertDialog(
                            content: Container(
                              height: width*0.85,
                              width: width*0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      height: width*0.25,
                                      width: width*0.25,
                                      child: Image.asset(ImageIcons.done)),
                                  Container(
                                      child: Column(
                                        children: [
                                          Text("Yeay! Welcome Back",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: width*0.04,
                                                color: Colour.thirdcolour),),
                                          Text("Once again you login successfully",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: width*0.034,
                                                color: Colour.color1),),
                                          Text("into medidoc app",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: width*0.034,
                                                color: Colour.color1),),
                                        ],)),
                                  Container(
                                    height: width*0.12,
                                    width: width*0.34,
                                    decoration: BoxDecoration(
                                        color: Colour.primarycolour,
                                        borderRadius: BorderRadius.circular(width*0.05)
                                    ),
                                    child: Center(
                                      child: Text("Go to home",
                                        style: TextStyle(
                                            fontSize: width*0.04,
                                            fontWeight: FontWeight.w600,
                                            color: Colour.secondarycolour
                                        ),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },);
                  },
                  child: Container(
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
               Row(
                 children: [
                   Expanded(
                     child: Divider(
                       color: Colour.color2,
                       indent: width*0.04,
                       endIndent: width*0.04,
                       thickness: width*0.005,
                     ),
                   ),
                   Text("OR",style: TextStyle(fontWeight: FontWeight.w500,
                       fontSize: width*0.037,
                   color: Colour.color1),),
                   Expanded(
                     child: Divider(
                       color: Colour.color2,
                       indent: width*0.04,
                       endIndent: width*0.04,
                       thickness: width*0.005,
                     ),
                   ),
                 ],
               ),
                SizedBox(height: width*0.07,),
                Container(
                  height: width*0.16,
                  width: width*0.93,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.07),
                    border: Border.all(
                      color: Colour.color2
                    )
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: width*0.67,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                padding: EdgeInsets.all(width*0.04),
                                child: SvgPicture.asset(ImageIcons.google)),
                            Text("Sign in with Google",
                              style: TextStyle(
                                  fontSize: width*0.038,
                                  fontWeight: FontWeight.w600,
                                  color: Colour.color6
                              ),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: width*0.05,),
                Container(
                  height: width*0.16,
                  width: width*0.93,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.07),
                      border: Border.all(
                          color: Colour.color2
                      )
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: width*0.67,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                padding: EdgeInsets.all(width*0.04),
                                child: SvgPicture.asset(ImageIcons.apple)),
                            Text("Sign in with Apple",
                              style: TextStyle(
                                  fontSize: width*0.038,
                                  fontWeight: FontWeight.w600,
                                  color: Colour.color6
                              ),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: width*0.05,),
                Container(
                  height: width*0.16,
                  width: width*0.93,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.07),
                      border: Border.all(
                          color: Colour.color2
                      )
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: width*0.67,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                padding: EdgeInsets.all(width*0.04),
                                child: SvgPicture.asset(ImageIcons.facebook)),
                            Text("Sign in with Facebook",
                              style: TextStyle(
                                  fontSize: width*0.038,
                                  fontWeight: FontWeight.w600,
                                  color: Colour.color6
                              ),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
