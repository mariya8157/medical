import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/colour.dart';
import '../../../../core/icons.dart';
import '../../../../main.dart';

class DocterPage extends StatefulWidget {
  const DocterPage({super.key});

  @override
  State<DocterPage> createState() => _DocterPageState();
}

class _DocterPageState extends State<DocterPage> {
  List drlist=[
    {
      "image":ImageIcons.drmarcus1,
      "name":"Dr. Marcus",
      "spl":"Chardiologist",
      "star":"4,7",
      "distene":"800m away",
      "consultation":60.00,
      "Admin Fee":01.00,
      "Aditional Discount":00.00,

    },
    {
      "image":ImageIcons.drmaria1,
      "name":"Dr. Maria",
      "spl":"Gynecologist",
      "star":"4,7",
      "distene":"500m away",
      "consultation":70.00,
      "Admin Fee":1.00,
      "Aditional Discount":10.00,


    },
    {
      "image":ImageIcons.drstevi1,
      "name":"Dr. Stevi",
      "spl":"dermatologist",
      "star":"4,8",
      "distene":"900m away",
      "consultation":80.00,
      "Admin Fee":02.00,
      "Aditional Discount":00.00,

    }
    ,
    {
      "image":ImageIcons.drgerty,
      "name":"Dr. Gerty Cori",
      "spl":"Orthopedist",
      "star":"4,7",
      "distene":"800m away",
      "consultation":65.00,
      "Admin Fee":01.50,
      "Aditional Discount":00.00,

    },
    {
      "image":ImageIcons.drdiandra,
      "name":"Dr. Diandra",
      "spl":"Orthopedist",
      "star":"4,7",
      "distene":"800m away",
      "consultation":70.00,
      "Admin Fee":01.00,
      "Aditional Discount":01.00,

    }


  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                width: width*1,
                height: height*1,
                child: GridView.builder(
                  itemCount:drlist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // childAspectRatio: 1.9,
                    crossAxisSpacing:height*0.01,
                    mainAxisSpacing: width*0.02,
                    crossAxisCount: 2,
                  ),
          
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  // scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: width*0.3,
                      width: width*0.47,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width*0.04),
                          border: Border.all(
                              color: Colour.color2
                          )
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: width*0.1,
                              backgroundImage: AssetImage(drlist[index]["image"]),
                            ),
                            Row(
                              children: [
                                Text(drlist[index]["name"],style: TextStyle(
                                    fontWeight: FontWeight.w600
                                ),),
                              ],
                            ),
                            Row(
                              children: [
                                Text(drlist[index]["spl"],style: TextStyle(
                                    color: Colour.gray
                                ),),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: width*0.065,
                                  width: width*0.12,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(width*0.03),
                                      color: Colour.lightgreen
          
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(ImageIcons.star),
                                      Text(drlist[index]["star"],style: TextStyle(
                                          color: Colour.primarycolour
                                      ),),
                                    ],
                                  ),
                                ),
          
                                // SizedBox(width: width*0.02,),
                                SvgPicture.asset(ImageIcons.location,color: Colors.grey,),
                                Text(drlist[index]["distene"],style: TextStyle(
                                    color: Colors.grey
                                ),)
                              ],
                            )
                          ],
                        ),
                      ),
                    );
          
                  },
          
          
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
