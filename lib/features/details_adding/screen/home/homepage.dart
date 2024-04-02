import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../colour.dart';
import '../../../../icons.dart';
import '../../../../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search_controller=TextEditingController();
  List items=[
    {"images":"ImageIcons.catogory1",
      "text":"Doctor"
    },
    {"images":"ImageIcons.Pharmacy",
      "text":"Pharmacy"
    },
    {"images":"ImageIcons.Hospital",
      "text":"Hospital"
    },
    {"images":"ImageIcons.Ambulance",
      "text":"Ambulance"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find your desire\n health solution",style: TextStyle(
            fontWeight: FontWeight.w700
        ),),
        actions: [
          SvgPicture.asset(ImageIcons.bell,),
          SizedBox(width: width*0.03,)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: width*0.05,),
            Container(
              height: height*0.06,
              decoration: BoxDecoration(
                  color: Colour.color3,
                  borderRadius: BorderRadius.circular(width*0.07)
              ),
              child: TextFormField(
                controller:search_controller ,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.search,
                style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500,color: Colour.thirdcolour),
                decoration: InputDecoration(
                    prefixIcon:Padding(
                      padding:  EdgeInsets.all(width*0.03),
                      child: SvgPicture.asset(ImageIcons.search),
                    ),
                    labelText: "Search doctors,drugs,articles...",
                    labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.04, color: Colour.color1),
                    hintText: "please enter search ",
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
            SizedBox(height: width*0.05,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    height:height*0.06,
                    width: width*0.08,
                    child: SvgPicture.asset(ImageIcons.catogory1),

                  ),
                  SizedBox(height: width*0.04,),
                  Text("Doctor",
                    style: TextStyle(
                        fontSize: width*0.03,
                      color: Colour.gray
                    ),)
                ],
              ),
              Column(
                children: [
                  Container(
                    height:height*0.06,
                    width: width*0.08,
                    child: SvgPicture.asset(ImageIcons.Pharmacy),

                  ),SizedBox(height: width*0.04,),
                  Text("Pharmacy",
                    style: TextStyle(
                        fontSize: width*0.03,
                        color: Colour.gray
                    ),)
                ],
              ),
              Column(
                children: [
                  Container(
                    height:height*0.06,
                    width: width*0.08,
                    child: SvgPicture.asset(ImageIcons.Hospital),

                  ),SizedBox(height: width*0.04,),
                  Text("Hospital",
                    style: TextStyle(
                        fontSize: width*0.03,
                        color: Colour.gray
                    ),)
                ],
              ),
              Column(
                children: [
                  Container(
                    height:height*0.06,
                    width: width*0.08,
                    child: SvgPicture.asset(ImageIcons.Ambulance),

                  ),SizedBox(height: width*0.04,),
                  Text("Ambulance",
                    style: TextStyle(
                        fontSize: width*0.03,
                        color: Colour.gray
                    ),)
                ],
              )
            ],
          ),
            SizedBox(height: width*0.04,),
            Container(
              height: width*0.4,
              width: width*0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width*0.04),
                image: DecorationImage(
                    image: AssetImage(ImageIcons.CTA),fit: BoxFit.fill)
              ),
            ),SizedBox(height: width*0.04,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Text("Top Doctor",style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: width*0.04
                ),),
                 SizedBox(width: width*0.05,),
                Text("See all",style: TextStyle(
                    fontSize: width*0.03,
                  color: Colour.primarycolour
                ),)
              ],
            )


          ],
        ),
        
      ),
    );
  }
}
