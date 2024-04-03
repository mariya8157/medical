import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical/features/details_adding/screen/doctor%20Consultation/bookingdoctor.dart';
import 'package:readmore/readmore.dart';

import '../../../../colour.dart';
import '../../../../icons.dart';
import '../../../../main.dart';


class DoctordetailsPage extends StatefulWidget {
  final List doctor;
  const DoctordetailsPage({super.key, required this.doctor});

  @override
  State<DoctordetailsPage> createState() => _DoctordetailsPageState();
}

class _DoctordetailsPageState extends State<DoctordetailsPage> {
  List doctor1=[
    {
      "image":ImageIcons.drmarcus1,
      "name":"Dr. Marcus Horizon",
      "spl":"Chardiologist",
      "star":"4,7",
      "distene":"800m away",

    }
  ];
  List size=[
    {
      "day":"Mon",
      "name":"Monday",
      "date":21,
    },
    {
      "day":"Tue",
      "name":"Tuesday",
      "date":22,
    },
    {
      "day":"Wed",
      "name":"Wednesday",
      "date":23,
    },
    {
      "day":"Thu",
      "name":"Thursday",
      "date":24,
    } ,
    {
      "day":"Fri",
      "name":"Friday",
      "date":25,
    },
    {
      "day":"Sat",
      "name":"Saturday",
      "date":27,
    }
  ];
int selectIndex=0;
List time=[
  "09:00 AM",
  "10:00 AM",
  "11:00 AM",
  "01:00 PM",
  "02:00 PM",
  "03:00 PM",
  "04:00 PM",
  "07:00 PM",
  "08:00 PM",
];
int selectIndex1=0;
List day=[];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white24,
        // resizeToAvoidBottomInset: false,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.all(width*0.05),
            child: SvgPicture.asset(
              ImageIcons.catogory8,),
          ),
        ),
        title:  Text(
          "Doctor Detail",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: width*0.055
          ),
        ),
        actions: [Row(
          children: [
            SvgPicture.asset(ImageIcons.columnDot),
            SizedBox(width: width*0.05,)
          ],),]
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(width*0.03),
          child: Column(
            children: [
              ListView.separated(
                  shrinkWrap: true,
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
                                image: DecorationImage(image: AssetImage(widget.doctor[index]['image']),fit: BoxFit.fill),
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(width*0.03),
        
                              ),
        
        
                            ),
                            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.doctor[index]["name"],
                                  style: TextStyle(
                                      fontSize: width*0.045,
                                      fontWeight: FontWeight.w800,
                                      color:Colour.thirdcolour
                                  ),
        
                                ),
                                Text(widget.doctor[index]["spl"],
                                  style: TextStyle(
                                      color: Colour.gray,
                                      fontSize: width*0.037
                                  ),
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: width*0.15,
                                      height: height*0.03,
                                      decoration: BoxDecoration(
                                          color: Colour.lightgreen,
                                          borderRadius: BorderRadius.circular(width*0.01)
                                      ),
        
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          SvgPicture.asset(ImageIcons.star) ,
                                          Text(widget.doctor[index]["star"],
                                            style: TextStyle(
                                                color: Colour.primarycolour,
                                                fontWeight: FontWeight.w500,
                                                fontSize: width*0.037
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
                                      Text(widget.doctor[index]["distene"],
                                      style: TextStyle(
                                        color: Colour.gray,
                                          fontSize: width*0.037
                                      ),)
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: height*0.03,
                    );
                  },
                  itemCount:widget.doctor.length
              ),
              SizedBox(height: width*0.03,),
              Row(
                children: [
                  Text("About",
                    style: TextStyle(
                        fontSize: width*0.05,
                        fontWeight: FontWeight.w800,
                        color:Colour.thirdcolour
                    ),
                  ),
                ],
              ),
              SizedBox(height: width*0.03,),
              ReadMoreText(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n"
                    "sed do eiusmod tempor incididunt ut labore et dolore\n"
                  "magna aliqua. Ut enim ad minim veniam\n"
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n"
                  "sed do eiusmod tempor incididunt ut labore et\n",
                trimLines: 3,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'read more',
                style: TextStyle(
                  fontSize: width*0.03, fontWeight:FontWeight.w400,color: Colour.gray
                ),
                trimExpandedText: 'less',
                lessStyle: TextStyle(fontSize:width*0.03, fontWeight: FontWeight.bold,color:Colour.primarycolour ),
                moreStyle: TextStyle(fontSize:width*0.03, fontWeight: FontWeight.bold,color:Colour.primarycolour ),
              ),
              SizedBox(height: width*0.03,),
              Container(
                height: height*0.09,
                width: width*1,
                child: ListView.separated(
                  itemCount:size.length ,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          selectIndex=index;
                          setState(() {
        
        
                          });
                        },
        
                        child: Container(
                          width:width*0.14,
                          height: width*0.08,
                          decoration: BoxDecoration(
                            border: Border.all(color:Colour.lightgreen),
                            borderRadius: BorderRadius.circular(width*0.04),
                            color:selectIndex==index?Colour.primarycolour: Colour.secondarycolour,
                          ),
                          child:  Column(crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(size[index]["day"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: width*0.035, color:selectIndex==index?Colour.secondarycolour:Colour.color1
                                  )),
                              Text(size[index]["date"].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: width*0.057, color:selectIndex==index?Colour.secondarycolour:Colour.thirdcolour
                                  )),
                            ],
                          ),
        
        
                        )
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: width*0.03,);
                },
        
                ),
              ),
              SizedBox(height: width*0.03,),
              Divider(thickness: width*0.004,
                color: Colour.lightgreen,
                // indent: width*0.03,
                // endIndent: width*0.03,
              ),
              SizedBox(height: width*0.03,),
              Container(
                width: width*1,
                height: height*0.28,
                child: GridView.builder(
                  itemCount:time.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2.1,
                    crossAxisSpacing:height*0.02,
                    mainAxisSpacing: width*0.04,
                    crossAxisCount: 3,
                  ),
        
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  // scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return
                      InkWell(onTap: () {
                        selectIndex1=index;
                        setState(() {
        
                        });
                      },
                        child: Container(
                            width: width*0.3,
                            height: width*0.01,
                            decoration: BoxDecoration(color: selectIndex1==index?Colour.primarycolour:Colour.secondarycolour,
                                borderRadius: BorderRadius.circular(width*0.04),
                              border: Border.all(color: Colour.lightgreen,
                              width: width*0.005)
                            ),
                            child: Center(
                              child: Text(time[index], style: TextStyle(
                                color: selectIndex1==index?Colour.secondarycolour:Colour.thirdcolour,
                                fontSize: width*0.04),),
                            )),
                      );
                  },
                ),
              ),
              // SizedBox(height: width*0.03,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  
                  Container(
                    height: height*0.07,
                    width: width*0.2,
                    decoration: BoxDecoration(
                        color: Colour.lightgreen,
                        borderRadius: BorderRadius.circular(width*0.07)
                    ),
                    child: Center(
                      child: SvgPicture.asset(ImageIcons.chat)
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      day.add(
                          {
                        "day":size[selectIndex]["day"],
                        "name":size[selectIndex]["name"],
                        "date":size[selectIndex]["date"],
                        "time":time[selectIndex1]["time"],
        
        
                       });
        
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPage(),));
                    },
                    child: Container(
                      height: height*0.07,
                      width: width*0.6,
                      decoration: BoxDecoration(
                          color: Colour.primarycolour,
                          borderRadius: BorderRadius.circular(width*0.07)
                      ),
                      child: Center(
                        child: Text("Book Apointment",
                          style: TextStyle(
                              fontSize: width*0.043,
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
