import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../main.dart';
import '../../../../models/doctor_model.dart';
import '../../controller/user_controller.dart';

class DoctorList extends ConsumerStatefulWidget {
  final String name;
  const DoctorList({super.key,required this.name});

  @override
  ConsumerState<DoctorList> createState() => _TopDoctorPageState();
}

class _TopDoctorPageState extends ConsumerState<DoctorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
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
                color: Colour.thirdcolour,
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
                                           children: [
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
                    );
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
