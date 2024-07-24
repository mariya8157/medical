import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical/core/constants/colour.dart';
import 'package:medical/features/details_adding/controller/user_controller.dart';
import 'package:medical/core/constants/icons.dart';
import 'package:medical/features/details_adding/screen/login_signup/login.dart';
import 'package:medical/models/doctor_model.dart';
import '../../../../main.dart';
import 'doctordetails.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Schedule",
            style: TextStyle(
                color: Colour.thirdcolour,
                fontWeight: FontWeight.w700,
                fontSize: width*0.04
            ),),
        ),
        body: Padding(
          padding: EdgeInsets.all(width*0.03),
          child: Column(
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
                        child: Text("Schedule",style: TextStyle(
                          fontSize: width*0.04,fontWeight: FontWeight.w600
                        ),),
                      ),
                      Tab(
                        child: Text("Orders",style: TextStyle(
                            fontSize: width*0.04,fontWeight: FontWeight.w600
                        ),),
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
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance.collection("schedule").where("userId",isEqualTo: userId).snapshots(),
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
                                                                  fontSize: width*0.04,
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
                                                      showDialog(
                                                        context: context,
                                                        barrierDismissible: false,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            content: Container(
                                                              height: height*0.18,
                                                              width: width*0.5,
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                children: [
                                                                  Container(
                                                                      child: Column(
                                                                        children: [
                                                                          Text("Are you sure You want to",
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: width*0.04,
                                                                                color: Colour.thirdcolour),),
                                                                          Text("Cancel this Appointment?",
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: width*0.04,
                                                                                color: Colour.thirdcolour),),
                                                                        ],)),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap: ()  {
                                                                          String id=data[index].id.toString();
                                                                         FirebaseFirestore.instance.collection("schedule").doc(id).delete();
                                                                          Navigator.pop(context);
                                                                        },
                                                                        child: Container(
                                                                          height: height*0.05,
                                                                          width: width*0.26,
                                                                          decoration: BoxDecoration(
                                                                              color: Colour.primarycolour,
                                                                              borderRadius: BorderRadius.circular(width*0.03)
                                                                          ),
                                                                          child: Center(
                                                                            child: Text("Cancel",
                                                                              style: TextStyle(
                                                                                  fontSize: width*0.04,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  color: Colour.secondarycolour
                                                                              ),),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                        onTap: () {
                                                                          Navigator.pop(context);
                                                                        },
                                                                        child: Container(
                                                                          height: height*0.05,
                                                                          width: width*0.26,
                                                                          decoration: BoxDecoration(
                                                                              color: Colour.primarycolour,
                                                                              borderRadius: BorderRadius.circular(width*0.03)
                                                                          ),
                                                                          child: Center(
                                                                            child: Text("No",
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
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },);
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
                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctordetailsPage(dr: DoctorModel.fromMap(data[index].data()))));
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
      ),
    );

  }
}
