import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/features/details_adding/screen/doctor%20Consultation/chatwithdoctor.dart';
import 'package:medical/features/details_adding/screen/doctor%20Consultation/doctordetails.dart';
import '../../../../core/colour.dart';
import '../../../../core/icons.dart';
import '../../../../main.dart';
import '../onlinePharmacy/drugsdetail.dart';

class BookingPage extends StatefulWidget {
  final List time;
  const BookingPage({super.key, required this.time,  });

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int selectedOption=1;
  List doctor=[
    {
      "image":ImageIcons.drmarcus1,
      "name":"Dr. Marcus Horizon",
      "spl":"Chardiologist",
      "star":"4,7",
      "distene":"800m away",

    }
  ];
  TextEditingController reason=TextEditingController();
// dynamic total=0;
// addCost(){
//  total= widget.time[0]["Consultation"]*2;
// }
  double total =0;
  addCost(){
      total=0;
      for(int i=0;i<widget.time.length;i++)
      {
        total=widget.time[i]["consultation"]+widget.time[i]["Admin Fee"]-widget.time[i]["Aditional Discount"];
        print(total);
      }
    }



  @override
  void initState() {
    // TODO: implement initState
    addCost();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.all(width*0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  image: DecorationImage(image: AssetImage(widget.time[0]['image'])),
                                  borderRadius: BorderRadius.circular(width*0.03),
                                ),


                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.time[0]["name"],
                                    style: TextStyle(
                                        fontSize: width*0.05,
                                        fontWeight: FontWeight.w800,
                                        color:Colour.thirdcolour
                                    ),

                                  ),
                                  Text(widget.time[0]["spl"],
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
                                            Text(widget.time[0]["star"],
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
                                        Text(widget.time[0]["distene"],
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
              SizedBox(height: height*0.02,),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date",
                    style: TextStyle(
                        fontSize: width*0.05,
                        fontWeight: FontWeight.w800,
                        color:Colour.thirdcolour
                    ),
                  ),


                ],
              ),
              SizedBox(height: height*0.02,),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: width*0.05,
                    backgroundColor: Colour.lightgreen,
                    child: Center(child: SvgPicture.asset(ImageIcons.calendar)),
                  ),
                  // Text("Wednesday, Jun 23, 2021 | 10:00AM",
                  Text(widget.time[0]['date'].toString().substring(0,10),
                    style: TextStyle(
                        fontSize: width*0.04,
                        fontWeight: FontWeight.w500,
                        color:Colour.thirdcolour
                    ),
                  ),
                  Text(widget.time[0]['time'].toString(),
                    style: TextStyle(
                        fontSize: width*0.04,
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Reason",
                    style: TextStyle(
                        fontSize: width*0.05,
                        fontWeight: FontWeight.w800,
                        color:Colour.thirdcolour
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      reason.clear();
                    },
                    child: Container(
                      child: Text("Change",
                        style: TextStyle(
                            fontSize: width*0.04,
                            fontWeight: FontWeight.w500,
                            color:Colour.gray
                        ),
                      ),
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

                  Container(
                    width: width*0.6,
                    child:
                    TextFormField(
                      controller: reason,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none
                        )
                      ),

                      style: TextStyle(
                        fontSize: width*0.05,
                        fontWeight: FontWeight.w500,
                        color: Colour.thirdcolour
                      ),


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
              SizedBox(height: height*0.02,),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Consultation",
                    style: TextStyle(
                        fontSize: width*0.05,
                        fontWeight: FontWeight.w500,
                        color:Colour.gray
                    ),
                  ),
                  // Container(
                  //   width: width*0.15,
                  //   height: height*0.05,
                  //
                  //   child:TextFormField(
                  //     controller: cunsult,
                  //     keyboardType: TextInputType.text,
                  //     textInputAction: TextInputAction.done,
                  //     textCapitalization: TextCapitalization.words,
                  //     decoration: InputDecoration(
                  //         border: OutlineInputBorder(
                  //             borderSide: BorderSide.none
                  //         )
                  //     ),
                  //
                  //     style: TextStyle(
                  //         fontSize: width*0.05,
                  //         fontWeight: FontWeight.w500,
                  //         color: Colour.thirdcolour
                  //     ),
                  //
                  //
                  //   ),
                  //
                  // )

                  Text(widget.time[0]["consultation"].toString(),
                    style: TextStyle(
                        fontSize: width*0.05,
                        fontWeight: FontWeight.w500,
                        color:Colour.thirdcolour
                    ),
                  ),

                ],
              ),
              SizedBox(height: height*0.01,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Admin Fee",
                    style: TextStyle(
                        fontSize: width*0.05,
                        fontWeight: FontWeight.w500,
                        color:Colour.gray
                    ),
                  ),
                  // Container(
                  //   width: width*0.15,
                  //   height: height*0.05,
                  //   child:TextFormField(
                  //     controller: admission,
                  //     keyboardType: TextInputType.text,
                  //     textInputAction: TextInputAction.done,
                  //     textCapitalization: TextCapitalization.words,
                  //     decoration: InputDecoration(
                  //         border: OutlineInputBorder(
                  //             borderSide: BorderSide.none
                  //         )
                  //     ),
                  //
                  //     style: TextStyle(
                  //         fontSize: width*0.05,
                  //         fontWeight: FontWeight.w500,
                  //         color: Colour.thirdcolour
                  //     ),
                  //
                  //
                  //   ),
                  //
                  // )

                  Text(widget.time[0]["Admin Fee"].toString(),
                    style: TextStyle(
                        fontSize: width*0.05,
                        fontWeight: FontWeight.w500,
                        color:Colour.thirdcolour
                    ),
                  ),

                ],
              ),
              SizedBox(height: height*0.01,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Aditional Discount",
                    style: TextStyle(
                        fontSize: width*0.05,
                        fontWeight: FontWeight.w500,
                        color:Colour.gray
                    ),
                  ),

                  Text(widget.time[0]["Aditional Discount"].toString(),
                    style: TextStyle(
                        fontSize: width*0.05,
                        fontWeight: FontWeight.w500,
                        color:Colour.thirdcolour
                    ),
                  ),

                ],
              ),
              SizedBox(height: height*0.02,),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",
                    style: TextStyle(
                        fontSize: width*0.05,
                        fontWeight: FontWeight.w600,
                        color:Colour.thirdcolour
                    ),
                  ),
                  Text("$total",
                    style: TextStyle(
                        fontSize: width*0.05,
                        fontWeight: FontWeight.w600,
                        color:Colour.primarycolour
                    ),
                  ),

                ],
              ),
              SizedBox(height: height*0.01,),

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
              SizedBox(height: height*0.02,),

              // InkWell(
              //   onTap: () {
              //     // select1=true;
              //     // select2=false;
              //     // select3=false;
              //     // select4=false;
              //     // setState(() {
              //     //
              //     // });
              //   },
              //   child: Container(
              //     height: width*0.15,
              //     width: width*1,
              //     decoration:BoxDecoration(
              //       borderRadius: BorderRadius.circular(width*0.03),
              //       // color: ColourTheme.thirtyth5Color,
              //       border: Border.all(
              //         // color:select1==true? ColourTheme.primaryColor:ColourTheme.thirtyth5Color
              //       ),
              //
              //     ) ,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //         Image.asset(ImageIcons.visa),
              //         SizedBox(width: width*0.1),
              //
              //         Text("Change",
              //             style: TextStyle(
              //               fontWeight: FontWeight.w500,
              //               fontSize: width*0.04,
              //               // color:ColourTheme.thirtyth6Color
              //             ))
              //
              //       ],
              //     ),
              //   ),
              // ),
              Column(
                  children: [
                    Container(
                        height: width*0.18,
                        width: width*80,
                        decoration: BoxDecoration(
                            color: Colour.lightgreen,
                            borderRadius: BorderRadius.circular(width*0.03)
                        ),



                        child: ListTile(
                          leading: Container(
                            height: width*0.07,
                            width: width*0.07,
                            child: Image(image: NetworkImage("https://pbs.twimg.com/profile_images/1615271089705463811/v-emhrqu_400x400.png"),
                            // SvgPicture.asset(ImageIcons.paypal,
                              // color: Colors.red,
                              // fit: BoxFit.fill,
                            ),),
                          title: Text("PhonePe"),
                          trailing: Radio(value: 1,
                            groupValue: selectedOption,
                            onChanged: ( value) {
                              setState(() {
                                selectedOption=value!;
                              });
                            },
                          ),
                        )),
                    SizedBox(height: height*0.01,),

                    Container(
                      height: width*0.18,
                      width: width*80,
                      decoration: BoxDecoration(
                          color: Colour.lightgreen,
                          borderRadius: BorderRadius.circular(width*0.03)
                      ),
                      child: ListTile(
                        leading: Container(
                            height: width*0.07,
                            width: width*0.07,
                            child: Image(image: NetworkImage("https://www.computerhope.com/jargon/g/google-pay.png"))),
                        title: Text("GPay"),
                        trailing: Radio(value: 2,
                          groupValue: selectedOption,
                          onChanged: ( value) {
                            setState(() {
                              selectedOption=value!;
                            });
                          },),
                      ),),
                    SizedBox(height: height*0.01,),

                    Container(
                      height: width*0.18,
                      width: width*80,
                      decoration: BoxDecoration(
                          color: Colour.lightgreen,
                          borderRadius: BorderRadius.circular(width*0.03)
                      ),
                      child: ListTile(
                        leading: SvgPicture.asset(ImageIcons.apple),
                        title: Text("Apple Pay"),
                        trailing: Radio(value: 3,
                          groupValue: selectedOption,
                          onChanged: ( value) {
                            setState(() {
                              selectedOption=value!;
                            });
                          },),),
                    ),
                    SizedBox(height: height*0.01,),

                    // Container(
                    //   height: width*0.18,
                    //   width: width*80,
                    //   color: Colors.blue,
                    //   child: ListTile(
                    //     leading: SvgPicture.asset(ImageIcons.circle),
                    //     title: Text("**** **** **** ****4679"),
                    //     trailing: Radio(value: 4,
                    //       groupValue: selectedOption,
                    //       onChanged: ( value) {
                    //         setState(() {
                    //           selectedOption=value!;
                    //         });
                    //       },),
                    //   ),)
                  ]
                  ),

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
                            Text("$total",
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
      ),

    );
  }
}
