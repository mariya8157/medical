import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../colour.dart';
import '../../../../icons.dart';
import '../../../../main.dart';

class BookingPage extends StatefulWidget {
  final  List time;
  final  List date;
  const BookingPage({super.key, required this.time, required this.date});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List doctor=[
    {
      "image":ImageIcons.drmarcus1,
      "name":"Dr. Marcus Horizon",
      "spl":"Chardiologist",
      "star":"4,7",
      "distene":"800m away",

    }
  ];

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
          "Appointment",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: width*0.063
          ),
        ),
        actions: [Row(
          children: [
            SvgPicture.asset(ImageIcons.columnDot),
            SizedBox(width: width*0.05,)
          ],)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(width*0.03),
        child: Column(
          children: [
            Container(
              height: height*0.2,
              width: width*1,
              decoration: BoxDecoration(
                  border: Border.all(color: Colour.lightgreen),
                  borderRadius: BorderRadius.circular(width*0.04)
              ),
              child: ListView.separated(
                  shrinkWrap: true,
                  // physics: BouncingScrollPhysics(),

                  itemBuilder: (context, index) {
                    return
                      Padding(
                        padding:  EdgeInsets.all(width*0.03),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: width*0.35,
                              height:height*0.15,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(doctor[index]['image'])),
                                borderRadius: BorderRadius.circular(width*0.03),
                              ),


                            ),
                            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(doctor[index]["name"],
                                  style: TextStyle(
                                      fontSize: width*0.05,
                                      fontWeight: FontWeight.w800,
                                      color:Colour.thirdcolour
                                  ),

                                ),
                                Text(doctor[index]["spl"],
                                  style: TextStyle(
                                      color: Colour.gray,
                                      fontSize: width*0.04
                                  ),

                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: width*0.15,
                                      height: height*0.04,
                                      decoration: BoxDecoration(
                                          color: Colour.lightgreen,
                                          borderRadius: BorderRadius.circular(width*0.01)
                                      ),

                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          SvgPicture.asset(ImageIcons.star) ,
                                          Text(doctor[index]["star"],
                                            style: TextStyle(
                                                color: Colour.primarycolour,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: width*0.3,
                                  height: height*0.05,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SvgPicture.asset(ImageIcons.location,) ,
                                      Text(doctor[index]["distene"],
                                        style: TextStyle(
                                          color: Colour.gray,

                                        ),)
                                    ],
                                  ),
                                )

                              ],
                            )


                          ],
                        ),
                      )
                    ;

                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: height*0.03,
                    );
                  },
                  itemCount: doctor.length
              ),
            ),
            SizedBox(height: width*0.03,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Date",
                  style: TextStyle(
                      fontSize: width*0.05,
                      fontWeight: FontWeight.w800,
                      color:Colour.thirdcolour
                  ),
                ),
                Text("Change",
                  style: TextStyle(
                      fontSize: width*0.04,
                      fontWeight: FontWeight.w500,
                      color:Colour.gray
                  ),
                ),

              ],
            ),
            SizedBox(height: width*0.03,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: width*0.05,
                  backgroundColor: Colour.lightgreen,
                  child: Center(child: SvgPicture.asset(ImageIcons.calendar)),
                ),
                // Text("${widget.date}  II ${widget.time}",
                //   style: TextStyle(
                //       fontSize: width*0.04,
                //       fontWeight: FontWeight.w500,
                //       color:Colour.gray
                //   ),
                // ),
              ],
            ),
            SizedBox(height: width*0.03,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Reason",
                  style: TextStyle(
                      fontSize: width*0.05,
                      fontWeight: FontWeight.w800,
                      color:Colour.thirdcolour
                  ),
                ),
                Text("Change",
                  style: TextStyle(
                      fontSize: width*0.04,
                      fontWeight: FontWeight.w500,
                      color:Colour.gray
                  ),
                ),

              ],
            ),
            SizedBox(height: width*0.03,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: width*0.05,
                  backgroundColor: Colour.lightgreen,
                  child: Center(child: SvgPicture.asset(ImageIcons.square)),
                ),
                Text("Chest pain",
                  style: TextStyle(
                      fontSize: width*0.04,
                      fontWeight: FontWeight.w500,
                      color:Colour.secondarycolour
                  ),
                ),
              ],
            ),



          ],
        ),
      ),

    );
  }
}
