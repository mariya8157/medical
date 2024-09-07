import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical/features/details_adding/controller/user_controller.dart';
import 'package:medical/features/details_adding/screen/home/bottomnavigation.dart';
import 'package:medical/features/details_adding/screen/login_signup/login.dart';
import 'package:medical/models/doctor_model.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../main.dart';
import '../../../../models/user_model.dart';
import '../../controller/doctor_controller.dart';
import 'doctordetails.dart';
import 'drlist.dart';


class FindDoctor extends ConsumerStatefulWidget {

  const FindDoctor( {super.key});

  @override
  ConsumerState createState() => _FindDoctorState();
}

class _FindDoctorState extends ConsumerState<FindDoctor> {
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
  int selectIndex=0;
  List a=[];

  @override
  void initState() {
    // TODO: implement initState
    print(currentModel);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationPage(),));
          },
          child: SizedBox(
            height: width * 0.05,
            width: width * 0.8,
            child: Padding(
              padding: EdgeInsets.only(left: width*0.023),
              child: Padding(
                padding:  EdgeInsets.all(width*0.007),
                child: SvgPicture.asset(
                  ImageIcons.back,),
              ),
            ),
          ),
        ),
        title:  GestureDetector(
          onTap: () async {
           var data = await FirebaseFirestore.instance.collection('doctors').get();

           for(var docs in data.docs){
             DoctorModel doc = DoctorModel.fromMap(docs.data());
             FirebaseFirestore.instance.collection('doctors').doc(doc.id).update(
               {
                 'search': setSearchParam(doc.name + ' '+ doc.spcl)
               }
             );
           }

          },
          child: Text(
            "Find Doctors",
            style: TextStyle(
                color: Colour.thirdcolour,
                fontWeight: FontWeight.w700,
                fontSize: width*0.04
            ),
          ),
        ),
      ),

      body:Padding(
        padding:  EdgeInsets.all(width*0.03),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: width*1,
            height: height*1,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height*0.06,
                  width: width*0.9,
                  decoration: BoxDecoration(
                      color: Colour.color3,
                      borderRadius: BorderRadius.circular(width*0.07)
                  ),
                  child: TextFormField(
                    controller:searchController ,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.search,
                    style: TextStyle(fontSize: width*0.04,fontWeight: FontWeight.w500,color: Colour.thirdcolour),
                    decoration: InputDecoration(
                        prefixIcon:Padding(
                          padding:  EdgeInsets.all(width*0.03),
                          child: SvgPicture.asset(ImageIcons.search),
                        ),
                        labelText: "Find Doctor",
                        labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.04, color: Colour.color1),
                        hintText: "search doctors here",
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
                Row(
                  children: [
                    Text("Category",
                      style: TextStyle(
                          fontSize: width*0.04,
                          fontWeight: FontWeight.w700,
                          color:Colour.thirdcolour
                      ),
                    ),
                  ],
                ),
                Container(
                  width: width*1,
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
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>DoctorList(name: category[index]["text"],) ,));
                          },
                          child: Container(
                            width: width*0.25,
                            height: width*0.15,
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
                          ),
                        );
                    },
                  ),
                ),
              ref.watch(StreamDocProvider(searchController.text)).when(data: (data) =>    Column(
                  children: [
                    Row(
                      children: [
                        Text("Recommended Doctors",
                          style: TextStyle(
                              fontSize: width*0.04,
                              fontWeight: FontWeight.w700,
                              color:Colour.thirdcolour
                          ),
                        ),
                      ],
                    ),
                data.isEmpty ? Text('No doctor found') : InkWell(
                      onTap: () {
                        DoctorModel doctorData= DoctorModel(
                          search: data[selectIndex].search??[] ,
                            name: data[selectIndex].name.toString(),
                            cons: data[selectIndex].cons,
                            admin: data[selectIndex].admin,
                            dis: data[selectIndex].dis,
                            image: data[selectIndex].image,
                            spcl: data[selectIndex].spcl.toString(),
                            exp: data[selectIndex].exp.toString(),
                            userId: userId!,
                            id:"",
                            time: '',
                            date: '',
                          // userId: '',
                            );
                        print(userId);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DoctordetailsPage(dr:doctorData,),));
                      },
                      child: Container(
                        height: height*0.2,
                        width: width*1,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colour.lightgreen),
                            borderRadius: BorderRadius.circular(width*0.04)
                        ),
                        child: ListView.separated(
                            shrinkWrap: true,
                            // physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return
                                Padding(
                                  padding:  EdgeInsets.all(width*0.03),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                        radius: width*0.13,
                                        backgroundImage:NetworkImage(data[selectIndex].image) ,
                                      ),
                                      Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(data[selectIndex].name.toString(),
                                            style: TextStyle(
                                                fontSize: width*0.04,
                                                fontWeight: FontWeight.w700,
                                                color:Colour.thirdcolour
                                            ),
                                          ),
                                          Text(data[selectIndex].spcl.toString(),
                                            style: TextStyle(
                                                color: Colour.color1,
                                                fontSize: width*0.04
                                            ),
                                          ),
                                          Divider(
                                            // color:Colour.gray.withOpacity(0.2),
                                            color: Colour.primarycolour,
                                            thickness: width*0.003,
                                            indent: width*0.05,
                                            endIndent: width*0.05,
                                          ),
                                          Text(data[selectIndex].exp.toString(),style: TextStyle(
                                              color: Colour.primarycolour,
                                              fontSize: width*0.04
                                          ),)
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
                            itemCount: 1
                        ),
                      ),
                    ),
                    Divider(
                      color:Colour.gray.withOpacity(0.2),
                      thickness: width*0.003,
                      indent: width*0.05,
                      endIndent: width*0.05,
                    ),
                    Row(
                      children: [
                        Text("Your Recent Doctors",
                          style: TextStyle(
                              fontSize: width*0.04,
                              fontWeight: FontWeight.w700,
                              color:Colour.thirdcolour
                          ),
                        ),
                      ],
                    ),
                    Container(
                     height: height*0.17,
                     width: width*1,
                     child: ListView.separated(
                       // shrinkWrap: true,
                         scrollDirection: Axis.horizontal,
                         // physics: BouncingScrollPhysics(),
                         itemBuilder: (context, index) {
                           return InkWell(
                             onTap: () {
                               selectIndex=index;
                               setState(() {

                               });
                             },
                             child: Container(
                               child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 children: [
                                   CircleAvatar(
                                     radius: width*0.10,
                                     backgroundImage:NetworkImage(data[index].image) ,
                                   ),
                                   Text(data[index].name.toString()),
                                 ],
                               ),
                             ),
                           );
                         },
                         separatorBuilder: (context, index) {
                           return SizedBox(
                             width: width*0.03,
                           );
                         },
                         itemCount: data.length
                     ),),
                  ],
                ),
            error: (error, stackTrace) {
                 return ScaffoldMessenger(
                     child: Center(child: Text(error.toString())));
               },
                 loading: () {
                   return Center(child: CircularProgressIndicator());
                 },)],
            ),
          ),
        ),
      ),
    );
  }
}

setSearchParam(String caseNumber) {
  List<String> caseSearchList = [];
  String temp = "";

  List<String> nameSplits = caseNumber.split(" ");
  for (int i = 0; i < nameSplits.length; i++) {
    String name = "";
    for (int k = i; k < nameSplits.length; k++) {
      name = i==nameSplits.length-1 ? name + nameSplits[k] : name + nameSplits[k] + " ";
    }
    temp = "";

    for (int j = 0; j < name.length; j++) {
      temp = temp + name[j];
      caseSearchList.add(temp.toUpperCase());
    }
  }
  return caseSearchList;
}