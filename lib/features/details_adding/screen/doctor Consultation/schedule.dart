import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical/colour.dart';
import 'package:medical/features/details_adding/controller/addingcontroller_page.dart';
import 'package:medical/features/details_adding/screen/doctor%20Consultation/bookingdoctor.dart';
import 'package:medical/icons.dart';
import 'package:medical/models/doctormodel.dart';

import '../../../../main.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {


  @override
  Widget build(BuildContext context) {
    return       DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Schedule",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: width*0.06
            ),),
        ),
        body: Column(
          children: [
            Container(
              height: width*0.15,
              width: width*1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width*0.03),
                color:Colour.lightgreen,
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                  indicator:  BoxDecoration(
                      color: Colour.primarycolour,
                      borderRadius: BorderRadius.circular(width*0.03),
                      border: Border.all(color: Colour.primarycolour)
                  ),
                  labelColor: Colour.secondarycolour,
                  unselectedLabelColor: Colour.thirdcolour,
                  tabs: [
                    Tab(
                      text: "Schedule",
                    ),
                    Tab(
                      text: "Orders",
                    ),

                  ]
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(width*0.03),
                    child: Container(
                      width: width*1,

                      // ****stream builder //*********


                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance.collection("schedule").where("id",isEqualTo: currentModel?.id).snapshots(),
                          builder: (context, snapshot) {
                            if(!snapshot.hasData){
                              return Center(child: Text("No document found"));
                            }
                            var data=snapshot.data!.docs;
                            return data.length==0?
                            Center(child: Text("No document found")) :


                            ListView.separated(
                              itemCount:data.length,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder:(context,  index) {
                                return InkWell(
                                  onTap: () {
                                  },
                                  child: Container(
                                      height: height*0.25,
                                      width: width*1,
                                      decoration: BoxDecoration(color:Colour.secondarycolour,
                                          border: Border.all(color: Colour.lightgreen),
                                          borderRadius: BorderRadius.circular(width*0.04)
                                      ),
                                      child:
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Container(
                                                height: width*0.15,
                                                width: width*0.55,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text("${data[index]["name"].toString()}",
                                                            style: TextStyle(
                                                                fontSize: width*0.05,
                                                                fontWeight: FontWeight.w700)),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("${data[index]["spcl"].toString()}",
                                                            style: TextStyle(
                                                                fontSize: width*0.04,
                                                                fontWeight: FontWeight.w700)),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              CircleAvatar(
                                                radius: width*0.08,
                                                backgroundImage: NetworkImage(data[index]["image"]),
                                              )
                                            ],
                                          ),
                                          Container(
                                            width: width*0.8,
                                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SvgPicture.asset(ImageIcons.calendar),
                                                Text("${data[index]["date"].substring(0,10)}",
                                                    style: TextStyle(
                                                        fontSize: width*0.04
                                                    )),
                                                SvgPicture.asset(ImageIcons.time),
                                                Text("${data[index]["time"].toString()}",
                                                    style: TextStyle(
                                                        fontSize: width*0.04
                                                    )),
                                                Text("*",
                                                    style: TextStyle(
                                                        fontSize: width*0.04,
                                                      color: Colour.primarycolour
                                                    )),
                                                Text("Confirmed",
                                                    style: TextStyle(
                                                        fontSize: width*0.04
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: width*0.8,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    String id=data[index].id.toString();
                                                    FirebaseFirestore.instance.collection("schedule").doc(id).delete();
                                                  },
                                                  child: Container(
                                                    width: width*0.37,
                                                    height: height*0.06,
                                                    decoration: BoxDecoration(color:Colour.lightgreen,
                                                        borderRadius: BorderRadius.circular(width*0.03)
                                                    ),
                                                    child: Center(child: Text("Cancel",style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: width*0.04,
                                                      color: Colour.thirdcolour
                                                    ),
                                                    )),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>BookingPage(time:DoctorModel.fromMap(data[index].data()) ,)));
                                                  },
                                                  child: Container(
                                                    width: width*0.37,
                                                    height: height*0.06,
                                                    decoration: BoxDecoration(color:Colour.primarycolour,
                                                        borderRadius: BorderRadius.circular(width*0.03)
                                                    ),
                                                    child: Center(child: Text("Reschedule",style: TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: width*0.04,
                                                        color: Colour.secondarycolour
                                                    ),
                                                    )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )

                                  ),
                                );

                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: height*0.01,);

                              },
                            );
                          }
                      ),
                    ),
                  ),

                  Container(
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
