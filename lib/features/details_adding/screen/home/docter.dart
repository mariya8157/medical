import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../colour.dart';
import '../../../../icons.dart';
import '../../../../main.dart';

class DocterPage extends StatefulWidget {
  const DocterPage({super.key});

  @override
  State<DocterPage> createState() => _DocterPageState();
}

class _DocterPageState extends State<DocterPage> {
  List doctor=[
    {
      "image":ImageIcons.doc5,
      "name":"Dr. Annie jose",
      "spl":"Chardiologist",
      "star":"4,7",
      "distene":"800m away",

    },
    {
      "image":ImageIcons.doc6,
      "name":"Dr.Melvin",
      "spl":"Gynecologist",
      "star":"4,7",
      "distene":"500m away",

    },
    {
      "image":ImageIcons.doc7,
      "name":"Dr. Andrews",
      "spl":"dermatologist",
      "star":"4,8",
      "distene":"900m away",

    }
    ,{
      "image":ImageIcons.doc8,
      "name":"Dr. marry",
      "spl":"General medicine",
      "star":"4,7",
      "distene":"800m away",

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
              // Container(
              //   height: width*0.60,
              //   width: width*1,
              //   // margin: EdgeInsets.only(left: width*0.03),
              //   child: ListView.separated(
              //       physics: BouncingScrollPhysics(),
              //       scrollDirection: Axis.horizontal,
              //       shrinkWrap: true,
              //       itemBuilder: (context, index) {
                      // return Container(
                      //   height: width*0.25,
                      //   width: width*0.47,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(width*0.04),
                      //       border: Border.all(
                      //           color: Colour.color2
                      //       )
                      //   ),
                      //   child: Padding(
                      //     padding: EdgeInsets.all(8.0),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //       children: [
                      //         CircleAvatar(
                      //           radius: width*0.1,
                      //           backgroundImage: AssetImage(doctor[index]["image"]),
                      //         ),
                      //         Row(
                      //           children: [
                      //             Text(doctor[index]["name"],style: TextStyle(
                      //                 fontWeight: FontWeight.w600
                      //             ),),
                      //           ],
                      //         ),
                      //         Row(
                      //           children: [
                      //             Text(doctor[index]["spl"],style: TextStyle(
                      //                 color: Colour.gray
                      //             ),),
                      //           ],
                      //         ),
                      //         Row(
                      //           children: [
                      //             Container(
                      //               height: width*0.065,
                      //               width: width*0.12,
                      //               decoration: BoxDecoration(
                      //                   borderRadius: BorderRadius.circular(width*0.03),
                      //                   color: Colour.lightgreen
                      //
                      //               ),
                      //               child: Row(
                      //                 mainAxisAlignment: MainAxisAlignment.center,
                      //                 children: [
                      //                   SvgPicture.asset(ImageIcons.star),
                      //                   Text(doctor[index]["star"],style: TextStyle(
                      //                       color: Colour.primarycolour
                      //                   ),),
                      //                 ],
                      //               ),
                      //             ),
                      //
                      //             // SizedBox(width: width*0.02,),
                      //             SvgPicture.asset(ImageIcons.location,color: Colors.grey,),
                      //             Text(doctor[index]["distene"],style: TextStyle(
                      //                 color: Colors.grey
                      //             ),)
                      //           ],
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // );
                    // },
                    // separatorBuilder:(context, index) {
                    //   return SizedBox(width: width*0.03,);
                    // },
                    // itemCount: doctor.length),
              // ),
              Container(
                width: width*1,
                height: height*1,
                child: GridView.builder(
                  itemCount:doctor.length,
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
                              backgroundImage: AssetImage(doctor[index]["image"]),
                            ),
                            Row(
                              children: [
                                Text(doctor[index]["name"],style: TextStyle(
                                    fontWeight: FontWeight.w600
                                ),),
                              ],
                            ),
                            Row(
                              children: [
                                Text(doctor[index]["spl"],style: TextStyle(
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
                                      Text(doctor[index]["star"],style: TextStyle(
                                          color: Colour.primarycolour
                                      ),),
                                    ],
                                  ),
                                ),
          
                                // SizedBox(width: width*0.02,),
                                SvgPicture.asset(ImageIcons.location,color: Colors.grey,),
                                Text(doctor[index]["distene"],style: TextStyle(
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
