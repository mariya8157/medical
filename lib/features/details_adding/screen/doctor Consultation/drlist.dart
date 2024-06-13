import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../colour.dart';
import '../../../../icons.dart';
import '../../../../main.dart';
import '../../../../models/doctormodel.dart';
import '../../controller/addingcontroller_page.dart';

class DoctorList extends ConsumerStatefulWidget {
  final String name;
  const DoctorList({super.key,required this.name});

  @override
  ConsumerState<DoctorList> createState() => _TopDoctorPageState();
}

class _TopDoctorPageState extends ConsumerState<DoctorList> {
  // List drlist=[
  //   {
  //     "image":ImageIcons.drmarcus1,
  //     "name":"Dr. Marcus",
  //     "spl":"Chardiologist",
  //     "star":"4,7",
  //     "distene":"800m away",
  //
  //   },
  //   {
  //     "image":ImageIcons.drmaria1,
  //     "name":"Dr. Maria",
  //     "spl":"Gynecologist",
  //     "star":"4,7",
  //     "distene":"500m away",
  //
  //   },
  //   {
  //     "image":ImageIcons.drstevi1,
  //     "name":"Dr. Stevi",
  //     "spl":"dermatologist",
  //     "star":"4,8",
  //     "distene":"900m away",
  //
  //   },
  //   {
  //     "image":ImageIcons.drgerty,
  //     "name":"Dr. Gerty Cori",
  //     "spl":"Orthopedist",
  //     "star":"4,7",
  //     "distene":"800m away",
  //
  //   },
  //   {
  //     "image":ImageIcons.drdiandra,
  //     "name":"Dr. Diandra",
  //     "spl":"Orthopedist",
  //     "star":"4,7",
  //     "distene":"800m away",
  //
  //   },
  //
  //
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white24,
          // resizeToAvoidBottomInset: false,
          elevation: 0,
          surfaceTintColor: Colour.secondarycolour,
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
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection("doctors").where("spcl",isEqualTo:widget.name).snapshots().map((event){
            return event.docs.map((e){
             return DoctorModel.fromMap(e.data());
            }).toList();
          }),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Center(child: Text("No document found"));
            }
            List<DoctorModel> data=snapshot.data!;
            return Container(
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
                          children: [
                            SizedBox(width: width*0.03,),
                            Container(
                              height: width*0.5,
                              width: width*0.78,
            
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: width*0.35,
                                    height:height*0.17,
            
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: NetworkImage(data[index].image),fit: BoxFit.fill),
                                      // color: Colors.red,
                                      borderRadius: BorderRadius.circular(width*0.03),
            
                                    ),
            
            
                                  ),
                                  SizedBox(width: width*0.04,),
                                  Container(
                                    width: width*0.3,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
            
                                        Text(data[index].name.toString(),
                                          style: TextStyle(
                                              fontSize: width*0.05,
                                              fontWeight: FontWeight.w800,
                                              color:Colour.thirdcolour
                                          ),
            
                                        ),
                                        Text(data[index].spcl.toString(),
                                          style: TextStyle(
                                              color: Colour.gray,
                                              fontSize: width*0.04
                                          ),
            
                                        ),
            
                                        Container(
                                          width: width*0.25,
                                          height: height*0.05,
                                          child: Row(
                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              // SvgPicture.asset(ImageIcons.location,) ,
                                              Text(data[index].exp.toString(),
                                                style: TextStyle(
                                                  color: Colour.color1,
            
                                                ),)
                                            ],
                                          ),
                                        )
            
                                      ],
                                    ),
                                  ),
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
                    height: width*0.01,
                  );
                },
                itemCount:data.length
            ),
                  );
          }
        ),
            ],
        ),
      ),

    );
  }
}
