import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/features/details_adding/screen/doctor%20Consultation/chatwithdoctor.dart';

import '../../../../colour.dart';
import '../../../../icons.dart';
import '../../../../main.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key,  });

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
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: width*0.05,
                  backgroundColor: Colour.lightgreen,
                  child: Center(child: SvgPicture.asset(ImageIcons.calendar)),
                ),
                Text("Wednesday, Jun 23, 2021 | 10:00AM",
                  style: TextStyle(
                      fontSize: width*0.04,
                      fontWeight: FontWeight.w500,
                      color:Colour.gray
                  ),
                ),
              ],
            ),
            Divider(thickness: width*0.004,
              color: Colour.lightgreen,
              // indent: width*0.03,
              // endIndent: width*0.03,
            ),
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
            Row(
              children: [
                CircleAvatar(
                  radius: width*0.05,
                  backgroundColor: Colour.lightgreen,
                  child: Center(child: SvgPicture.asset(ImageIcons.square)),
                ),
                SizedBox(width: width*0.05,),

                Text("Chest pain",
                  style: TextStyle(
                      fontSize: width*0.05,
                      fontWeight: FontWeight.w500,
                      color:Colour.thirdcolour
                  ),
                ),
              ],
            ),
            Divider(thickness: width*0.004,
              color: Colour.lightgreen,
              // indent: width*0.03,
              // endIndent: width*0.03,
            ),
            Row(
              children: [
                Text("Payment Detail",
                  style: TextStyle(
                      fontSize: width*0.05,
                      fontWeight: FontWeight.w800,
                      color:Colour.thirdcolour
                  ),
                ),

              ],
            ),
            SizedBox(height: width*0.02,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Consultation",
                  style: TextStyle(
                      fontSize: width*0.05,
                      fontWeight: FontWeight.w500,
                      color:Colour.gray
                  ),
                ),
                Text("\$60",
                  style: TextStyle(
                      fontSize: width*0.05,
                      fontWeight: FontWeight.w500,
                      color:Colour.thirdcolour
                  ),
                ),

              ],
            ),
            SizedBox(height: width*0.01,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Admin Fee",
                  style: TextStyle(
                      fontSize: width*0.05,
                      fontWeight: FontWeight.w500,
                      color:Colour.gray
                  ),
                ),
                Text("\$60",
                  style: TextStyle(
                      fontSize: width*0.05,
                      fontWeight: FontWeight.w500,
                      color:Colour.thirdcolour
                  ),
                ),

              ],
            ),
            SizedBox(height: width*0.01,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Aditional Discount",
                  style: TextStyle(
                      fontSize: width*0.05,
                      fontWeight: FontWeight.w500,
                      color:Colour.gray
                  ),
                ),
                Text("\$60",
                  style: TextStyle(
                      fontSize: width*0.05,
                      fontWeight: FontWeight.w500,
                      color:Colour.thirdcolour
                  ),
                ),

              ],
            ),
            SizedBox(height: width*0.02,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",
                  style: TextStyle(
                      fontSize: width*0.05,
                      fontWeight: FontWeight.w600,
                      color:Colour.thirdcolour
                  ),
                ),
                Text("\$60",
                  style: TextStyle(
                      fontSize: width*0.05,
                      fontWeight: FontWeight.w600,
                      color:Colour.primarycolour
                  ),
                ),

              ],
            ),
            Divider(thickness: width*0.004,
              color: Colour.lightgreen,
              // indent: width*0.03,
              // endIndent: width*0.03,
            ),
            Row(
              children: [
                Text("Payment Method",
                  style: TextStyle(
                      fontSize: width*0.05,
                      fontWeight: FontWeight.w800,
                      color:Colour.thirdcolour
                  ),
                ),

              ],
            ),
            InkWell(
              onTap: () {
                // select1=true;
                // select2=false;
                // select3=false;
                // select4=false;
                // setState(() {
                //
                // });
              },
              child: Container(
                height: width*0.15,
                width: width*1,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.03),
                  // color: ColourTheme.thirtyth5Color,
                  border: Border.all(
                      // color:select1==true? ColourTheme.primaryColor:ColourTheme.thirtyth5Color
                  ),

                ) ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(ImageIcons.visa),
                    SizedBox(width: width*0.1),

                    Text("Change",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: width*0.04,
                            // color:ColourTheme.thirtyth6Color
                        ))

                  ],
                ),
              ),
            ),
            SizedBox(height: width*0.02,),

            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Container(
                  height: height*0.08,
                  width: width*0.3,
                  child: Center(
                      child: Column(
                        children: [
                          Text("Total",
                            style: TextStyle(
                                fontSize: width*0.05,
                                fontWeight: FontWeight.w600,
                                color:Colour.gray
                            ),
                          ),
                          Text("\$60",
                            style: TextStyle(
                                fontSize: width*0.05,
                                fontWeight: FontWeight.w800,
                                color:Colour.thirdcolour
                            ),
                          ),

                        ],
                      )
                  ),
                ),
                // InkWell(
                //   onTap: () {
                //
                //
                //   },
                //   child: Container(
                //     height: height*0.07,
                //     width: width*0.6,
                //     decoration: BoxDecoration(
                //         color: Colour.primarycolour,
                //         borderRadius: BorderRadius.circular(width*0.07)
                //     ),
                //     child: Center(
                //       child: Text("Booking",
                //         style: TextStyle(
                //             fontSize: width*0.045,
                //             fontWeight: FontWeight.w600,
                //             color: Colour.secondarycolour
                //         ),),
                //     ),
                //   ),
                // ),
                InkWell(
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Container(
                            height: width*0.8,
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
                                        Text("Payment Success",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: width*0.042,
                                              color: Colour.thirdcolour),),
                                        Text("Your payment has been successful,",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: width*0.032,
                                              color: Colour.color1),),
                                        Text("you can have a consultation session",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: width*0.032,
                                              color: Colour.color1),),
                                        Text("with your trusted doctor",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: width*0.032,
                                              color: Colour.color1),),
                                      ],)),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => ChatPage(),));

                                  },
                                  child: Container(
                                    height: width*0.12,
                                    width: width*0.34,
                                    decoration: BoxDecoration(
                                        color: Colour.primarycolour,
                                        borderRadius: BorderRadius.circular(width*0.05)
                                    ),
                                    child: Center(
                                      child: Text("Chat Doctor",
                                        style: TextStyle(
                                            fontSize: width*0.04,
                                            fontWeight: FontWeight.w600,
                                            color: Colour.secondarycolour
                                        ),),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },);
                  },
                  child: Container(
                    height: height*0.07,
                    width: width*0.6,
                    decoration: BoxDecoration(
                        color: Colour.primarycolour,
                        borderRadius: BorderRadius.circular(width*0.07)
                    ),
                    child: Center(
                      child: Text("Booking",
                        style: TextStyle(
                            fontSize: width*0.045,
                            fontWeight: FontWeight.w600,
                            color: Colour.secondarycolour
                        ),),
                    ),
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
