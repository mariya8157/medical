import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/features/screen/login_signup/screen/verify.dart';
import '../../../../../core/constants/colour.dart';
import '../../../../../core/constants/icons.dart';
import '../../../../../main.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final phoneValidation = RegExp(r"[0-9]{10}$");
  final emailValidation = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final formKey = GlobalKey<FormState>();
  bool toggle = false;

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colour.primarycolour,content: Text("Password reset email sent. Check your inbox.")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colour.primarycolour,content: Text("The email you've entered is incorrect.")),
      );
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
          padding: EdgeInsets.all(width * 0.005),
          child: SvgPicture.asset(ImageIcons.catogory8),
        ),
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: width * 0.02),
                Row(
                  children: [
                    Text(
                      "Forgot Your Password?",
                      style: GoogleFonts.inter(
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.w800,
                          color: Colour.thirdcolour),
                    )
                  ],
                ),
                SizedBox(
                  height: width * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      "Enter your email or phone number, we",
                      style: TextStyle(
                          fontSize: width * 0.037,
                          fontWeight: FontWeight.w500,
                          color: Colour.color1),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "will send you confirmation code",
                      style: TextStyle(
                          fontSize: width * 0.037,
                          fontWeight: FontWeight.w500,
                          color: Colour.color1),
                    )
                  ],
                ),
                SizedBox(
                  height: width * 0.1,
                ),
                Stack(children: [
                  InkWell(
                    onTap: () {
                      toggle = !toggle;
                      setState(() {});
                    },
                    child: Container(
                      width: width * 0.93,
                      height: width * 0.15,
                      decoration: BoxDecoration(
                        color: Colour.color3,
                        border: Border.all(
                            color: Colour.color2, width: width * 0.005),
                        borderRadius: BorderRadius.circular(width * 0.07),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 200),
                    left: toggle ? width * 0.4 : width * 0.001,
                    right: toggle ? width * 0.001 : width * 0.4,
                    curve: Curves.easeIn,
                    child: InkWell(
                      onTap: () {
                        toggle = !toggle;
                        setState(() {});
                      },
                      child: AnimatedContainer(
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 200),
                        height: width * 0.15,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 0.07),
                          color: Colour.secondarycolour,
                          border: Border.all(
                              color: Colour.color2, width: width * 0.003),
                        ),
                        child: toggle
                            ? Center(
                                child: Text(
                                  "Phone",
                                  style: TextStyle(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w600,
                                    color: Colour.primarycolour,
                                  ),
                                ),
                              )
                            : Center(
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w600,
                                    color: Colour.primarycolour,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                      duration: Duration(
                        milliseconds: 200,
                      ),
                      left: toggle ? width * 0.18 : width * 0.58,
                      right: toggle ? width * 0.52 : width * 0.18,
                      top: width * 0.04,
                      child: toggle
                          ? Text(
                              "Email",
                              style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w600,
                                color: Colour.color1,
                              ),
                            )
                          : Text(
                              "Phone",
                              style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w600,
                                color: Colour.color1,
                              ),
                            ))
                ]),
                SizedBox(
                  height: width * 0.06,
                ),
                toggle
                    ? Container(
                        decoration: BoxDecoration(
                            color: Colour.color3,
                            borderRadius: BorderRadius.circular(width * 0.07)),
                        child: TextFormField(
                          controller: phoneController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (!phoneValidation.hasMatch(value!)) {
                              return "Enter valid Number";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.w500,
                              color: Colour.thirdcolour),
                          decoration: InputDecoration(
                            counterText: '',
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(width * 0.03),
                              child: SvgPicture.asset(ImageIcons.call),
                            ),
                            labelText: "Enter your number",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.04,
                                color: Colour.color1),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colour.color2,
                                ),
                                borderRadius:
                                    BorderRadius.circular(width * 0.07)),
                          ),
                        ),
                      )
                    : Container(
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
                              child: SvgPicture.asset(ImageIcons.email2),
                            ),
                            labelText: "Enter your email",
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
                  height: width * 0.06,
                ),
                InkWell(
                  onTap: () async {
                    if (emailController.text != "" ||
                        phoneController.text != "" &&
                            formKey.currentState!.validate())
                      {
                        await sendPasswordResetEmail(emailController.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerificationPage(
                                email: emailController.text,
                                phone: phoneController.text,
                              ),
                            ));
                      }
                    else {
                      emailController.text == ""
                          ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colour.primarycolour,
                              content: Text("Please enter your Email!")))
                          : phoneController.text == ""
                              ? ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: Colour.primarycolour,
                                      content:
                                          Text("Please enter your Number!")))
                              : ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: Colour.primarycolour,
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
                        "Reset Password",
                        style: GoogleFonts.inter(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w600,
                            color: Colour.secondarycolour),
                      ),
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
