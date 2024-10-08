import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical/core/constants/images.dart';
import 'package:medical/models/doctor_model.dart';
import '../../../../../core/constants/colour.dart';
import '../../../../../core/constants/icons.dart';
import '../../../../../main.dart';
import '../../home/screen/bottomnavigation.dart';
import '../../contacts/screen/chatwithdoctor.dart';
import '../../login_signup/screen/login.dart';
import '../../orders/order_controller/schedule_controller.dart';

class BookingPage extends ConsumerStatefulWidget {
  final DoctorModel time;

  const BookingPage({
    super.key,
    required this.time,
  });

  @override
  ConsumerState<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends ConsumerState<BookingPage> {
  int selectedOption = 1;
  List doctor = [
    {
      "image": ImagePictures.drmarcus1,
      "name": "Dr. Marcus Horizon",
      "spl": "Chardiologist",
      "star": "4,7",
      "distene": "800m away",
    }
  ];
  TextEditingController reason = TextEditingController();
  double total = 0;

  addBooking() {
    ref.watch(scheduleControllerProvider).addBookingData(widget.time.copyWith(
          name: widget.time.name,
          time: widget.time.time,
          date: widget.time.date,
          cons: widget.time.cons,
          admin: widget.time.admin,
          dis: widget.time.dis,
          image: widget.time.image,
          spcl: widget.time.spcl,
          exp: widget.time.exp,
          id: widget.time.id,
          userId: userId,
          // userId: widget.time.userId
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    // addCost();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
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
          "Appointment",
          style: TextStyle(
              color: Colour.thirdcolour,
              fontWeight: FontWeight.w700,
              fontSize: width * 0.04),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(width * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: height * 0.2,
                width: width * 1,
                decoration: BoxDecoration(
                    border: Border.all(color: Colour.lightgreen),
                    borderRadius: BorderRadius.circular(width * 0.04)),
                child: ListView.separated(
                    shrinkWrap: true,
                    // physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(width * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: width * 0.35,
                              height: height * 0.15,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        widget.time.image.toString())),
                                borderRadius:
                                    BorderRadius.circular(width * 0.03),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.time.name.toString(),
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.w700,
                                      color: Colour.thirdcolour),
                                ),
                                Text(
                                  widget.time.spcl.toString(),
                                  style: TextStyle(
                                      color: Colour.gray,
                                      fontSize: width * 0.04),
                                ),
                                Text(
                                  widget.time.exp.toString(),
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
                    itemCount: doctor.length),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date",
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w700,
                        color: Colour.thirdcolour),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: width * 0.05,
                    backgroundColor: Colour.lightgreen,
                    child: Center(child: Icon(Icons.calendar_month)),
                  ),
                  Text(
                    widget.time.date.toString().substring(0, 10),
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w500,
                        color: Colour.thirdcolour),
                  ),
                  Text(
                    widget.time.time.toString(),
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w500,
                        color: Colour.thirdcolour),
                  ),
                ],
              ),
              Divider(
                thickness: width * 0.004,
                color: Colour.lightgreen,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Reason",
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w700,
                        color: Colour.thirdcolour),
                  ),
                  InkWell(
                    onTap: () {
                      reason.clear();
                    },
                    child: SizedBox(
                      child: Text(
                        "Change",
                        style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w500,
                            color: Colour.gray),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: width * 0.05,
                    backgroundColor: Colour.lightgreen,
                    child: Center(child: SvgPicture.asset(ImageIcons.square)),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  SizedBox(
                    width: width * 0.6,
                    child: TextFormField(
                      controller: reason,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                      style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w500,
                          color: Colour.thirdcolour),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: width * 0.004,
                color: Colour.lightgreen,
              ),
              Row(
                children: [
                  Text(
                    "Payment Detail",
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w700,
                        color: Colour.thirdcolour),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Consultation",
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w500,
                        color: Colour.gray),
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ ",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w500,
                              color: Colour.thirdcolour),
                        ),
                        Text(
                          widget.time.cons.toString(),
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w500,
                              color: Colour.thirdcolour),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Admin Fee",
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w500,
                        color: Colour.gray),
                  ),
                  SizedBox(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$ ",
                            style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w500,
                                color: Colour.thirdcolour),
                          ),
                          Text(
                            widget.time.admin.toString(),
                            style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w500,
                                color: Colour.thirdcolour),
                          ),
                        ]),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Aditional Discount",
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w500,
                        color: Colour.gray),
                  ),
                  SizedBox(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$ ",
                            style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w500,
                                color: Colour.thirdcolour),
                          ),
                          Text(
                            widget.time.dis.toString(),
                            style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w500,
                                color: Colour.thirdcolour),
                          ),
                        ]),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                        color: Colour.thirdcolour),
                  ),
                  SizedBox(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$ ",
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w600,
                                color: Colour.primarycolour),
                          ),
                          Text(
                            "${widget.time.cons + widget.time.admin - widget.time.dis}",
                            style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w600,
                                color: Colour.primarycolour),
                          ),
                        ]),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Divider(
                thickness: width * 0.004,
                color: Colour.lightgreen,
              ),
              Row(
                children: [
                  Text(
                    "Payment Method",
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w700,
                        color: Colour.thirdcolour),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Column(children: [
                Container(
                    height: width * 0.18,
                    width: width * 80,
                    decoration: BoxDecoration(
                        color: Colour.lightgreen,
                        borderRadius: BorderRadius.circular(width * 0.03)),
                    child: ListTile(
                      leading: SizedBox(
                        height: width * 0.07,
                        width: width * 0.07,
                        child: Image(
                          image: NetworkImage(
                              "https://pbs.twimg.com/profile_images/1615271089705463811/v-emhrqu_400x400.png"),
                        ),
                      ),
                      title: Text(
                        "PhonePe",
                        style: TextStyle(
                          fontSize: width * 0.04,
                        ),
                      ),
                      trailing: Radio(
                        value: 1,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        },
                      ),
                    )),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: width * 0.18,
                  width: width * 80,
                  decoration: BoxDecoration(
                      color: Colour.lightgreen,
                      borderRadius: BorderRadius.circular(width * 0.03)),
                  child: ListTile(
                    leading: SizedBox(
                        height: width * 0.07,
                        width: width * 0.07,
                        child: Image(
                            image: NetworkImage(
                                "https://www.computerhope.com/jargon/g/google-pay.png"))),
                    title: Text(
                      "GPay",
                      style: TextStyle(
                        fontSize: width * 0.04,
                      ),
                    ),
                    trailing: Radio(
                      value: 2,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: width * 0.18,
                  width: width * 80,
                  decoration: BoxDecoration(
                      color: Colour.lightgreen,
                      borderRadius: BorderRadius.circular(width * 0.03)),
                  child: ListTile(
                    leading: SvgPicture.asset(ImageIcons.apple),
                    title: Text(
                      "Apple Pay",
                      style: TextStyle(
                        fontSize: width * 0.04,
                      ),
                    ),
                    trailing: Radio(
                      value: 3,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: height * 0.08,
                    // width: width*0.3,
                    child: Center(
                        child: Column(
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w600,
                              color: Colour.gray),
                        ),
                        SizedBox(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$ ",
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.w700,
                                      color: Colour.thirdcolour),
                                ),
                                Text(
                                  "${widget.time.cons + widget.time.admin - widget.time.dis}",
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.w700,
                                      color: Colour.thirdcolour),
                                ),
                              ]),
                        )
                        // widget.time[i]["consultation"]+widget.time[i]["Admin Fee"]-widget.time[i]["Aditional Discount"]
                      ],
                    )),
                  ),
                  InkWell(
                    onTap: () {
                      addBooking();
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: SizedBox(
                              height: height * 0.5,
                              width: width * 0.4,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                      height: width * 0.25,
                                      width: width * 0.25,
                                      child: Image.asset(ImagePictures.done)),
                                  SizedBox(
                                      child: Column(
                                    children: [
                                      Text(
                                        "Payment Success",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: width * 0.04,
                                            color: Colour.thirdcolour),
                                      ),
                                      Text(
                                        "Your payment has been successful,",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: width * 0.032,
                                            color: Colour.color1),
                                      ),
                                      Text(
                                        "you can have a consultation session",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: width * 0.032,
                                            color: Colour.color1),
                                      ),
                                      Text(
                                        "with your trusted doctor",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: width * 0.032,
                                            color: Colour.color1),
                                      ),
                                    ],
                                  )),
                                  InkWell(
                                    onTap: () {
                                      DoctorModel doctorData = DoctorModel(
                                        search: [],
                                        name: '',
                                        cons: 0,
                                        admin: 0,
                                        dis: 0,
                                        image: widget.time.image,
                                        spcl: '',
                                        exp: '',
                                        userId: userId!,
                                        id: widget.time.id,
                                        time: '',
                                        date: '',
                                        // userId: ''
                                      );
                                      print(currentModel!.name);
                                      print(widget.time.name);
                                      print(widget.time.id);
                                      print(currentModel!.id);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ChatPage(
                                              senderId: currentModel!.name,
                                              receiverId: widget.time.name,
                                              doctorId: widget.time.id,
                                              chatId: currentModel!.id,
                                              doctorImage:doctorData,
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      height: width * 0.12,
                                      width: width * 0.34,
                                      decoration: BoxDecoration(
                                          color: Colour.primarycolour,
                                          borderRadius: BorderRadius.circular(
                                              width * 0.02)),
                                      child: Center(
                                        child: Text(
                                          "Chat Doctor",
                                          style: TextStyle(
                                              fontSize: width * 0.04,
                                              fontWeight: FontWeight.w600,
                                              color: Colour.secondarycolour),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          color: Colour.color2,
                                          indent: width * 0.04,
                                          endIndent: width * 0.04,
                                          thickness: width * 0.005,
                                        ),
                                      ),
                                      Text(
                                        "OR",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: width * 0.037,
                                            color: Colour.color1),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          color: Colour.color2,
                                          indent: width * 0.04,
                                          endIndent: width * 0.04,
                                          thickness: width * 0.005,
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BottomNavigationPage(),
                                        ), (Route<dynamic> route) => false);
                                      },
                                    child: Container(
                                      height: width * 0.12,
                                      width: width * 0.34,
                                      decoration: BoxDecoration(
                                          color: Colour.lightgreen,
                                          borderRadius: BorderRadius.circular(
                                              width * 0.02)),
                                      child: Center(
                                        child: Text(
                                          "Go to Home",
                                          style: TextStyle(
                                              fontSize: width * 0.04,
                                              fontWeight: FontWeight.w600,
                                              color: Colour.primarycolour),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.6,
                      decoration: BoxDecoration(
                          color: Colour.primarycolour,
                          borderRadius: BorderRadius.circular(width * 0.07)),
                      child: Center(
                        child: Text(
                          "Booking",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w700,
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
