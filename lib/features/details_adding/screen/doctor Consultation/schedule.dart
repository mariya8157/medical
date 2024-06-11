import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical/colour.dart';
import 'package:medical/features/details_adding/controller/addingcontroller_page.dart';
import 'package:medical/features/details_adding/screen/doctor%20Consultation/bookingdoctor.dart';
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
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
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
                                      height: height*0.2,
                                      width: width*1,
                                      decoration: BoxDecoration(color:Colour.secondarycolour,
                                          border: Border.all(color: Colour.lightgreen),
                                          borderRadius: BorderRadius.circular(width*0.04)
                                      ),
                                      child:
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text("${data[index]["name"].toString()}",
                                                  style: TextStyle(
                                                      fontSize: width*0.05,
                                                      fontWeight: FontWeight.w700)),
                                              Text("${data[index]["spcl"].toString()}",
                                                  style: TextStyle(
                                                      fontSize: width*0.04,
                                                      fontWeight: FontWeight.w700)),
                                           Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               Text("${data[index]["date"].substring(0,10)}",
                                                   style: TextStyle(
                                                       fontSize: width*0.03
                                                   )),
                                               Text("${data[index]["time"].toString()}",
                                                   style: TextStyle(
                                                       fontSize: width*0.03
                                                   )),
                                               Text("Confirmed",
                                                   style: TextStyle(
                                                       fontSize: width*0.03
                                                   )),
                                             ],
                                           ),
                                              Row(
                                                children: [
                                                  ElevatedButton(onPressed: () {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>BookingPage(time:DoctorModel.fromMap(data[index].data()) ,)));




                                                  }, child:
                                                  Icon(CupertinoIcons.pen),
                                ),


                                                  ElevatedButton(onPressed: () {
                                                    String id=data[index].id.toString();
                                                    FirebaseFirestore.instance.collection("schedule").doc(id).delete();
                                                    // Navigator.pop(context);


                                                  }, child: Icon(CupertinoIcons.delete))
                                                ],
                                              )

                                            ],
                                          ),
                                          CircleAvatar(
                                            radius: width*0.1,
                                            backgroundImage: NetworkImage(data[index]["image"]),
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
