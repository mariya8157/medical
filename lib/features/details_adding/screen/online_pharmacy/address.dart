// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:lottie/lottie.dart';
// import 'package:medical/features/details_adding/screen/onlinePharmacy/userModel.dart';
//
//
// import '../../../../main.dart';
// import 'model.dart';
//
// class addnewaddress extends StatefulWidget {
//   // final String userName, userNumber;
//   const addnewaddress(
//       {super.key,
//         // required this.userName, required this.userNumber,
//       });
//
//   @override
//   State<addnewaddress> createState() => _addnewaddressState();
// }
//
// class _addnewaddressState extends State<addnewaddress> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController numberController = TextEditingController();
//   TextEditingController pincodeController = TextEditingController();
//   TextEditingController streetController = TextEditingController();
//   TextEditingController townController = TextEditingController();
//   TextEditingController apartmentController = TextEditingController();
//   TextEditingController instructionsController = TextEditingController();
//
//   String address = '';
//   final emailValidation = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//   final phoneValidation = RegExp(r"[0-9]{10}");
//
//   final formKey = GlobalKey<FormState>();
//   bool validate = false;
//   var countryCode;
//   // UserModel? userModel;
//   String? location;
//   List addre=[];
//   String? userName;
//   String userNumber= '';
//   // getUser(){
//   //   // FirebaseFirestore.instance.collection("users").doc(loginId).get().then((value) {
//   //   //   userModel = UserModel.fromMap(value.data()!);
//   //   // });
//   //   // userName = userModel!.name;
//   //   // userNumber = userModel!.number;
//   // }
//
//   addaddress()async{
//     addressModel address=addressModel(
//       name: nameController.text,
//       number:numberController.text,
//       location: '${location}',
//       pincode: pincodeController.text,
//       address:"${apartmentController.text},${streetController.text},${townController.text}",
//       deliveryInstruction: instructionsController.text,
//       Default: true,
//     );
//
//     // await FirebaseFirestore.instance.collection("users").doc().get().then((value) {
//     //   userModel = UserModel.fromMap(value.data()!);
//     // });
//     // addre=userModel!.address;
//     // addre.add(address.toMap());
//     // UserModel tempuserModel=userModel!.copyWith(
//     //     address: addre
//     // );
//     // await FirebaseFirestore.instance.collection("users").doc().update(tempuserModel.toMap());
//   }
//   File? file;
//   bool loading = false;
//   String newImage = '';
//   // UserModel? usermodel;
//   @override
//   void initState() {
//     //getUser();
//     // nameController.text = widget.userName;
//     // numberController.text = widget.userNumber.substring(3,13);
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         toolbarHeight: width * 0.1,
//         // leadingWidth: w * 0.03,
//         title: Padding(
//           padding: EdgeInsets.all(width * 0.03),
//           child: InkWell(
//             onTap: () {
//               // getUser();
//             },
//             child: Text("Add Address",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: width * 0.055,
//                     fontWeight: FontWeight.w800)),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(width * 0.05),
//         child: Form(
//           key: formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(bottom:width*0.03),
//                   child: TextFormField(
//                     controller: nameController,
//                     keyboardType: TextInputType.name,
//                     // textCapitalization: TextCapitalization.words,
//                     textInputAction: TextInputAction.next,
//                     readOnly: true,
//                     style: TextStyle(
//                         fontSize: width * 0.04, fontWeight: FontWeight.w600),
//                     cursorColor: Colors.grey,
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     validator: (value) {
//                       if(nameController.text.isEmpty){
//                         return "Name is required";
//                       }else{
//                         return null;
//                       }
//                     },
//                     decoration: InputDecoration(
//                         constraints: BoxConstraints(maxHeight: 80),
//                         labelText: "Full name *",
//                         labelStyle: TextStyle(
//                             fontSize: width * 0.04,
//                             color: Colors.grey),
//                         filled: true,
//                         fillColor: Colors.white,
//                         hintText: "Enter your full name",
//                         hintStyle: TextStyle(
//                             fontSize: width * 0.04,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.grey),
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.red)),
//                         enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(width * 0.03),
//                             borderSide: BorderSide(
//                                 color: Colors.black.withOpacity(0.1))),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(width * 0.03),
//                             borderSide: BorderSide(
//                                 color: Colors.black.withOpacity(0.1)))),
//                   ),
//                 ),
//                 Padding(
//                   padding:EdgeInsets.only(bottom: width*0.03),
//                   child: TextFormField(
//                     controller: numberController,
//                     keyboardType: TextInputType.number,
//                     maxLength: 10,
//                     readOnly: true,
//                     inputFormatters: <TextInputFormatter>[
//                       FilteringTextInputFormatter.digitsOnly
//                     ],
//                     textInputAction: TextInputAction.done,
//                     style: TextStyle(
//                         fontSize: width * 0.04, fontWeight: FontWeight.w600),
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     validator: (value) {
//                       if (!phoneValidation.hasMatch(value!)) {
//                         return "Enter a valid Phone Number!";
//                       } else {
//                         return null;
//                       }
//                     },
//                     cursorColor: Colors.grey,
//                     decoration: InputDecoration(
//                         constraints: BoxConstraints(maxHeight: 80),
//                         prefix: Padding(
//                           padding:EdgeInsets.only(right:width*0.03),
//                           child: SizedBox(child: Text("+91"),),
//                         ),
//                         counterText: "",
//                         prefixStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
//                         labelText: "Phone Number *",
//                         labelStyle: TextStyle(
//                             fontSize: width * 0.04,
//                             color: Colors.grey
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                         hintText: "Enter your Phone Number",
//                         hintStyle: TextStyle(
//                             fontSize: width * 0.04,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.grey),
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.red)),
//                         enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(width * 0.03),
//                             borderSide: BorderSide(
//                                 color: Colors.black.withOpacity(0.1))),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(width * 0.03),
//                             borderSide: BorderSide(
//                                 color: Colors.black.withOpacity(0.1)))),
//                   ),
//                 ),
//                 SizedBox(
//                   height: width * 0.04,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(bottom: width*0.03),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         //height: scrHeight*0.06,
//                         width: width*0.4,
//                         child: TextFormField(
//                           controller: pincodeController,
//                           keyboardType: TextInputType.number,
//                           maxLength: 6,
//                           inputFormatters: <TextInputFormatter>[
//                             FilteringTextInputFormatter.digitsOnly
//                           ],
//                           textInputAction: TextInputAction.done,
//                           style: TextStyle(
//                               fontSize: width * 0.04, fontWeight: FontWeight.w600),
//                           cursorColor: Colors.grey,
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: (value) {
//                             if(pincodeController.text.isEmpty){
//                               return "Pincode is required";
//                             }else{
//                               return null;
//                             }
//                           },
//                           decoration: InputDecoration(
//                               constraints: BoxConstraints(maxHeight: 70),
//                               counterText: "",
//                               labelText: "Pincode *",
//                               labelStyle: TextStyle(
//                                   fontSize: width * 0.04,
//                                   color: Colors.grey
//                               ),
//                               filled: true,
//                               fillColor: Colors.white,
//                               hintText: "Enter your Pincode",
//                               hintStyle: TextStyle(
//                                   fontSize: width * 0.04,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.grey),
//                               border: OutlineInputBorder(
//                                   borderSide: BorderSide(color:Colors.red)),
//                               enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(width * 0.03),
//                                   borderSide: BorderSide(
//                                       color: Colors.black.withOpacity(0.1))),
//                               focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(width * 0.03),
//                                   borderSide: BorderSide(
//                                       color: Colors.black.withOpacity(0.1)))),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () async {
//                           LocationPermission permission = await Geolocator.checkPermission();
//                           if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
//                             Future.error('Location permissions are denied');
//                             LocationPermission ask = await Geolocator.requestPermission();
//                           }
//                           try{
//                             Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
//                             // print(currentPosition.latitude);
//                             // print(currentPosition.longitude);
//                             List <Placemark> result = await placemarkFromCoordinates(currentPosition.latitude, currentPosition.longitude);
//                             Placemark first = result.first;
//                             location= "${currentPosition.latitude.toString()},${currentPosition.longitude.toString()}";
//                             print(result);
//                             setState(() {
//                               pincodeController.text = first.postalCode!;
//                               streetController.text = first.subLocality!;
//                               townController.text = first.locality!;
//                             });
//                           }
//                           catch (e) {
//                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to load your Location")));
//                           }
//                         },
//                         child: Container(
//                           height: width*0.06,
//                           width: width*0.4,
//                           decoration: BoxDecoration(
//                             // color: colorConst.meroon.withOpacity(0.3),
//                             border: Border.all(color:  Colors.yellow),
//                             borderRadius: BorderRadius.circular(width*0.03),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Icon(Icons.my_location_outlined,color:  Colors.yellow),
//                               Text("My Location",style: TextStyle(color: Colors.yellow),)
//                             ],),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                     padding: EdgeInsets.only(bottom: width*0.03),
//                     child:Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           //height: scrHeight*0.06,
//                           width: width*0.4,
//                           child: TextFormField(
//                             controller: streetController,
//                             keyboardType: TextInputType.text,
//                             textInputAction: TextInputAction.done,
//                             style: TextStyle(
//                                 fontSize: width * 0.04, fontWeight: FontWeight.w600),
//                             cursorColor: Colors.grey,
//                             autovalidateMode: AutovalidateMode.onUserInteraction,
//                             validator: (value) {
//                               if(streetController.text.isEmpty){
//                                 return "Street is required";
//                               }else{
//                                 return null;
//                               }
//                             },
//                             decoration: InputDecoration(
//                                 constraints: BoxConstraints(maxHeight: 80),
//                                 labelText: "Street *",
//                                 labelStyle: TextStyle(
//                                     fontSize: width * 0.04,
//                                     color: Colors.grey
//                                 ),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 hintText: "Enter your Street name",
//                                 hintStyle: TextStyle(
//                                     fontSize: width * 0.04,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.grey),
//                                 border: OutlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.red)),
//                                 enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(width * 0.03),
//                                     borderSide: BorderSide(
//                                         color: Colors.black.withOpacity(0.1))),
//                                 focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(width * 0.03),
//                                     borderSide: BorderSide(
//                                         color: Colors.black.withOpacity(0.1)))),
//                           ),
//                         ),
//                         SizedBox(
//                           //height: scrHeight*0.06,
//                           width: width*0.4,
//                           child: TextFormField(
//                             controller: townController,
//                             keyboardType: TextInputType.text,
//                             textInputAction: TextInputAction.done,
//                             style: TextStyle(
//                                 fontSize: width * 0.04, fontWeight: FontWeight.w600),
//                             cursorColor: Colors.grey,
//                             autovalidateMode: AutovalidateMode.onUserInteraction,
//                             validator: (value) {
//                               if(townController.text.isEmpty){
//                                 return "City/Town is required";
//                               }else{
//                                 return null;
//                               }
//                             },
//                             decoration: InputDecoration(
//                                 constraints: BoxConstraints(maxHeight: 80),
//                                 labelText: "City/Town *",
//                                 labelStyle: TextStyle(
//                                     fontSize: width * 0.04,
//                                     color: Colors.grey
//                                 ),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 hintText: "Enter your City/Town name",
//                                 hintStyle: TextStyle(
//                                     fontSize: width * 0.04,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.grey),
//                                 border: OutlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.red)),
//                                 enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(width * 0.03),
//                                     borderSide: BorderSide(
//                                         color: Colors.black.withOpacity(0.1))),
//                                 focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(width * 0.03),
//                                     borderSide: BorderSide(
//                                         color: Colors.black.withOpacity(0.1)))),
//                           ),
//                         ),
//                       ],
//                     )),
//                 SizedBox(
//                   height: width * 0.04,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(bottom:width*0.03),
//                   child: TextFormField(
//                     controller: apartmentController,
//                     keyboardType: TextInputType.text,
//                     textCapitalization: TextCapitalization.words,
//                     textInputAction: TextInputAction.next,
//                     style: TextStyle(
//                         fontSize: width * 0.04, fontWeight: FontWeight.w600),
//                     cursorColor: Colors.grey,
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     decoration: InputDecoration(
//                         constraints: BoxConstraints(maxHeight: 80),
//                         labelText: "Apartment/House name",
//                         labelStyle: TextStyle(
//                             fontSize: width * 0.04,
//                             color: Colors.grey),
//                         filled: true,
//                         fillColor: Colors.white,
//                         // hintText: "Enter your full name",
//                         // hintStyle: TextStyle(
//                         //     fontSize: scrWidth * 0.04,
//                         //     fontWeight: FontWeight.w500,
//                         //     color: colorConst.grey),
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.red)),
//                         enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(width * 0.03),
//                             borderSide: BorderSide(
//                                 color:Colors.black.withOpacity(0.1))),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(width * 0.03),
//                             borderSide: BorderSide(
//                                 color: Colors.black.withOpacity(0.1)))),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(bottom:width*0.03),
//                   child: TextFormField(
//                     controller: instructionsController,
//                     keyboardType: TextInputType.text,
//                     textCapitalization: TextCapitalization.words,
//                     textInputAction: TextInputAction.next,
//                     style: TextStyle(
//                         fontSize: width * 0.04, fontWeight: FontWeight.w600),
//                     cursorColor: Colors.grey,
//                     decoration: InputDecoration(
//                         constraints: BoxConstraints(maxHeight: 80),
//                         labelText: "Delivery Instructions",
//                         labelStyle: TextStyle(
//                             fontSize: width * 0.04,
//                             color: Colors.grey),
//                         filled: true,
//                         fillColor: Colors.white,
//                         hintText: "e.g. Contact me if the Gate is closed",
//                         hintStyle: TextStyle(
//                             fontSize: width * 0.04,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.grey),
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.red)),
//                         enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(width * 0.03),
//                             borderSide: BorderSide(
//                                 color: Colors.black.withOpacity(0.1))),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(width * 0.03),
//                             borderSide: BorderSide(
//                                 color: Colors.black.withOpacity(0.1)))),
//                   ),
//                 ),
//                 SizedBox(height: width*0.04,),
//
//                 InkWell(
//                   onTap: () {
//                     if(
//                     formKey.currentState!.validate()
//                     ){
//                       setState(() {
//                         validate = true;
//                       });
//                       addaddress();
//                       Navigator.pop(context);
//                     }else{
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter Valid details!")));
//                     }
//                   }
//                   ,
//                   child: Container(
//                       height: width * 0.06,
//                       decoration: BoxDecoration(
//                         color: //validate?colorConst.meroon:
//                         Colors.red,
//                         borderRadius: BorderRadius.circular(width * 0.07),
//                       ),
//                       child: Center(
//                           child: Text("Add",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: width * 0.04)))),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
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
