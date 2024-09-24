import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical/features/details_adding/screen/login_signup/login.dart';
import 'package:readmore/readmore.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../main.dart';
import '../../../../models/doctor_model.dart';
import 'bookingdoctor.dart';
import 'chatwithdoctor.dart';

class DoctordetailsPage extends StatefulWidget {
  final DoctorModel dr;

  const DoctordetailsPage({super.key, required this.dr});

  @override
  State<DoctordetailsPage> createState() => _DoctordetailsPageState();
}

class _DoctordetailsPageState extends State<DoctordetailsPage> {
  DateTime? date;

  // List doctor=[
  //   {
  //     "image":ImageIcons.drmarcus1,
  //     "name":"Dr. Marcus Horizon",
  //     "spl":"Chardiologist",
  //     "star":"4,7",
  //     "distene":"800m away",
  //
  //   }
  // ];
  // List size=[
  //   {
  //     "day":"Mon",
  //     "name":"Monday",
  //     "date":21,
  //   },
  //   {
  //     "day":"Tue",
  //     "name":"Monday",
  //     "date":22,
  //   },
  //   {
  //     "day":"Wed",
  //     "name":"Monday",
  //
  //     "date":23,
  //   },
  //   {
  //     "day":"Thu",
  //     "name":"Monday",
  //
  //     "date":24,
  //   } ,
  //   {
  //     "day":"Fri",
  //     "name":"Monday",
  //
  //     "date":25,
  //   },
  //   {
  //     "day":"Sat",
  //     "name":"Monday",
  //
  //     "date":27,
  //   }
  // ];
// int selectIndex=0;
  List time = [
    "09:00 AM",
    "10:00 AM",
    "11:00 AM",
    "01:00 PM",
    "02:00 PM",
    "03:00 PM",
    "04:00 PM",
    "07:00 PM",
    "08:00 PM",
  ];
  int selectIndex1 = 0;

// List day=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colour.secondarycolour,
        // resizeToAvoidBottomInset: false,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
            height: width * 0.05,
            width: width * 0.8,
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.023),
              child: Padding(
                padding: EdgeInsets.all(width * 0.007),
                child: SvgPicture.asset(
                  ImageIcons.back,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          "Doctor Detail",
          style: TextStyle(
              color: Colour.thirdcolour,
              fontWeight: FontWeight.w700,
              fontSize: width * 0.04),
        ),
        surfaceTintColor: Colour.thirdcolour,
      ),
      body: Padding(
        padding: EdgeInsets.all(width * 0.03),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ListView.separated(
                  shrinkWrap: true,
                  // physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: width * 0.3,
                            height: height * 0.15,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(widget.dr.image)),
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(width * 0.03),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.dr.name,
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w800,
                                    color: Colour.thirdcolour),
                              ),
                              Text(
                                widget.dr.spcl,
                                style: TextStyle(
                                    color: Colour.gray, fontSize: width * 0.04),
                              ),
                              Text(
                                widget.dr.exp,
                                style: TextStyle(
                                    color: Colour.primarycolour,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: height * 0.03,
                    );
                  },
                  itemCount: 1),
              SizedBox(
                height: width * 0.03,
              ),
              Row(
                children: [
                  Text(
                    "About",
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w700,
                        color: Colour.thirdcolour),
                  ),
                ],
              ),
              SizedBox(
                height: width * 0.03,
              ),
              ReadMoreText(
                "Lorem ipsum dolor sit amet, consectetur adipiscing\n"
                "elit, sed do eiusmod tempor incididunt ut labore et\n"
                "dolore magna aliqua. Ut enim ad minim veniam Lorem\n"
                "Ipsum dolor sit amet, consectetur adipiscing elit,\n"
                "sed do eiusmod tempor incididunt ut labore eteno\n",
                trimLines: 3,
                colorClickableText: Colour.color4,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'read more',
                style: TextStyle(
                    fontSize: width * 0.033,
                    fontWeight: FontWeight.w400,
                    color: Colour.gray),
                trimExpandedText: 'less',
                lessStyle: TextStyle(
                    fontSize: width * 0.03,
                    fontWeight: FontWeight.bold,
                    color: Colour.primarycolour),
                moreStyle: TextStyle(
                    fontSize: width * 0.03,
                    fontWeight: FontWeight.bold,
                    color: Colour.primarycolour),
              ),
              SizedBox(
                height: width * 0.03,
              ),
              EasyInfiniteDateTimeLine(
                firstDate: DateTime.now(),
                lastDate: DateTime(DateTime.now().year,
                    DateTime.now().month + 1, DateTime.daysPerWeek),
                focusDate: date ?? DateTime.now(),

                onDateChange: (selectedDate) {
                  date = selectedDate;
                  print(date);
                  setState(() {});
                },
                // headerProps:  EasyHeaderProps(
                //   monthPickerType: MonthPickerType.switcher,
                //   dateFormatter: DateFormatter.fullDateDMY(),
                // ),
                dayProps: EasyDayProps(
                  dayStructure: DayStructure.dayStrDayNum,
                  height: height * 0.1,
                  width: width * 0.18,
                  borderColor: Colour.lightgreen,
                  activeDayStyle: DayStyle(
                    decoration: BoxDecoration(
                      color: Colour.primarycolour,
                      borderRadius:
                          BorderRadius.all(Radius.circular(width * 0.06)),
                      // gradient: LinearGradient(
                      //   begin: Alignment.topCenter,
                      //   end: Alignment.bottomCenter,
                      //   colors: [
                      //     Color(0xff3371FF),
                      //     Color(0xff8426D6),
                      //   ],
                      // ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   height: height*0.10,
              //   width: width*1,
              //   child: ListView.separated(
              //     itemCount:size.length ,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (BuildContext context, int index) {
              //       return InkWell(
              //           onTap: () {
              //             selectIndex=index;
              //             setState(() {
              //
              //
              //             });
              //           },
              //
              //           child: Container(
              //             width:width*0.14,
              //             height: width*0.08,
              //             decoration: BoxDecoration(
              //               border: Border.all(color:Colour.lightgreen),
              //               borderRadius: BorderRadius.circular(width*0.03),
              //               color:selectIndex==index?Colour.primarycolour: Colour.secondarycolour,
              //             ),
              //             child:  Column(crossAxisAlignment: CrossAxisAlignment.center,
              //               mainAxisAlignment: MainAxisAlignment.spaceAround,
              //               children: [
              //                 Text(size[index]["day"],
              //                     style: TextStyle(
              //                         fontWeight: FontWeight.w400,
              //                         fontSize: width*0.04, color:selectIndex==index?Colour.secondarycolour:Colour.color1
              //                     )),
              //                 Text(size[index]["date"].toString(),
              //                     style: TextStyle(
              //                         fontWeight: FontWeight.w600,
              //                         fontSize: width*0.06, color:selectIndex==index?Colour.secondarycolour:Colour.thirdcolour
              //                     )),
              //               ],
              //             ),
              //
              //
              //           )
              //       );
              //     }, separatorBuilder: (BuildContext context, int index) {
              //     return SizedBox(width: width*0.03,);
              //   },
              //
              //   ),
              // ),
              SizedBox(
                height: width * 0.03,
              ),
              Divider(
                thickness: width * 0.004,
                color: Colour.lightgreen,
              ),
              SizedBox(
                height: width * 0.03,
              ),
              Container(
                width: width * 1,
                height: height * 0.3,
                child: GridView.builder(
                  itemCount: time.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.9,
                    crossAxisSpacing: height * 0.01,
                    mainAxisSpacing: width * 0.02,
                    crossAxisCount: 3,
                  ),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  // scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        selectIndex1 = index;
                        setState(() {});
                      },
                      child: Container(
                          width: width * 0.3,
                          height: height * 0.005,
                          decoration: BoxDecoration(
                              color: selectIndex1 == index
                                  ? Colour.primarycolour
                                  : Colour.secondarycolour,
                              borderRadius: BorderRadius.circular(width * 0.06),
                              border: Border.all(
                                  color: Colour.lightgreen,
                                  width: width * 0.005)),
                          child: Center(
                            child: Text(
                              time[index],
                              style: TextStyle(
                                  color: selectIndex1 == index
                                      ? Colour.secondarycolour
                                      : Colour.thirdcolour,
                                  fontSize: width * 0.035),
                            ),
                          )),
                    );
                  },
                ),
              ),
              // SizedBox(height: width*0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatPage(),
                          ));
                    },
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.2,
                      decoration: BoxDecoration(
                          color: Colour.lightgreen,
                          borderRadius: BorderRadius.circular(width * 0.07)),
                      child: Center(child: SvgPicture.asset(ImageIcons.chat)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      DoctorModel doctorData = DoctorModel(
                        search: widget.dr.search,
                        name: widget.dr.name,
                        cons: widget.dr.cons,
                        admin: widget.dr.admin,
                        dis: widget.dr.dis,
                        image: widget.dr.image,
                        spcl: widget.dr.spcl,
                        exp: widget.dr.exp,
                        userId: userId!,
                        id: widget.dr.id,
                        time: time[selectIndex1],
                        date: date.toString(),
                        // userId: ''
                      );
                      if (date != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookingPage(
                                      time: doctorData,
                                    )));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colour.primarycolour,
                            content: Text("Please select any date ")));
                      }
                    },
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.6,
                      decoration: BoxDecoration(
                          color: Colour.primarycolour,
                          borderRadius: BorderRadius.circular(width * 0.07)),
                      child: Center(
                        child: Text(
                          "Book Appointment",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w600,
                              color: Colour.secondarycolour),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
