import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/icons.dart';
import '../../../../main.dart';

class delivery extends StatefulWidget {
  const delivery({super.key});

  @override
  State<delivery> createState() => _deliveryState();
}

class _deliveryState extends State<delivery> {
  TextEditingController nameController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController pincodeController=TextEditingController();
  TextEditingController cityController=TextEditingController();
  TextEditingController streetController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white24,
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
                child: SvgPicture.asset(ImageIcons.back),
              ),
            ),
          ),
        ),
        title: Text(
          " Delivery Address",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: width * 0.063),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: width*0.05,),
            Row(
              children: [
                SizedBox(width: width*0.05,),
                Text(" Shipping Details",style: TextStyle(fontSize: width*0.06,fontWeight: FontWeight.w600),),
              ],
            ),
            SizedBox(height: width*0.05,),
            Row(
              children: [
                SizedBox(width: width*0.07,),
                Text("Full Name",style: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.05),),
              ],
            ),
            SizedBox(height: width*0.02,),
            SizedBox(
              height: width*0.16,
              width: width*0.88,
              child: TextFormField(
                controller: nameController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    suffix: InkWell(
                        onTap: () {
                          nameController.clear();
                          setState(() {

                          });
                        },
                        child: Icon(Icons.clear)),
                    // suffixText:"kousar",
                    hintText: "full name",
                    labelStyle: TextStyle(
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.w300,
                        ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                      ),
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                  )
              ),
            ),
            SizedBox(height: width*0.05,),
            Row(
              children: [
                SizedBox(width: width*0.07,),
                Text("Address",style: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.05),),
              ],
            ),
            SizedBox(height: width*0.02,),
            SizedBox(
              height: width*0.16,
              width: width*0.88,
              child: TextFormField(
                  controller: addressController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    // suffixText:"kousar",
                    hintText: "Address",
                    labelStyle: TextStyle(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.w300,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                      ),
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                  )
              ),
            ),
            SizedBox(height: width*0.05,),
            Row(
              children: [
                SizedBox(width: width*0.07,),
                Text("Pin Code",style: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.05),),
              ],
            ),
            SizedBox(height: width*0.02,),
            Row(
              children: [
                SizedBox(width: width*0.06,),
                Container(
                  height: width*0.14,
                  width: width*0.3,
                  child: TextFormField(
                      controller: pincodeController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6)
                      ],
                      decoration: InputDecoration(
                        // suffixText:"kousar",
                        labelStyle: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w300,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(width * 0.03),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                          ),
                          borderRadius: BorderRadius.circular(width * 0.03),
                        ),
                      )
                  ),
                ),
                 SizedBox(width: width*0.08),
                InkWell(
                  onTap: () async {
                    LocationPermission permission = await Geolocator.checkPermission();
                    if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
                      Future.error('Location permissions are denied');
                      LocationPermission ask = await Geolocator.requestPermission();
                    }
                    try{
                      Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
                      // print(currentPosition.latitude);
                      // print(currentPosition.longitude);
                      List <Placemark> result = await placemarkFromCoordinates(currentPosition.latitude, currentPosition.longitude);
                      Placemark first = result.first;
                      print(result);
                      setState(() {
                        pincodeController.text = first.postalCode!;
                        streetController.text = first.subLocality!;
                        cityController.text = first.locality!;
                      });
                    }
                    catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to load your Location")));
                    }
                  },
                  child: Container(
                    height: width*0.12,
                    width: width*0.4,
                    decoration: BoxDecoration(
                      // color: Colors.red.withOpacity(0.2),
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(width*0.03),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.my_location_outlined,color: Colors.red,),
                        Text("My Location",style: TextStyle(color: Colors.red),)
                      ],),
                  ),
                )
                 // Container(
                 //   height: width*0.12,
                 //   width: width*0.38,
                 //   decoration: BoxDecoration(
                 //     border: Border.all(color: Colors.red),
                 //     borderRadius: BorderRadius.circular(width*0.02)
                 //   ),
                 //
                 // )
              ],
            ),
            SizedBox(height: width*0.05,),
            Row(
              children: [
                SizedBox(width: width*0.07,),
                Text("Street",style: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.05),),
              ],
            ),
            SizedBox(height: width*0.02,),
            SizedBox(
              height: width*0.16,
              width: width*0.88,
              child: TextFormField(
                  controller: streetController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    // suffixText:"kousar",
                    labelStyle: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w300,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                      ),
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                  )
              ),
            ),
            SizedBox(height: width*0.05,),
            Row(
              children: [
                SizedBox(width: width*0.07,),
                Text("City",style: TextStyle(fontWeight: FontWeight.w700,fontSize: width*0.05),),
              ],
            ),
            SizedBox(height: width*0.02,),
            SizedBox(
              height: width*0.16,
              width: width*0.88,
              child: TextFormField(
                  controller: cityController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    // suffixText:"kousar",
                    labelStyle: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w300,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                      ),
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
