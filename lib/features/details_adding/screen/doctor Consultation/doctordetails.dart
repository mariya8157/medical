import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../colour.dart';
import '../../../../icons.dart';
import '../../../../main.dart';

class DoctordetailsPage extends StatefulWidget {
  const DoctordetailsPage({super.key});

  @override
  State<DoctordetailsPage> createState() => _DoctordetailsPageState();
}

class _DoctordetailsPageState extends State<DoctordetailsPage> {
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
          "Find Doctors",
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
        padding:  EdgeInsets.all(width*0.03),
        child: Column(
          children: [
            ListView.separated(
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
                              // color: Colors.red,
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
                                    color: Colour.color1,
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
                                    SvgPicture.asset(ImageIcons.location,color: Colour.color1,) ,
                                    Text(doctor[index]["distene"],
                                    style: TextStyle(
                                      color: Colour.color1,

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
            Row(
              children: [
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n"
                    " sed do eiusmod tempor incididunt ut labore et dolore\n"
                    " magna aliqua. Ut enim ad minim veniam... Read more",
                  style: TextStyle(
                      fontSize: width*0.03,
                      fontWeight: FontWeight.w400,
                      color:Colour.color1
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
