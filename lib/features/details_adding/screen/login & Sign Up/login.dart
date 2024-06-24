import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medical/features/details_adding/screen/home/bottomnavigation.dart';
import 'package:medical/features/details_adding/screen/home/homepage.dart';
import 'package:medical/features/details_adding/screen/login%20&%20Sign%20Up/forgotpassword.dart';
import 'package:medical/features/details_adding/screen/login%20&%20Sign%20Up/signup.dart';
import 'package:medical/models/model1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../colour.dart';
import '../../../../icons.dart';
import '../../../../main.dart';
import '../../controller/addingcontroller_page.dart';
import 'google_signIn.dart';

String? userEmail;
String? userId;
String? userName;
String? userImage;


class LoginPage extends ConsumerStatefulWidget {
  const LoginPage(
      {super.key,});

  @override
  ConsumerState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final passwordValidation=RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");
  final emailValidation=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final formKey=GlobalKey<FormState>();
  bool selectIcon = false;

  // getDetails(){
  //   ref.read(AddingControllerProvider).getUser(nameController.text,emailController.text, passwordController.text);
  // }

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding:  EdgeInsets.all(width*0.005),
          child: SvgPicture.asset(ImageIcons.catogory8),
        ),
      ),
      title: Text("Login",style: GoogleFonts.inter(
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
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if(!emailValidation.hasMatch(value!)){
                        return "Enter valid Email";
                      }
                      else{
                        return null;
                      }
                    },
                    style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500,color: Colour.thirdcolour),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(width*0.03),
                        child: SvgPicture.asset(ImageIcons.email),
                      ),
                      labelText: "Enter your email",
                      labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.045, color: Colour.color1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colour.color2,
                        ),
                        borderRadius: BorderRadius.circular(width*0.07)
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
                    textInputAction: TextInputAction.done,
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
                            height: width*0.08,
                            width: width*0.08,
                              child: selectIcon?SvgPicture.asset(ImageIcons.eye,color: Colour.color1,):
                              SvgPicture.asset(ImageIcons.eyeOff,)),
                        ),
                      ),
                      labelText: "Enter your password",
                      labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.045, color: Colour.color1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colour.color2,
                        ),
                        borderRadius: BorderRadius.circular(width*0.07)
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage(),));
                      },
                      child: Container(
                        child: Text("Forgot Password?",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: width*0.033,
                              color: Colour.primarycolour),),
                      ),
                    ),
                  ],),
                SizedBox(height: width*0.05,),
                InkWell(
                  onTap: () async {

                    // QuerySnapshot<Map<String,dynamic>> c = await FirebaseFirestore.instance.collection("users").where("email",isEqualTo: emailController.text).get();
                    // if(c.docs.isNotEmpty){
                    //   if(c.docs[0]["password"]==passwordController.text){
                    //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNavigationPage(email: emailController.text, password: passwordController.text),), (route) => false);
                    //   }
                    //   else{
                    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Passwords do not match")));
                    //   }
                    // }else{
                    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No account found")));
                    // }

                    FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailController.text.trim(),
                      password: passwordController.text,
                    ).then((value) async {
                      var data = await FirebaseFirestore.instance.collection("users").where("email",isEqualTo: emailController.text).get();
                      var password = data.docs[0]["password"];
                      if(password==true){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No account found")));
    }
                      else{
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
                                       InkWell(
                                       onTap: () {
                                         Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationPage(
                                         email: emailController.text,
                                         password: passwordController.text,
                                    ),));

                                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                     content: Text("Submitted Sucsessfully ")));
                                      },
                                        child: Container(
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
                                  ),),],),),);  },);
                      }
                      SharedPreferences prefs=await SharedPreferences.getInstance();
                      prefs.setBool('login', true);

                    }).catchError((error){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(error.toString())));
                    });

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
                      style: GoogleFonts.inter(
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
                           InkWell(
                             onTap: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(sign: false,),));
                             },
                             child: Text("Sign Up",
                              style: TextStyle(
                                  fontSize: width*0.035,
                                  fontWeight: FontWeight.w600,
                                  color: Colour.primarycolour
                              ),),
                           ),
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
                InkWell(
                  onTap: () {
                    signInWithGoogle(context);
                  },
                  child: Container(
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




