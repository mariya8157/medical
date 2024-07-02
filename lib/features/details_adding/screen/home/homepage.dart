import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical/features/details_adding/screen/home/ambulance.dart';
import 'package:medical/features/details_adding/screen/home/docter.dart';
import 'package:medical/features/details_adding/screen/home/topdoctor.dart';
import 'package:pinput/pinput.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';

import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../core/constants/images.dart';
import '../../../../main.dart';
import '../../controller/doctor_controller.dart';
import '../../controller/user_controller.dart';
import '../doctor_consultation/findDoctor.dart';
import '../online_pharmacy/pharmacy.dart';
// import '../../controller/addingcontroller_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  TextEditingController search_controller=TextEditingController();

  int currentIndex=0;
  List pages=[
    ImagePictures.banner1,
    ImagePictures.banner2,
    ImagePictures.banner3,
    ImagePictures.CTA

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
                children: [
                  SizedBox(height: height*0.15,),
                  Text("Find your desire\nhealth solution",style: TextStyle(
                    fontSize: width*0.06,
                      fontWeight: FontWeight.w700,
                    color: Colour.thirdcolour,

                  ),),
                ],
              ),

              // SizedBox(height: width*0.05,),
              Column(
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FindDoctor(),));
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FindDoctor(),));
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
              ref.watch(StreamDocProvider(search_controller.text)).when(data: (data) => Container(
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
                                backgroundImage: NetworkImage(data[index].image),
                              ),
                              Row(
                                children: [
                                  Text(data[index].name.toString(),style: TextStyle(
                                    fontWeight: FontWeight.w600
                                  ),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(data[index].spcl.toString(),style: TextStyle(
                                    color: Colour.gray
                                  ),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(data[index].exp.toString(),style: TextStyle(
                                    color: Colour.gray
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
                    itemCount: data.length),
              ), error: (Object error, StackTrace stackTrace) {  return ScaffoldMessenger(
                  child: Center(child: Text(error.toString())));
              },
                loading: () {
                  return Center(child: CircularProgressIndicator());}
              ),
            ],
          ),
        ),
        
      ),
    );
  }
}
