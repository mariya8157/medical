import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../../../../core/constants/colour.dart';
import '../../../../../core/constants/icons.dart';
import '../../../../../main.dart';
import 'createpassword.dart';

class VerificationPage extends StatefulWidget {
  final String email;
  final String phone;

  const VerificationPage({super.key, required this.email, required this.phone});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController pinController = TextEditingController();

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
          padding: EdgeInsets.all(width * 0.03),
          child: Column(
            children: [
              SizedBox(
                height: width * 0.02,
              ),
              Row(
                children: [
                  Text(
                    "Enter Verification Code",
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
                    "Enter code that we have send to your",
                    style: TextStyle(
                        fontSize: width * 0.037,
                        fontWeight: FontWeight.w500,
                        color: Colour.color1),
                  )
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        "number ",
                        style: TextStyle(
                            fontSize: width * 0.037,
                            fontWeight: FontWeight.w500,
                            color: Colour.color1),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.phone,
                        style: TextStyle(
                            fontSize: width * 0.037,
                            fontWeight: FontWeight.w600,
                            color: Colour.thirdcolour),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: width * 0.09,
              ),
              Pinput(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                length: 4,
                controller: pinController,
                onChanged: (value) {},
                onSubmitted: (value) {},
                focusedPinTheme: PinTheme(
                    textStyle: TextStyle(
                        fontSize: width * 0.045, fontWeight: FontWeight.w600),
                    height: width * 0.19,
                    width: width * 0.17,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.03),
                        border: Border.all(
                            color: Colour.primarycolour,
                            width: width * 0.004))),
              ),
              SizedBox(
                height: width * 0.1,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreatePasswordPage(),
                      ));
                },
                child: Container(
                  height: width * 0.16,
                  width: width * 0.93,
                  decoration: BoxDecoration(
                      color: Colour.primarycolour,
                      borderRadius: BorderRadius.circular(width * 0.07)),
                  child: Center(
                    child: Text(
                      "Verify",
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
              SizedBox(
                  height: width * 0.07,
                  width: width * 0.67,
                  child: Row(
                    children: [
                      Text(
                        "Didn't receive the code ? ",
                        style: TextStyle(
                            fontSize: width * 0.035,
                            fontWeight: FontWeight.w500,
                            color: Colour.color5),
                      ),
                      Text(
                        "Resend",
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
    );
  }
}
