import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../colour.dart';
import '../../../../icons.dart';
import '../../../../main.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final passwordValidation=RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");
  final formKey=GlobalKey<FormState>();
  bool selectIcon = false;
  bool agree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding:  EdgeInsets.all(width*0.005),
          child: SvgPicture.asset(ImageIcons.catogory8),
        ),
        title: Text("Sign Up",style: TextStyle(
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
                SizedBox(height: width*0.02,),
                Container(
                  decoration: BoxDecoration(
                      color: Colour.color3,
                      borderRadius: BorderRadius.circular(width*0.07)
                  ),
                  child: TextFormField(
                    controller: nameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500,color: Colour.thirdcolour),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(width*0.03),
                        child: SvgPicture.asset(ImageIcons.user),
                      ),
                      labelText: "Enter your name",
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
                SizedBox(height: width*0.05,),
                Row(
                  children: [
                    Checkbox(
                     activeColor: Colour.primarycolour,
                        value: agree,
                        onChanged: (value) {
                          setState(() {
                            agree=value!;
                          });
                        },
                        ),
                    Container(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text("I agree to the medidoc",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width*0.033,
                                          color: Colour.thirdcolour
                                      )),
                                  Text(" Terms of Service",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: width*0.03,
                                          color: Colour.primarycolour
                                      )),
                                  Text(" and",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width*0.033,
                                          color: Colour.thirdcolour
                                      )),
                                ],
                              ),
                              Container(
                                width: width*0.79,
                                child: Text("Privacy and Policy",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width*0.03,
                                        color: Colour.primarycolour
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: width*0.1,),
                InkWell(
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Container(
                              height: width*0.8,
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
                                          Text("Success",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: width*0.042,
                                                color: Colour.thirdcolour),),
                                          Text("Your account has been successfully",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: width*0.032,
                                                color: Colour.color1),),
                                          Text("registered",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: width*0.032,
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
                                      child: Text("Login",
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
                      child: Text("Sign Up",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
