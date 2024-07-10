import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medical/features/details_adding/controller/user_controller.dart';
import 'package:medical/features/details_adding/screen/home/bottomnavigation.dart';
import 'package:medical/models/address_model.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../core/constants/images.dart';
import '../../../../main.dart';
import '../../controller/address_controller.dart';

class OrderDetails extends ConsumerStatefulWidget {
  final AddressModel id;
  const OrderDetails({super.key, required this.id});

  @override
  ConsumerState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends ConsumerState<OrderDetails> {

  getLocation () async {
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
      Future.error('Location permissions are denied');
      LocationPermission ask = await Geolocator.requestPermission();
    }
  }
  String? address;
  getAddress () async {
    try{
      Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
      List <Placemark> result = await placemarkFromCoordinates(currentPosition.latitude, currentPosition.longitude);
      Placemark first = result.first;
      setState(() {
        address = "${first.locality}, ${first.administrativeArea}";
      });
    }
    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to load your Location")));
    }
  }

  @override
  void initState() {
    getLocation();
    getAddress();
    // TODO: implement initState
    super.initState();
  }
  List<TextDto> orderList = [
    TextDto("Your order has been placed", "Fri, 25th Mar '22 - 10:47pm"),
    TextDto("Seller has processed your order", "Sun, 27th Mar '22 - 10:19am"),
    TextDto("Your item has been picked up by courier partner.", "Tue, 29th Mar '22 - 5:00pm"),
  ];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", "Tue, 29th Mar '22 - 5:04pm"),
    TextDto("Your item has been received in the nearest hub to you.", null),
  ];

  List<TextDto> outOfDeliveryList = [
    TextDto("Your order is out for delivery", "Thu, 31th Mar '22 - 2:27pm"),
  ];

  List<TextDto> deliveredList = [
    TextDto("Your order has been delivered", "Thu, 31th Mar '22 - 3:58pm"),
  ];
  String? j;
  bool x=true;
  bool y=false;
  bool z=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
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
                child: SvgPicture.asset(ImageIcons.back),
              ),
            ),
          ),
        ),
        title: Text(
          "Order Details",
          style: TextStyle(
              color: Colour.thirdcolour,
              fontWeight: FontWeight.w700,
              fontSize: width * 0.063),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(width*0.03),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      // width: width*0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.location_on_outlined),
                          GestureDetector(
                            onTap: () {
                              getAddress();
                            },
                            child: Text(address == null?
                            "Fetching your location...": "$address",
                              style: TextStyle(
                                  fontSize: width * 0.048, color:Colour.thirdcolour),
                            ),
                          )
                        ],
                      )),
                ],),
              SizedBox(height: width*0.04,),
              Row(
                children: [
                 Container(
                    height: width*0.42,
                    width: width*0.9,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return  Container(
                            height: width*0.4,
                            // width: width*0.9,
                            decoration: BoxDecoration(
                              color: Colour.lightgreen,
                              borderRadius: BorderRadius.circular(width*0.02),
                              boxShadow:[
                                BoxShadow(
                                  color: Colour.thirdcolour.withOpacity(0.10),
                                  blurRadius: 3,
                                  spreadRadius: 2,
                                  offset:Offset(0, 4),
                                )
                              ] ,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(width*0.02),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Address : ",style: TextStyle(
                                          fontSize: width*0.05,
                                          fontWeight: FontWeight.w600
                                      ),),
                                      InkWell(
                                          onTap: () {

                                          },
                                          child: Icon(Icons.edit))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(widget.id.name.toString(), style: TextStyle(
                                          fontSize: width * 0.045, color:Colour.thirdcolour),),
                                      Text(" , "),
                                      Text(widget.id.houseName.toString(), style: TextStyle(
                                          fontSize: width * 0.045, color:Colour.thirdcolour),),
                                      Text(" , "),
                                      Text(widget.id.street.toString(), style: TextStyle(
                                          fontSize: width * 0.045, color:Colour.thirdcolour),),
                                      Text(" , "),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(widget.id.city.toString(), style: TextStyle(
                                          fontSize: width * 0.045, color:Colour.thirdcolour),),
                                      Text(" , "),
                                      Text(widget.id.pincode.toString(), style: TextStyle(
                                          fontSize: width * 0.045, color:Colour.thirdcolour),),
                                      Text(" , "),
                                      Text(widget.id.country.toString(), style: TextStyle(
                                          fontSize: width * 0.045, color:Colour.thirdcolour),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Ph : ",style: TextStyle(
                                          fontSize: width * 0.045, color:Colour.thirdcolour),),
                                      Text(widget.id.phone.toString(), style: TextStyle(
                                          fontSize: width * 0.045, color:Colour.thirdcolour),),
                                    ],
                                  ),
                                  SizedBox(height: width*0.02,),
                                  Row(
                                    children: [
                                      Text("Order Id : ",style: TextStyle(
                                          fontSize: width*0.05,
                                          fontWeight: FontWeight.w600
                                      ),),
                                      Text(widget.id.id.toString(), style: TextStyle(
                                          fontSize: width * 0.045, color:Colour.thirdcolour),)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },),
                  ),
                ],
              ),
              SizedBox(height: width*0.05,),
              Container(
                height: width * 0.35,
                width: width * 0.94,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: width*0.005,
                        color: Colors.grey.withOpacity(0.15)),
                    borderRadius: BorderRadius.circular(width * 0.04)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        height: width * 0.2,
                        width: width * 0.27,
                        child: Image(image: NetworkImage(widget.id.itemImage.toString()))
                    ),
                    Container(
                      height: width * 0.27,
                      width: width * 0.55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  widget.id.itemName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: width * 0.045),
                                ),
                                Text(
                                  widget.id.itemMl.toString(),
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: Colour.gray),
                                ),
                                Text(
                                  "\$${widget.id.itemRate}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: width * 0.04),
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
              SizedBox(height: width*0.04,),
              Container(
                height: width * 0.66,
                width: width * 0.9,
                decoration: BoxDecoration(
                    color: Colour.secondarycolour,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: width*0.03,
                      )
                    ],
                    borderRadius: BorderRadius.circular(width*0.06)
                ),
                child: Column(
                  children: [
                    SizedBox(height: width*0.05,),
                    ListTile(
                      leading: Image.asset(ImagePictures.phonepe,width: width*0.098,),
                      title: Text("PhonePe",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width*0.047),),
                      trailing: Radio(
                        activeColor: Colour.primarycolour,
                        value: "h",
                        groupValue: j,
                        onChanged: (value) {
                          j = value!;
                          setState(() {});
                        },
                      ),
                    ),
                    Divider(
                      thickness: width*0.002,
                      color: Colors.black12,
                      endIndent: width*0.05,
                      indent: width*0.05,
                    ),
                    ListTile(
                      leading: Image.asset(ImagePictures.googlepay,width: width*0.098,),
                      title: Text("Google Pay",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width*0.047),),
                      trailing: Radio(
                        activeColor: Colour.primarycolour,
                        value: "i",
                        groupValue: j,
                        onChanged: (value) {
                          j = value!;
                          setState(() {});
                        },
                      ),
                    ),
                    Divider(
                      thickness: width*0.002,
                      color: Colors.black12,
                      endIndent: width*0.05,
                      indent: width*0.05,
                    ),
                    ListTile(
                      leading: Image.asset(ImagePictures.paytm,width: width*0.098,),
                      title: Text("Paytm",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width*0.047),),
                      trailing: Radio(
                        activeColor: Colour.primarycolour,
                        value: "0",
                        groupValue: j,
                        onChanged: (value) {
                          j = value!;

                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: width*0.04,),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNavigationPage(),), (route) => false);
                },
                child: Container(
                  height: width*0.13,
                  width: width*0.84,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[Colour.primarycolour, Colour.lightprimarycolor],
                    ),
                    borderRadius: BorderRadius.circular(width*0.04),
                  ),
                  child: Center(
                    child: Text("Order Now",style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colour.secondarycolour,
                        fontSize: width*0.05
                    ),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
