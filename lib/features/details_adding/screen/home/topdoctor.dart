import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../colour.dart';
import '../../../../icons.dart';
import '../../../../main.dart';

class TopDoctorPage extends StatefulWidget {
  const TopDoctorPage({super.key});

  @override
  State<TopDoctorPage> createState() => _TopDoctorPageState();
}

class _TopDoctorPageState extends State<TopDoctorPage> {
  List drlist=[
    {
      "image":ImageIcons.drmarcus1,
      "name":"Dr. Marcus",
      "spl":"Chardiologist",
      "star":"4,7",
      "distene":"800m away",

    },
    {
      "image":ImageIcons.drmaria1,
      "name":"Dr. Maria",
      "spl":"Gynecologist",
      "star":"4,7",
      "distene":"500m away",

    },
    {
      "image":ImageIcons.drstevi1,
      "name":"Dr. Stevi",
      "spl":"dermatologist",
      "star":"4,8",
      "distene":"900m away",

    },
    {
      "image":ImageIcons.drgerty,
      "name":"Dr. Gerty Cori",
      "spl":"Orthopedist",
      "star":"4,7",
      "distene":"800m away",

    },
    {
      "image":ImageIcons.drdiandra,
      "name":"Dr. Diandra",
      "spl":"Orthopedist",
      "star":"4,7",
      "distene":"800m away",

    },


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
            "Top Doctor",
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
            ],),]
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ListView.separated(
                  shrinkWrap: true,
                   physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return
                      Padding(
                        padding:  EdgeInsets.all(width*0.03),
                        child: Container(
                          height: width*0.4,
                          width: width*1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width*0.03),
                            border: Border.all(
                              color: Colour.color2
                            )
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [SizedBox(width: width*0.03,),
                              Container(
                                width: width*0.35,
                                height:height*0.17,

                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(drlist[index]['image']),fit: BoxFit.fill),
                                  // color: Colors.red,
                                  borderRadius: BorderRadius.circular(width*0.03),

                                ),


                              ),SizedBox(width: width*0.04,),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(drlist[index]["name"],
                                      style: TextStyle(
                                          fontSize: width*0.05,
                                          fontWeight: FontWeight.w800,
                                          color:Colour.thirdcolour
                                      ),

                                    ),
                                    Text(drlist[index]["spl"],
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
                                              Text(drlist[index]["star"],
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
                                          Text(drlist[index]["distene"],
                                            style: TextStyle(
                                              color: Colour.color1,

                                            ),)
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              )


                            ],
                          ),
                        ),
                      )
                    ;

                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: width*0.03,
                    );
                  },
                  itemCount:drlist.length
              ),
            ),
          ],
        ),
      ),

    );
  }
}
