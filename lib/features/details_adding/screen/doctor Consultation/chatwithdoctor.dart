// import 'package:chat_bubbles/bubbles/bubble_normal.dart';
// import 'package:chat_bubbles/bubbles/bubble_normal_audio.dart';
// import 'package:chat_bubbles/bubbles/bubble_normal_image.dart';
// import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
// import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
// import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
// import 'package:chat_bubbles/date_chips/date_chip.dart';
// import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical/features/details_adding/screen/doctor%20Consultation/findDoctor.dart';
import 'package:medical/features/details_adding/screen/widgets/chat_info.dart';
import 'package:medical/features/details_adding/screen/widgets/chat_doctor.dart';
import '../../../../colour.dart';
import '../../../../icons.dart';
import '../../../../main.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var file;

  pickFile(ImageSource) async {
    final imgFile =
        await ImagePicker.platform.getImageFromSource(source: ImageSource);
    file = File(imgFile!.path);
    if (mounted) {
      setState(() {
        file = File(imgFile!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white24,
        // resizeToAvoidBottomInset: false,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FindDoctor(),
                ));
          },
          child: SizedBox(
            height: width * 0.05,
            width: width * 0.8,
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.023),
              child: Padding(
                padding: EdgeInsets.all(width * 0.007),
                child: SvgPicture.asset(
                  ImageIcons.back,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          "Dr. Marcus Horizon",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: width * 0.063),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(width * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ChatInfo(),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    // Chatdoctor(),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      height: height * 0.05,
                      width: width * 0.6,
                      decoration: BoxDecoration(
                          color: Colour.lightgreen,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(width * 0.03),
                            bottomLeft: Radius.circular(width * 0.03),
                            topRight: Radius.circular(width * 0.03),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hello, How can i help you?",
                            style: TextStyle(
                              // color: Colour.thirdcolour,
                              fontSize: width * 0.04,
                              // fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: height * 0.15,
                          width: width * 0.7,
                          decoration: BoxDecoration(
                              color: Colour.primarycolour,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(width * 0.03),
                                bottomLeft: Radius.circular(width * 0.03),
                                topLeft: Radius.circular(width * 0.03),
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(width * 0.03),
                                  child: Text(
                                    "I have suffering from headache\n and cold for 3 days, I took 2 \ntablets of dolo, but still pain",
                                    style: TextStyle(
                                      color: Colour.secondarycolour,
                                      fontSize: width * 0.04,
                                      // fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: height * 0.04,
                                width: width * 0.05,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          ImageIcons.tick,
                                        ),
                                        filterQuality: FilterQuality.high)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    // Chatdoctor(),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      height: height * 0.07,
                      width: width * 0.6,
                      decoration: BoxDecoration(
                          color: Colour.lightgreen,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(width * 0.03),
                            bottomLeft: Radius.circular(width * 0.03),
                            topRight: Radius.circular(width * 0.03),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Ok, Do you have fever? is the\nheadchace severe",
                            style: TextStyle(
                              fontSize: width * 0.04,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: height * 0.13,
                          width: width * 0.7,
                          decoration: BoxDecoration(
                              color: Colour.primarycolour,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(width * 0.03),
                                bottomLeft: Radius.circular(width * 0.03),
                                topLeft: Radius.circular(width * 0.03),
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(width * 0.04),
                                  child: Text(
                                    "I don,t have any fever, \nbut headchace is painful",
                                    style: TextStyle(
                                      color: Colour.secondarycolour,
                                      fontSize: width * 0.04,
                                      // fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: height * 0.04,
                                width: width * 0.05,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          ImageIcons.tick,
                                        ),
                                        filterQuality: FilterQuality.high)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Chatdoctor(),
                    SizedBox(
                      height: height * 0.01,
                    ),

                    Container(
                      height: height * 0.05,
                      width: width * 0.6,
                      decoration: BoxDecoration(
                          color: Colour.lightgreen,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(width * 0.03),
                            bottomLeft: Radius.circular(width * 0.03),
                            topRight: Radius.circular(width * 0.03),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "....",
                            style: TextStyle(
                              // color: Colour.thirdcolour,
                              fontSize: width * 0.04,
                              // fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
          Container(
            height: height * 0.06,
            width: width * 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: width * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.06),
                      border: Border.all(color: Colour.thirdcolour)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: width * 0.35,

                        child: TextFormField(
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            focusColor: Colour.lightgreen,
                            fillColor: Colour.secondarycolour,
                            filled: true,
                            label: Text(
                              "Type message ...",
                              style: TextStyle(
                                  fontSize: width * 0.04, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Colour.thirdcolour.withOpacity(0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topRight: Radius.circular(width * 0.08),
                              topLeft: Radius.circular(width * 0.08),
                            )),
                            constraints: BoxConstraints(
                              maxHeight: height * 0.5,
                              maxWidth: width * 1,
                            ),
                            elevation: 0,
                            context: context,
                            isDismissible: false,
                            builder: (context) {
                              return Container(
                                width: width * 0.5,
                                height: height * 0.3,
                                child: Column(
                                  children: [
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: height * 0.1,
                                          width: width *0.2,
                                          margin: EdgeInsets.only(bottom: width*0.01),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(width * 0.03),
                                            color: Colour.secondarycolour.withOpacity(0.8),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              pickFile(ImageSource.gallery);
                                              Navigator.pop(context);
                                            },
                                            child: Center(
                                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Icon(CupertinoIcons.photo_fill_on_rectangle_fill),
                                                  Text("Gallery",
                                                      style: TextStyle(
                                                          fontSize: width * 0.05,
                                                          fontWeight: FontWeight.w400,
                                                          color:
                                                          Colour.primarycolour)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: height * 0.1,
                                          width: width * 0.2,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(width * 0.03),
                                            color: Colour.secondarycolour.withOpacity(0.8),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              pickFile(ImageSource.camera);
                                              Navigator.pop(context);
                                            },
                                            child: Center(
                                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Icon(CupertinoIcons.camera),
                                                  Text("camera",
                                                      style: TextStyle(
                                                          fontSize: width * 0.05,
                                                          fontWeight: FontWeight.w400,
                                                          color:
                                                          Colour.primarycolour)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),

                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: width * 1,
                                        height: height * 0.05,
                                        margin: EdgeInsets.only(top: width*0.03),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              width * 0.03),
                                            color: Colour.secondarycolour.withOpacity(0.8),


                                        ),
                                        child: Center(
                                          child: Text("Cancel",
                                              style: TextStyle(
                                                  fontSize: width * 0.05,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.red)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: height * 0.05,
                          width: width * 0.09,
                          child: Center(
                            child: SvgPicture.asset(
                              ImageIcons.Paperclip,
                              width: width * 0.06,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width * 0.3,
                  decoration: BoxDecoration(
                      color: Colour.primarycolour,
                      borderRadius: BorderRadius.circular(width * 0.07)),
                  child: Center(
                    child: Text(
                      "Send",
                      style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600,
                          color: Colour.secondarycolour),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
