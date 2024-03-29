import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical/colour.dart';
import 'package:medical/icons.dart';

import '../../../../main.dart';


class FindDoctor extends StatefulWidget {
  const FindDoctor({super.key});

  @override
  State<FindDoctor> createState() => _FindDoctorState();
}

class _FindDoctorState extends State<FindDoctor> {
  TextEditingController searchController=TextEditingController();
  List category=[
    {
      "image":ImageIcons.catogory1,
      "text":"General",
    },
    {
      "image":ImageIcons.catogory2,
      "text":"Lungs Specialist",
    },
    {
      "image":ImageIcons.catogory3,
      "text":"Dentist",
    },
    {
      "image":ImageIcons.catogory9,
      "text":"Psychiatrist",
    },
    {
      "image":ImageIcons.catogory5,
      "text":"Covid-19",
    },
    {
      "image":ImageIcons.catogory6,
      "text":"Surgeon",
    },
    {
      "image":ImageIcons.catogory7,
      "text":"Cardiologist",
    },
  ];
  List doctor=[
    {
      "image":ImageIcons.drmarcus,
      "name":"Dr. Marcus Horizon",
      "spl":"Chardiologist",
       "star":"4,7",
    "distene":"800m away",

    }
  ];
  List drlist=[
    {
      "image":ImageIcons.drmarcus,
      "name":"Dr. Marcus",
    },
    {
      "image":ImageIcons.drmaria,
      "name":"Dr. Maria",
    },
    {
      "image":ImageIcons.drstevi,
      "name":"Dr. Stevi",
    }
    ,{
      "image":ImageIcons.drluke,
      "name":"Dr. Luke",
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

      body:Padding(
        padding:  EdgeInsets.all(width*0.03),
        child: Column(
          children: [
            Container(
              height: height*0.06,
              decoration: BoxDecoration(
                  color: Colour.color3,
                  borderRadius: BorderRadius.circular(width*0.07)
              ),
              child: TextFormField(
                controller:searchController ,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.search,
                style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500,color: Colour.thirdcolour),
                decoration: InputDecoration(
                    prefixIcon:Padding(
                      padding:  EdgeInsets.all(width*0.03),
                      child: SvgPicture.asset(ImageIcons.search),
                    ),
                    labelText: "Search any Product..",
                    labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.04, color: Colour.color1),
                    hintText: "please enter search product",
                    hintStyle: TextStyle(
                      fontSize: width*0.05,
                      fontWeight: FontWeight.w400,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colour.color2,

                        ),
                        borderRadius: BorderRadius.circular(
                            width*0.07)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width*0.07),
                        borderSide: BorderSide(
                          color: Colour.color2,

                        )
                    )
                ),
              ),
            ),
            SizedBox(height: width*0.03,),
            Row(
              children: [
                Text("Category",
                  style: TextStyle(
                      fontSize: width*0.05,
                      fontWeight: FontWeight.w800,
                      color:Colour.thirdcolour
                  ),
                ),
              ],
            ),
            SizedBox(height: width*0.03,),
            Expanded(
              child: GridView.builder(
                itemCount:category.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisSpacing:height*0.009,
                  mainAxisSpacing: width*0.03,
                  crossAxisCount: 4,
                ),

                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                // scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return
                    Container(
                      width: width*0.25,
                      height: width*0.25,
                      child: Column(
                        children: [

                          Container(
                            width: width*0.07,
                            height: height*0.05,
                              child: SvgPicture.asset(category[index]["image"],)
                          ),

                          Text(category[index]["text"],
                          style: TextStyle(
                            color: Colour.color1,
                            fontSize: width*0.03
                          ),
                          )
                        ],
                      ),
                    );

                },


              ),
            ),
            SizedBox(height: width*0.03,),
            Row(
              children: [
                Text("Recommended Doctors",
                  style: TextStyle(
                      fontSize: width*0.05,
                      fontWeight: FontWeight.w800,
                      color:Colour.thirdcolour
                  ),
                ),
              ],
            ),
            SizedBox(height: width*0.03,),


            Container(
              height: height*0.2,
              width: width*1,
              decoration: BoxDecoration(
                  border: Border.all(color: Colour.gray.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(width*0.04)
              ),
              child: ListView.separated(
                  shrinkWrap: true,
                  // physics: BouncingScrollPhysics(),

                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.all(width*0.03),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                              radius: width*0.13,
                              backgroundImage:AssetImage(doctor[index]['image']) ,
                              ),
                          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              Divider(color:Colour.gray.withOpacity(0.2),
                              ),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: width*0.15,
                                    height: height*0.05,
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

                                  Container(
                                    width: width*0.3,
                                    height: height*0.05,
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                       SvgPicture.asset(ImageIcons.location) ,
                                        Text(doctor[index]["distene"])
                                      ],
                                    ),
                                  )
                                ],
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
                  itemCount: doctor.length
              ),
            ),
            SizedBox(height: width*0.03,),
            Row(
              children: [
                Text("Your Recent Doctors",
                  style: TextStyle(
                      fontSize: width*0.05,
                      fontWeight: FontWeight.w800,
                      color:Colour.thirdcolour
                  ),
                ),
              ],
            ),
            SizedBox(height: width*0.03,),
            Container(
              height: height*0.17,
              width: width*1,
              child: ListView.separated(
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  // physics: BouncingScrollPhysics(),

                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            radius: width*0.10,
                            backgroundImage:AssetImage(drlist[index]['image']) ,
                          ),
                          Text(drlist[index]["name"]),


                        ],
                      ),

                    );

                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: width*0.03,
                    );
                  },
                  itemCount: drlist.length
              ),
            ),













          ],
        ),
      ),

    );
  }
}
