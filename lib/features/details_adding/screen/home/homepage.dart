import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical/features/details_adding/screen/home/ambulance.dart';
import 'package:medical/features/details_adding/screen/home/docter.dart';
import 'package:medical/features/details_adding/screen/home/hospital.dart';
import 'package:medical/features/details_adding/screen/home/topdoctor.dart';
import 'package:medical/features/details_adding/screen/onlinePharmacy/pharmacy.dart';
import 'package:pinput/pinput.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  // List items=[
  //   {"images":"ImageIcons.catogory1",
  //     "text":"Doctor"
  //   },
  //   {"images":"ImageIcons.Pharmacy",
  //     "text":"Pharmacy"
  //   },
  //   {"images":"ImageIcons.Hospital",
  //     "text":"Hospital"
  //   },
  //   {"images":"ImageIcons.Ambulance",
  //     "text":"Ambulance"
  //   }
  // ];
  int currentIndex=0;
  List pages=[
   ImageIcons.banner1,
   ImageIcons.banner2,
   ImageIcons.banner3,
    ImageIcons.CTA

  ];
  List doctor=[
    {
      "image":ImageIcons.drmarcus1,
      "name":"Dr. Marcus Horizon",
      "spl":"Chardiologist",
      "star":"4,7",
      "distene":"800m away",

    },
    {
      "image":ImageIcons.drmaria,
      "name":"Dr. Maria",
      "spl":"Gynecologist",
      "star":"4,7",
      "distene":"500m away",

    },
    {
      "image":ImageIcons.drstevi,
      "name":"Dr. Stevi",
      "spl":"dermatologist",
      "star":"4,8",
      "distene":"900m away",

    }
    ,{
      "image":ImageIcons.drluke,
      "name":"Dr. Luke",
      "spl":"General medicine",
      "star":"4,7",
      "distene":"800m away",

    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.all(width*0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Find your desire\nhealth solution",style: TextStyle(
                    fontSize: width*0.06,
                      fontWeight: FontWeight.w700
                  ),),
                  SvgPicture.asset(ImageIcons.bell,),
                ],
              ),

              // SizedBox(height: width*0.05,),
              Container(
                height: width*0.4,
                width: width*1,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: height*0.06,
                      width: width*0.88,
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
                    // SizedBox(height: width*0.05,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DocterPage(),));
                            },
                            child: Container(
                              height:height*0.06,
                              width: width*0.08,
                              child: SvgPicture.asset(ImageIcons.catogory1),
                            
                            ),
                          ),
                          // SizedBox(height: width*0.04,),
                          Text("Doctor",
                            style: TextStyle(
                                fontSize: width*0.03,
                              color: Colour.gray
                            ),)
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PharmacyPage(),));
                            },
                            child: Container(
                              height:height*0.06,
                              width: width*0.08,
                              child: SvgPicture.asset(ImageIcons.Pharmacy),
                            
                            ),
                          ),
                          // SizedBox(height: width*0.04,),
                          Text("Pharmacy",
                            style: TextStyle(
                                fontSize: width*0.03,
                                color: Colour.gray
                            ),)
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalPage(),));
                            },
                            child: Container(
                              height:height*0.06,
                              width: width*0.08,
                              child: SvgPicture.asset(ImageIcons.Hospital),

                            ),
                          ),
                          // SizedBox(height: width*0.04,),
                          Text("Hospital",
                            style: TextStyle(
                                fontSize: width*0.03,
                                color: Colour.gray
                            ),)
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AmbulancePage(),));
                            },
                            child: Container(
                              height:height*0.06,
                              width: width*0.08,
                              child: SvgPicture.asset(ImageIcons.Ambulance),

                            ),
                          ),
                          // SizedBox(height: width*0.04,),
                          Text("Ambulance",
                            style: TextStyle(
                                fontSize: width*0.03,
                                color: Colour.gray
                            ),)
                        ],
                      )
                    ],
                                ),
                  ],
                ),
              ),
              // SizedBox(height: width*0.04,),
              Container(
                height: width*0.7,
                width: width*1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CarouselSlider.builder(
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index, int realIndex) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: width*0.2,
                                width: width*1,
                                decoration: BoxDecoration(

                                  color:Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(pages[index]),fit: BoxFit.fill
                                  ),
                                )

                            ),
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 0.8,
                          autoPlayAnimationDuration: Duration(milliseconds: 200),
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex=index;
                            });
                          },
                        )),
                    SizedBox(height: width*0.02,),
                    AnimatedSmoothIndicator(
                        activeIndex: currentIndex,
                        count: pages.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Colour.primarycolour,
                          dotColor: Colour.gray,
                          dotHeight: width*0.02,
                          dotWidth: width*0.02,
                        )),
                    // Container(
                    //   height: width*0.4,
                    //   width: width*0.9,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(width*0.04),
                    //     image: DecorationImage(
                    //         image: AssetImage(ImageIcons.CTA),fit: BoxFit.fill)
                    //   ),
                    // ),
                    // SizedBox(height: width*0.04,),
                    Container(
                      width: width*0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text("Top Doctor",style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: width*0.04
                          ),),
                           // SizedBox(width: width*0.05,),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => TopDoctorPage(),));
                            },
                            child: Text("See all",style: TextStyle(
                                fontSize: width*0.03,
                              color: Colour.primarycolour
                            ),),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: width*0.55,
                width: width*1,
                // margin: EdgeInsets.only(left: width*0.03),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                       height: width*0.25,
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
                    separatorBuilder:(context, index) {
                      return SizedBox(width: width*0.03,);
                    },
                    itemCount: doctor.length),
              )
          
          
            ],
          ),
        ),
        
      ),
    );
  }
}
