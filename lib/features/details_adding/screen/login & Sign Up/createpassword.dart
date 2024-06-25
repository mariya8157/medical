import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/features/details_adding/screen/login%20&%20Sign%20Up/login.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../core/constants/images.dart';
import '../../../../main.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({super.key});

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  final passwordValidation=RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");
  final passwordValidation2=RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");
  final formKey=GlobalKey<FormState>();
  bool selectIcon = false;
  bool selectIcon1 = false;
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width*0.04),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: width*0.02,),
                Row(
                  children: [
                    Text("Create New Password",
                      style: GoogleFonts.inter(
                          fontSize: width*0.06,
                          fontWeight: FontWeight.w800,
                          color: Colour.thirdcolour
                      ),)
                  ],
                ),
                SizedBox(height: width*0.02,),
                Row(
                  children: [
                    Text("Create your new password to login",
                      style: TextStyle(
                          fontSize: width*0.037,
                          fontWeight: FontWeight.w500,
                          color: Colour.color1
                      ),)
                  ],
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
                    maxLength: 12,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if(!passwordValidation.hasMatch(value!)){
                        return "* Password must contains eight characters, inclu\n"
                      "ding at least one number and includes both lo\n"
                      "wer and uppercase letters and special charac\n"
                      "ters, for example @, #, ?, !.\n";
                      }
                      else{
                        return null;
                      }
                    },
                    style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500,color: Colour.thirdcolour),
                    decoration: InputDecoration(
                      counterText: "",
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
                      labelText: "Enter new password",
                      labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.04, color: Colour.color1),
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
                    controller: passwordController2,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    obscureText: selectIcon1?false:true,
                    maxLength: 12,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if(passwordController.text!=passwordController2.text){
                        return "Dismatch Password";
                      }
                      else{
                        return null;
                      }
                    },
                    style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500,color: Colour.thirdcolour),
                    decoration: InputDecoration(
                      counterText: "",
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(width*0.03),
                        child: SvgPicture.asset(ImageIcons.lock),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          selectIcon1=!selectIcon1;
                          setState(() {

                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(width*0.045),
                          child: Container(
                              height: width*0.09,
                              width: width*0.09,
                              child: selectIcon1?SvgPicture.asset(ImageIcons.eye,color: Colour.color1,):
                              SvgPicture.asset(ImageIcons.eyeOff)),
                        ),
                      ),
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.04, color: Colour.color1),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colour.color2,
                          ),
                          borderRadius: BorderRadius.circular(width*0.07)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: width*0.07,),
                InkWell(
                  onTap: () {
                    if (
                    passwordController.text != "" &&
                        passwordController2.text != "" &&
                        formKey.currentState!.validate()
                    ) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return AlertDialog(
                            content: Container(
                              height: width * 0.8,
                              width: width * 0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      height: width * 0.25,
                                      width: width * 0.25,
                                      child: Image.asset(ImagePictures.done)),
                                  Container(
                                      child: Column(
                                    children: [
                                      Text(
                                        "Success",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: width * 0.042,
                                            color: Colour.thirdcolour),
                                      ),
                                      Text(
                                        "Your have successfully reset your",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: width * 0.032,
                                            color: Colour.color1),
                                      ),
                                      Text(
                                        "password.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: width * 0.032,
                                            color: Colour.color1),
                                      ),
                                    ],
                                  )),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginPage(),
                                          ),
                                          (route) => false);
                                    },
                                    child: Container(
                                      height: width * 0.12,
                                      width: width * 0.34,
                                      decoration: BoxDecoration(
                                          color: Colour.primarycolour,
                                          borderRadius: BorderRadius.circular(
                                              width * 0.05)),
                                      child: Center(
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                              fontSize: width * 0.04,
                                              fontWeight: FontWeight.w600,
                                              color: Colour.secondarycolour),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    else {
                      passwordController.text == "" ?
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colour.primarycolour,
                          content: Text("Please enter your Password!"))) :
                      passwordController2.text == "" ?
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colour.primarycolour,
                          content: Text("Please enter your Confirm Password!"))) :
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colour.primarycolour,
                          content: Text("Please enter your Valid Details!")));
                    }
                  },
                  child: Container(
                    height: width*0.16,
                    width: width*0.93,
                    decoration: BoxDecoration(
                        color: Colour.primarycolour,
                        borderRadius: BorderRadius.circular(width*0.07)
                    ),
                    child: Center(
                      child: Text("Create Password",
                        style: GoogleFonts.inter(
                            fontSize: width*0.045,
                            fontWeight: FontWeight.w600,
                            color: Colour.secondarycolour
                        ),),
                    ),
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
