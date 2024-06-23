import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical/main.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../colour.dart';
import '../../../../icons.dart';
import '../doctor Consultation/bookingdoctor.dart';
import '../login & Sign Up/login.dart';
import '../login & Sign Up/signup.dart';
import '../onlinePharmacy/mycart.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var file;
  pickFile(ImageSource) async {
    final imgFile = await ImagePicker.platform.pickImage(source: ImageSource);
    file = File(imgFile!.path);
    if (mounted) {
      setState(() {
        file = File(imgFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: width * 1,
                height: height * 0.981,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colour.lightprimarycolor.withOpacity(0.9),
                        Colour.primarycolour.withOpacity(0.5)
                      ]),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(children: [
                      Image.asset(
                        ImageIcons.line,
                        width: width * 0.8,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.182, top: width * 0.25),
                        child: Stack(
                          children: [
                            file == null
                                ? Image.asset(
                                    ImageIcons.lady,
                                    width: width * 0.29,
                                  )
                                : CircleAvatar(
                                    radius: width * 0.147,
                                    backgroundImage: FileImage(file),
                                  ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.1895, top: width * 0.222),
                              child: InkWell(
                                onTap: () {
                                  pickFile(ImageSource.camera);
                                },
                                child: CircleAvatar(
                                  radius: width * 0.035,
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colour.primarycolour,
                                    size: width * 0.05,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: width * 0.3),
                              child: Text(
                                "Amelia Renata",
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w700,
                                    color: Colour.secondarycolour),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: width * 0.76),
                        child: Container(
                          height: width * 0.27,
                          width: width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(ImageIcons.heartbeat),
                                  SizedBox(
                                    height: width * 0.013,
                                  ),
                                  Text(
                                    "Heart rate",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: width * 0.043,
                                        color: Colour.secondarycolour,
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.42),
                                              blurRadius: width * 0.02,
                                              spreadRadius: width * 0.01,
                                              offset: Offset(0, 4))
                                        ]),
                                  ),
                                  Text(
                                    "215bpm",
                                    style: TextStyle(
                                        fontSize: width * 0.059,
                                        fontWeight: FontWeight.w700,
                                        color: Colour.secondarycolour,
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.42),
                                              blurRadius: width * 0.02,
                                              spreadRadius: width * 0.01,
                                              offset: Offset(0, 4))
                                        ]),
                                  )
                                ],
                              ),
                              Container(
                                height: width * 0.15,
                                width: width * 0.002,
                                color: Colour.secondarycolour,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(ImageIcons.fire),
                                  SizedBox(
                                    height: width * 0.013,
                                  ),
                                  Text(
                                    "Calories",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: width * 0.043,
                                        color: Colour.secondarycolour,
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.42),
                                              blurRadius: width * 0.02,
                                              spreadRadius: width * 0.01,
                                              offset: Offset(0, 4))
                                        ]),
                                  ),
                                  Text(
                                    "756cal",
                                    style: TextStyle(
                                        fontSize: width * 0.059,
                                        fontWeight: FontWeight.w700,
                                        color: Colour.secondarycolour,
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.42),
                                              blurRadius: width * 0.02,
                                              spreadRadius: width * 0.01,
                                              offset: Offset(0, 4))
                                        ]),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: width * 0.05,
                    ),
                    Container(
                      height: width * 0.876,
                      width: width * 1,
                      decoration: BoxDecoration(
                          color: Colour.secondarycolour,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(width * 0.09),
                              topRight: Radius.circular(width * 0.09))),
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.013),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: width * 0.03,
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //     builder: (context) =>BookingPage(time: ,) ));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: width * 0.06,
                                  backgroundColor: Colour.lightgreen,
                                  child:
                                      SvgPicture.asset(ImageIcons.appoitmnet),
                                ),
                                title: Text(
                                  "Appointment",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: width * 0.05),
                                ),
                                trailing: SvgPicture.asset(ImageIcons.nxtback),
                              ),
                            ),
                            Divider(
                              thickness: width * 0.002,
                              endIndent: width * 0.08,
                              indent: width * 0.06,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyCartPage(
                                              d: [],
                                            )));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: width * 0.06,
                                  backgroundColor: Colour.lightgreen,
                                  child: SvgPicture.asset(ImageIcons.wallet),
                                ),
                                title: Text("Payment Method",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width * 0.05)),
                                trailing: SvgPicture.asset(ImageIcons.nxtback),
                              ),
                            ),
                            Divider(
                              thickness: width * 0.002,
                              endIndent: width * 0.08,
                              indent: width * 0.06,
                            ),
                            InkWell(
                              onTap: () {

                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: width * 0.06,
                                  backgroundColor: Colour.lightgreen,
                                  child: SvgPicture.asset(ImageIcons.faqs),
                                ),
                                title: Text("About Us",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width * 0.05)),
                                trailing: SvgPicture.asset(ImageIcons.nxtback),
                              ),
                            ),
                            Divider(
                              thickness: width * 0.002,
                              endIndent: width * 0.08,
                              indent: width * 0.06,
                            ),
                            InkWell(
                              onTap: () {
                                QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.confirm,
                                    text: 'Do you want to logout',
                                    confirmBtnText: 'Yes',
                                    cancelBtnText: 'No',
                                    confirmBtnColor: Colour.primarycolour,

                                    onConfirmBtnTap: () async {
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      prefs.remove("login");
                                      prefs.remove("name");
                                      prefs.clear();
                                      Navigator.pushAndRemoveUntil(context,
                                          MaterialPageRoute(builder: (context) => LoginPage(),), (route) => false);

                                    });
                              },
                              // onTap: () {
                              //   showDialog(
                              //     barrierDismissible: false,
                              //     context: context,
                              //     builder: (context) {
                              //       return AlertDialog(
                              //         title: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           children: [
                              //             SizedBox(height: width*0.05,),
                              //             CircleAvatar(
                              //               radius: width * 0.11,
                              //               backgroundColor: Colour.lightblue,
                              //               child: SvgPicture.asset(
                              //                 ImageIcons.logout,
                              //                 width: width * 0.13,
                              //               ),
                              //             ),
                              //             SizedBox(height: width*0.05,),
                              //             Container(
                              //               height: width * 0.55,
                              //               width: width * 0.8,
                              //               child: Column(
                              //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //                 children: [
                              //                   Column(
                              //                     children: [
                              //                       Text(
                              //                         "Are you sure to log out of ",
                              //                         style: TextStyle(
                              //                             fontWeight: FontWeight.w700,
                              //                             fontSize: width * 0.055),
                              //                       ),
                              //                       Text("your account?",
                              //                           style: TextStyle(
                              //                               fontWeight:
                              //                                   FontWeight.w700,
                              //                               fontSize: width * 0.055)),
                              //                     ],
                              //                   ),
                              //                   InkWell(
                              //                     onTap: () {
                              //                       Navigator.pushAndRemoveUntil(
                              //                           context, MaterialPageRoute(
                              //                           builder: (context) => SignupPage(),),(route) => false,);
                              //                     },
                              //                     child: Container(
                              //                       height: width * 0.13,
                              //                       width: width * 0.45,
                              //                       decoration: BoxDecoration(
                              //                           color: Colour.primarycolour,
                              //                           borderRadius:
                              //                               BorderRadius.circular(
                              //                                   width * 0.08)),
                              //                       child: Center(
                              //                         child: Text(
                              //                           "Log Out",
                              //                           style: TextStyle(
                              //                               fontSize: width * 0.055,
                              //                               fontWeight:
                              //                                   FontWeight.w700,
                              //                               color: Colors.white),
                              //                         ),
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   InkWell(
                              //                     onTap: () {
                              //                       Navigator.pop(context);
                              //                     },
                              //                     child: Container(
                              //                       height: width*0.09,
                              //                       width: width*0.2,
                              //                       child: Center(
                              //                         child: Text(
                              //                           "Cancel",
                              //                           style: TextStyle(
                              //                               fontSize: width * 0.047,
                              //                               color:
                              //                                   Colour.primarycolour),
                              //                         ),
                              //                       ),
                              //                     ),
                              //                   )
                              //                 ],
                              //               ),
                              //             )
                              //           ],
                              //         ),
                              //         content: SizedBox(
                              //           height: height * 0.001,
                              //           width: width * 0.05,
                              //         ),
                              //       );
                              //     },
                              //   );
                              // },
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: width * 0.06,
                                  backgroundColor: Colour.lightgreen,
                                  child: SvgPicture.asset(ImageIcons.danger),
                                ),
                                title: Text("Logout",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: width * 0.05,
                                        color: Colour.color4)),
                                trailing: SvgPicture.asset(ImageIcons.nxtback),
                              ),
                            ),
                            SizedBox(
                              height: width * 0.03,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
