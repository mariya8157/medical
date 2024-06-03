import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medical/core/colour.dart';
import 'package:medical/features/details_adding/controller/addingcontroller_page.dart';
import 'package:medical/features/details_adding/screen/onlinePharmacy/address.dart';
import 'package:medical/models/model2.dart';

import '../../../../core/icons.dart';
import '../../../../main.dart';

class DeliveryPage extends ConsumerStatefulWidget {
  const DeliveryPage({super.key});

  @override
  ConsumerState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends ConsumerState<DeliveryPage> {

  TextEditingController nameController=TextEditingController();
  TextEditingController pincodeController=TextEditingController();
  TextEditingController cityController=TextEditingController();
  TextEditingController streetController=TextEditingController();
  TextEditingController countryController=TextEditingController();
  TextEditingController houseController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController idController=TextEditingController();


  addressDetails(){
    ref.read(AddressControllerProvider).addAddressData(AddressModel(
        name: nameController.text,
        phone: int.parse(phoneController.text),
        pincode: int.parse(pincodeController.text),
        street: streetController.text,
        city: cityController.text,
        country: countryController.text,
        houseName: houseController.text,
        id: idController.text));
  }
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
                Text("Phone Number",style: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.05),),
              ],
            ),
            SizedBox(height: width*0.02,),
            SizedBox(
              height: width*0.16,
              width: width*0.88,
              child: TextFormField(
                  controller: phoneController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10)
                  ],
                  decoration: InputDecoration(
                    prefixText:"+91 ",
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
                        countryController.text = first.country!;
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
                      border: Border.all(color: Colour.primarycolour),
                      borderRadius: BorderRadius.circular(width*0.03),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.my_location_outlined,color: Colour.primarycolour),
                        Text("My Location",style: TextStyle(color: Colour.primarycolour),)
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
            ),
            SizedBox(height: width*0.05,),
            Row(
              children: [
                SizedBox(width: width*0.07,),
                Text("Country",style: TextStyle(fontWeight: FontWeight.w700,fontSize: width*0.05),),
              ],
            ),
            SizedBox(height: width*0.02,),
            SizedBox(
              height: width*0.16,
              width: width*0.88,
              child: TextFormField(
                  controller: countryController,
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
              ),),
            SizedBox(height: width*0.05,),
            Row(
              children: [
                SizedBox(width: width*0.07,),
                Text("House/Apartment name",style: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.05),),
              ],
            ),
            SizedBox(height: width*0.02,),
            SizedBox(
              height: width*0.16,
              width: width*0.88,
              child: TextFormField(
                  controller: houseController,
                  textInputAction: TextInputAction.done,
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
              ),),
            SizedBox(height: width*0.06,),
            InkWell(
              onTap: () {
                addressDetails();
                Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetails(),));
              },
              child: Container(
                height: width*0.16,
                width: width*0.88,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[Colour.primarycolour, Colour.lightprimarycolor],
                  ),
                  borderRadius: BorderRadius.circular(width*0.04),
                ),
                child: Center(
                  child: Text("Add",style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colour.secondarycolour,
                      fontSize: width*0.06
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


