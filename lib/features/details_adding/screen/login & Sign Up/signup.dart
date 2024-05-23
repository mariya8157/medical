import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/colour.dart';
import '../../../../core/icons.dart';
import '../../../../main.dart';
import '../../../../models/model1.dart';
import '../../controller/addingcontroller_page.dart';
import 'login.dart';

class SignupPage extends ConsumerStatefulWidget {
  final bool sign;
  const SignupPage({super.key, required this.sign});

  @override
  ConsumerState createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final passwordValidation =
      RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");
  final emailValidation = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final formKey = GlobalKey<FormState>();
  bool selectIcon = false;
  bool agree = false;

  addSignupDetails() {
    ref.read(AddingControllerProvider).addUser(nameController.text,
        emailController.text.trim(), passwordController.text);
  }

  void initState() {
    if (widget.sign == true) {
      emailController.text = userEmail!;
      nameController.text = userName!;
    }
    // TODO: implement initState
    super.initState();
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
            padding: EdgeInsets.all(width * 0.005),
            child: SvgPicture.asset(ImageIcons.catogory8),
          ),
        ),
        title: Text("Sign Up",
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w800, fontSize: width * 0.05)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * 0.03),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: width * 0.02,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colour.color3,
                      borderRadius: BorderRadius.circular(width * 0.07)),
                  child: TextFormField(
                    controller: nameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.w500,
                        color: Colour.thirdcolour),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(width * 0.03),
                        child: SvgPicture.asset(ImageIcons.user),
                      ),
                      labelText: "Enter your name",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: width * 0.04,
                          color: Colour.color1),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colour.color2,
                          ),
                          borderRadius: BorderRadius.circular(width * 0.07)),
                    ),
                  ),
                ),
                SizedBox(
                  height: width * 0.05,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colour.color3,
                      borderRadius: BorderRadius.circular(width * 0.07)),
                  child: TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (!emailValidation.hasMatch(value!)) {
                        return "Enter valid Email";
                      } else {
                        return null;
                      }
                    },
                    style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.w500,
                        color: Colour.thirdcolour),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(width * 0.03),
                        child: SvgPicture.asset(ImageIcons.email),
                      ),
                      labelText: "Enter your email",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: width * 0.04,
                          color: Colour.color1),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colour.color2,
                          ),
                          borderRadius: BorderRadius.circular(width * 0.07)),
                    ),
                  ),
                ),
                SizedBox(
                  height: width * 0.05,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colour.color3,
                      borderRadius: BorderRadius.circular(width * 0.07)),
                  child: TextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    obscureText: selectIcon ? false : true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (!passwordValidation.hasMatch(value!)) {
                        return "*The password you entered is wrong";
                      } else {
                        return null;
                      }
                    },
                    style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.w500,
                        color: Colour.thirdcolour),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(width * 0.03),
                        child: SvgPicture.asset(ImageIcons.lock),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          selectIcon = !selectIcon;
                          setState(() {});
                        },
                        child: Padding(
                          padding: EdgeInsets.all(width * 0.045),
                          child: Container(
                              height: width * 0.09,
                              width: width * 0.09,
                              child: selectIcon
                                  ? SvgPicture.asset(
                                      ImageIcons.eye,
                                      color: Colour.color1,
                                    )
                                  : SvgPicture.asset(ImageIcons.eyeOff)),
                        ),
                      ),
                      labelText: "Enter your password",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: width * 0.04,
                          color: Colour.color1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colour.color2),
                        borderRadius: BorderRadius.circular(width * 0.07),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: width * 0.05,
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colour.primarycolour,
                      value: agree,
                      onChanged: (value) {
                        setState(() {
                          agree = value!;
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
                                          fontSize: width * 0.033,
                                          color: Colour.thirdcolour)),
                                  Text(" Terms of Service",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: width * 0.03,
                                          color: Colour.primarycolour)),
                                  Text(" and",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width * 0.033,
                                          color: Colour.thirdcolour)),
                                ],
                              ),
                              Container(
                                width: width * 0.79,
                                child: Text("Privacy and Policy",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width * 0.03,
                                        color: Colour.primarycolour)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: width * 0.1,
                ),
                InkWell(
                  onTap: () {
                    addSignupDetails();
                    if (nameController.text != "" &&
                        emailController.text != "" &&
                        passwordController.text != "" &&
                        formKey.currentState!.validate() &&
                        agree == true)
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Container(
                              height: width * 0.8,
                              width: width * 0.4,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      height: width * 0.25,
                                      width: width * 0.25,
                                      child: Image.asset(ImageIcons.done)),
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
                                        "Your account has been successfully",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: width * 0.032,
                                            color: Colour.color1),
                                      ),
                                      Text(
                                        "registered",
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
                    else {
                      nameController.text == ""
                          ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colour.primarycolour,
                              content: Text("Please enter your Name!")))
                          : emailController.text == ""
                              ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  backgroundColor: Colour.primarycolour,
                                  content: Text("Please enter your Email!")))
                              : passwordController.text == ""
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colour.primarycolour,
                                          content: Text(
                                              "Please enter your Password!")))
                                  : agree
                                      ? ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor:
                                                  Colour.primarycolour,
                                              content: Text(
                                                  "Please agree to the Terms of Service!")))
                                      : ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor:
                                                  Colour.primarycolour,
                                              content: Text(
                                                  "Please enter your Valid Details!")));
                    }
                  },
                  child: Container(
                    height: width * 0.16,
                    width: width * 0.93,
                    decoration: BoxDecoration(
                        color: Colour.primarycolour,
                        borderRadius: BorderRadius.circular(width * 0.07)),
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.inter(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w600,
                            color: Colour.secondarycolour),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: width * 0.05,
                ),
                Container(
                    height: width * 0.07,
                    width: width * 0.67,
                    child: Row(
                      children: [
                        Text(
                          "Don’t have an account ? ",
                          style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w500,
                              color: Colour.color5),
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w600,
                              color: Colour.primarycolour),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
