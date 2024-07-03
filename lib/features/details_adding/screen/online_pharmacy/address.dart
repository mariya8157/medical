import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medical/features/details_adding/controller/user_controller.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../main.dart';
import '../../controller/address_controller.dart';

class OrderDetails extends ConsumerStatefulWidget {
  const OrderDetails({super.key});

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
                      width: width*0.6,
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
                  ref.watch(StreamAddressProvider).when(data: (data) =>  Container(
                    height: width*0.42,
                    width: width*0.8,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return  Container(
                            height: width*0.4,
                            width: width*0.78,
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
                                    children: [
                                      Text("Address : ",style: TextStyle(
                                          fontSize: width*0.05,
                                          fontWeight: FontWeight.w600
                                      ),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(data[index].name.toString(), style: TextStyle(
                                          fontSize: width * 0.045, color:Colour.thirdcolour),),
                                      Text(" , "),
                                      Text(data[index].houseName.toString(), style: TextStyle(
                                          fontSize: width * 0.045, color:Colour.thirdcolour),),
                                      Text(" , "),
                                      Text(data[index].street.toString(), style: TextStyle(
                                          fontSize: width * 0.045, color:Colour.thirdcolour),),
                                      Text(" , "),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(data[index].city.toString(), style: TextStyle(
                                          fontSize: width * 0.045, color:Colour.thirdcolour),),
                                      Text(" , "),
                                      Text(data[index].pincode.toString(), style: TextStyle(
                                          fontSize: width * 0.045, color:Colour.thirdcolour),),
                                      Text(" , "),
                                      Text(data[index].country.toString(), style: TextStyle(
                                          fontSize: width * 0.045, color:Colour.thirdcolour),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Ph : ",style: TextStyle(
                                          fontSize: width * 0.045, color:Colour.thirdcolour),),
                                      Text(data[index].phone.toString(), style: TextStyle(
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
                                      Text(data[index].id.toString(), style: TextStyle(
                                          fontSize: width * 0.045, color:Colour.thirdcolour),)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },),
                  ),
                    error: (error, stackTrace) {
                      return ScaffoldMessenger(
                          child: Center(child: Text(error.toString())));
                    },
                    loading: () {
                      return Center(child: CircularProgressIndicator());
                    },)
                ],
              ),
              SizedBox(height: width*0.05,),
              // OrderTracker(
              //   status: Status.delivered,
              //   activeColor: Colors.green,
              //   inActiveColor: Colors.grey[300],
              //   orderTitleAndDateList: orderList,
              //   shippedTitleAndDateList: shippedList,
              //   outOfDeliveryTitleAndDateList: outOfDeliveryList,
              //   deliveredTitleAndDateList: deliveredList,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
