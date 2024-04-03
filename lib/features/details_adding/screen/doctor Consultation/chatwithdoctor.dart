// import 'package:chat_bubbles/bubbles/bubble_normal.dart';
// import 'package:chat_bubbles/bubbles/bubble_normal_audio.dart';
// import 'package:chat_bubbles/bubbles/bubble_normal_image.dart';
// import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
// import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
// import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
// import 'package:chat_bubbles/date_chips/date_chip.dart';
// import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical/colour.dart';
import 'package:medical/features/details_adding/screen/widgets/TabbarPages/chat_info.dart';
import 'package:medical/features/details_adding/screen/widgets/chat_doctor.dart';

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
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
            padding: EdgeInsets.all(width*0.03),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChatInfo(),
                      SizedBox(height: height*0.01,),
                      Chatdoctor(),
                      SizedBox(height: height*0.01,),
                      Container(
                        height: height*0.05,
                        width: width*0.6,
                        decoration: BoxDecoration(
                            color:Colour.lightgreen,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(width*0.03),
                              bottomLeft: Radius.circular(width*0.03),
                              topRight:  Radius.circular(width*0.03),
                            )
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Hello, How can i help you?",
                              style: TextStyle(
                                // color: Colour.thirdcolour,
                                fontSize: width*0.04,
                                // fontWeight: FontWeight.w500,

                              ),

                            )
                          ],
                        ),
                      ),
                      SizedBox(height: height*0.01,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: height*0.15,
                            width: width*0.7,
                            decoration: BoxDecoration(
                                color:Colour.primarycolour,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(width*0.03),
                                  bottomLeft: Radius.circular(width*0.03),
                                  topLeft:Radius.circular(width*0.03),
                                )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Padding(padding: EdgeInsets.all(width*0.03),
                                    child: Text("I have suffering from headache\n and cold for 3 days, I took 2 \ntablets of dolo, but still pain",
                                      style: TextStyle(
                                        color: Colour.secondarycolour,
                                        fontSize: width*0.04,
                                        // fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height*0.04,
                                  width: width*0.05,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(ImageIcons.tick,),
                                          filterQuality: FilterQuality.high

                                      )
                                  ),
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: height*0.01,),
                      Chatdoctor(),
                      SizedBox(height: height*0.01,),
                      Container(
                        height: height*0.07,
                        width: width*0.6,
                        decoration: BoxDecoration(
                            color:Colour.lightgreen,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(width*0.03),
                              bottomLeft: Radius.circular(width*0.03),
                              topRight:  Radius.circular(width*0.03),
                            )
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Ok, Do you have fever? is the\nheadchace severe",
                              style: TextStyle(
                                fontSize: width*0.04,

                              ),

                            )
                          ],
                        ),
                      ),
                      SizedBox(height: height*0.01,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: height*0.13,
                            width: width*0.7,
                            decoration: BoxDecoration(
                                color:Colour.primarycolour,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(width*0.03),
                                  bottomLeft: Radius.circular(width*0.03),
                                  topLeft:Radius.circular(width*0.03),
                                )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Padding(padding: EdgeInsets.all(width*0.04),
                                    child: Text("I don,t have any fever, \nbut headchace is painful",
                                      style: TextStyle(
                                        color: Colour.secondarycolour,
                                        fontSize: width*0.04,
                                        // fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height*0.04,
                                  width: width*0.05,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(ImageIcons.tick,),
                                          filterQuality: FilterQuality.high

                                      )
                                  ),
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                      Chatdoctor(),
                      Container(
                        height: height*0.05,
                        width: width*0.6,
                        decoration: BoxDecoration(
                            color:Colour.lightgreen,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(width*0.03),
                              bottomLeft: Radius.circular(width*0.03),
                              topRight:  Radius.circular(width*0.03),
                            )
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("....",
                              style: TextStyle(
                                // color: Colour.thirdcolour,
                                fontSize: width*0.04,
                                // fontWeight: FontWeight.w500,

                              ),

                            ),

                          ],
                        ),
                      ),













                    ],
                  ),

                ],
              ),
            ),
            Container(
              height: height*0.06,
              width: width*1,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: width*0.6,
                    child: TextField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.emailAddress,

                      decoration: InputDecoration(
                        suffixIcon:SvgPicture.asset(ImageIcons.Paperclip,height: height*0.01,
                        width: width*0.01,) ,

                        focusColor: Colour.lightgreen,
                        fillColor: Colour.secondarycolour,
                        filled: true,
                        label: Text("Type message ...",
                        style: TextStyle(fontSize: width*0.04,
                          color: Colors.grey
                        ),),
                        border:
                        OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width*0.06)
                        )
                      ),

                    ),
                  ),
                  Container(
                    width: width*0.3,
                    decoration: BoxDecoration(
                        color: Colour.primarycolour,
                        borderRadius: BorderRadius.circular(width*0.07)
                    ),
                    child: Center(
                      child: Text("Send",
                        style: TextStyle(
                            fontSize: width*0.04,
                            fontWeight: FontWeight.w600,
                            color: Colour.secondarycolour
                        ),),
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
