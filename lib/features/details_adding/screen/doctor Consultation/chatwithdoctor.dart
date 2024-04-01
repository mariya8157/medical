// import 'package:chat_bubbles/bubbles/bubble_normal.dart';
// import 'package:chat_bubbles/bubbles/bubble_normal_audio.dart';
// import 'package:chat_bubbles/bubbles/bubble_normal_image.dart';
// import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
// import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
// import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
// import 'package:chat_bubbles/date_chips/date_chip.dart';
// import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical/colour.dart';

import '../../../../icons.dart';
import '../../../../main.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {


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
              Navigator.pop(context);
            },
            child: SizedBox(
              height: width * 0.05,
              width: width * 0.8,
              child: Padding(
                padding: EdgeInsets.only(left: width*0.023),
                child: Padding(
                  padding:  EdgeInsets.all(width*0.007),
                  child:
                  SvgPicture.asset(
                    ImageIcons.back,),
                ),
              ),
            ),
          ),
          title:  Text(
            "Dr. Marcus Horizon",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: width*0.063
            ),
          ),
          actions: [
            Row(
              children: [
                SvgPicture.asset(ImageIcons.columnDot),
                SizedBox(width: width*0.05,)
              ],)],
        ),
        body: Padding(
          padding: EdgeInsets.all(width*0.03),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: width*1,
                  height: height*0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width*0.03),
                    border: Border.all(color: Colour.lightgreen)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Consultion Start",
                        style: TextStyle(
                            fontSize: width*0.05,
                            fontWeight: FontWeight.w600,
                            color:Colour.primarycolour
                        ),
                      ),
                      Text("You can consult your problem to the doctor",
                        style: TextStyle(
                            fontSize: width*0.04,
                            fontWeight: FontWeight.w400,
                            color:Colour.gray
                        ),
                      ),


                    ],
                  ),
                )
              ],
            ),
          ),
        ),




      );
    }


}
