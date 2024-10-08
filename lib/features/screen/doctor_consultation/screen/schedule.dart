import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical/core/constants/colour.dart';
import 'package:medical/core/constants/icons.dart';
import 'package:medical/models/doctor_model.dart';
import '../../../../../main.dart';
import '../../login_signup/screen/login.dart';
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
          title: Text(
            "Bookings",
            style: TextStyle(
                color: Colour.thirdcolour,
                fontWeight: FontWeight.w700,
                fontSize: width * 0.05),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(width * 0.03),
          child: Column(
            children: [
              Container(
                height: width * 0.15,
                width: width * 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.03),
                  color: Colour.lightgreen,
                ),
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        color: Colour.primarycolour,
                        borderRadius: BorderRadius.circular(width * 0.03),
                        border: Border.all(color: Colour.primarycolour)),
                    labelColor: Colour.secondarycolour,
                    unselectedLabelColor: Colour.thirdcolour,
                    tabs: [
                      Tab(
                        child: Text(
                          "Schedule",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Orders",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ]),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(width * 0.03),
                      child: SizedBox(
                        width: width * 1,
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("schedule")
                                .where("userId", isEqualTo: userId!)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(child: Text("Loading..."));
                              }
                              var data = snapshot.data!.docs;
                              return data.length == 0
                                  ? const Center(
                                      child: Text("No document found"))
                                  : ListView.separated(
                                      itemCount: data.length,
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: height * 0.25,
                                            width: width * 1,
                                            decoration: BoxDecoration(
                                                color: Colour.secondarycolour,
                                                border: Border.all(
                                                    color: Colour.lightgreen),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        width * 0.04)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: width * 0.15,
                                                      width: width * 0.55,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                  "${data[index]["name"].toString()}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700)),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                  "${data[index]["spcl"].toString()}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700)),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    CircleAvatar(
                                                      radius: width * 0.08,
                                                      backgroundImage:
                                                          NetworkImage(
                                                              data[index]
                                                                  ["image"]),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: width * 0.8,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Icon(Icons.calendar_month),
                                                      Text(
                                                          "${data[index]["date"].substring(0, 10)}",
                                                          style: TextStyle(
                                                              fontSize: width *
                                                                  0.037)),
                                                      SvgPicture.asset(
                                                          ImageIcons.time),
                                                      Text(
                                                          "${data[index]["time"].toString()}",
                                                          style: TextStyle(
                                                              fontSize: width *
                                                                  0.037)),
                                                      Text("*",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  width * 0.037,
                                                              color: Colour
                                                                  .primarycolour)),
                                                      Text("Confirmed",
                                                          style: TextStyle(
                                                              fontSize: width *
                                                                  0.037)),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.8,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          showDialog(
                                                            context: context,
                                                            barrierDismissible:
                                                                false,
                                                            builder: (context) {
                                                              return AlertDialog(
                                                                content:
                                                                SizedBox(
                                                                  height:
                                                                      height *
                                                                          0.18,
                                                                  width: width *
                                                                      0.5,
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      SizedBox(
                                                                          child:
                                                                              Column(
                                                                        children: [
                                                                          Text(
                                                                            "Are you sure You want to",
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: width * 0.04,
                                                                                color: Colour.thirdcolour),
                                                                          ),
                                                                          Text(
                                                                            "Cancel this Appointment?",
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: width * 0.04,
                                                                                color: Colour.thirdcolour),
                                                                          ),
                                                                        ],
                                                                      )),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              String id = data[index].id.toString();
                                                                              FirebaseFirestore.instance.collection("schedule").doc(id).delete();
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: height * 0.05,
                                                                              width: width * 0.26,
                                                                              decoration: BoxDecoration(color: Colour.primarycolour, borderRadius: BorderRadius.circular(width * 0.03)),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  "Cancel",
                                                                                  style: TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.w600, color: Colour.secondarycolour),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: height * 0.05,
                                                                              width: width * 0.26,
                                                                              decoration: BoxDecoration(color: Colour.primarycolour, borderRadius: BorderRadius.circular(width * 0.03)),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  "No",
                                                                                  style: TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.w600, color: Colour.secondarycolour),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                          width: width * 0.37,
                                                          height: height * 0.06,
                                                          decoration: BoxDecoration(
                                                              color: Colour
                                                                  .lightgreen,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          width *
                                                                              0.03)),
                                                          child: Center(
                                                              child: Text(
                                                            "Cancel",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    width *
                                                                        0.04,
                                                                color: Colour
                                                                    .thirdcolour),
                                                          )),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      DoctordetailsPage(
                                                                          dr: DoctorModel.fromMap(
                                                                              data[index].data()))));
                                                        },
                                                        child: Container(
                                                          width: width * 0.37,
                                                          height: height * 0.06,
                                                          decoration: BoxDecoration(
                                                              color: Colour
                                                                  .primarycolour,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          width *
                                                                              0.03)),
                                                          child: Center(
                                                              child: Text(
                                                            "Reschedule",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    width *
                                                                        0.04,
                                                                color: Colour
                                                                    .secondarycolour),
                                                          )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: height * 0.01,
                                        );
                                      },
                                    );
                            }),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(width * 0.03),
                      child: SizedBox(
                          child: StreamBuilder<
                              QuerySnapshot<Map<String, dynamic>>>(
                        stream: FirebaseFirestore.instance
                            .collection("address")
                            .where("userId", isEqualTo: userId!)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: Text("Loading..."));
                          } else {
                            Text("No Products are Ordered yet");
                          }
                          var data = currentModel!.cart;
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    height: width * 0.35,
                                    width: width * 0.95,
                                    decoration: BoxDecoration(
                                        color: Colour.secondarycolour,
                                        border: Border.all(
                                            width: width * 0.005,
                                            color: Colour.lightgreen),
                                        borderRadius: BorderRadius.circular(
                                            width * 0.04)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                            height: width * 0.2,
                                            width: width * 0.27,
                                            child: Image(
                                                image: NetworkImage(data[index]
                                                        ['image']
                                                    .toString()))),
                                        SizedBox(
                                          height: width * 0.27,
                                          width: width * 0.55,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                height: height * 0.11,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      data[index]['name'],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize:
                                                              width * 0.045),
                                                    ),
                                                    Text(
                                                      data[index]['ml']
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * 0.04,
                                                          color: Colour.gray),
                                                    ),
                                                    Text(
                                                      "${data[index]['qty'].toString()} Items",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize:
                                                              width * 0.04,
                                                          color: Colour
                                                              .thirdcolour),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: width * 0.23,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                        onTap: () {},
                                                        child: SvgPicture.asset(
                                                            ImageIcons.delete)),
                                                    Text(
                                                      "\$${(data[index]['qty'] * data[index]['rate']).toStringAsFixed(2)}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize:
                                                              width * 0.04),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // SizedBox(height: width*0.03,),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: width * 0.05,
                              );
                            },
                          );
                        },
                      )),
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
