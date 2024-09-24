import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medical/features/details_adding/controller/user_controller.dart';
import 'package:medical/features/details_adding/providers/firebase_provider.dart';
import 'package:medical/features/details_adding/screen/online_pharmacy/mycart.dart';
import 'package:medical/models/address_model.dart';

import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../main.dart';
import '../../../../models/medicine_model.dart';
import '../../controller/address_controller.dart';
import '../home/bottomnavigation.dart';
import '../login_signup/login.dart';
import 'address.dart';

class DeliveryPage extends ConsumerStatefulWidget {
  final MedicineModel item2;

  const DeliveryPage({super.key, required this.item2});

  @override
  ConsumerState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends ConsumerState<DeliveryPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController idController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  addressDetails() {
    ref.read(AddressControllerProvider).addAddressData(AddressModel(
          name: nameController.text,
          phone: int.parse(phoneController.text),
          pincode: int.parse(pincodeController.text),
          street: streetController.text,
          city: cityController.text,
          country: countryController.text,
          houseName: houseController.text,
          id: widget.item2.id,
          itemName: widget.item2.name,
          itemImage: widget.item2.image,
          itemQty: widget.item2.qty.toInt(),
          itemMl: widget.item2.ml,
          itemRate: widget.item2.rate.toInt() * widget.item2.qty.toInt(),
          userId: currentModel!.id,
          cart: [],
        ));
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
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavigationPage(),
                ),
                (route) => false);
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
              color: Colour.thirdcolour,
              fontWeight: FontWeight.w700,
              fontSize: width * 0.04),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(width * 0.03),
            child: Column(
              children: [
                SizedBox(
                  height: width * 0.05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Text(
                      " Shipping Details",
                      style: TextStyle(
                          fontSize: width * 0.04, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(
                  height: width * 0.05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.07,
                    ),
                    Text(
                      "Full Name",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: width * 0.04),
                    ),
                    Text(
                      " *",
                      style: TextStyle(color: Colour.color4),
                    ),
                  ],
                ),
                SizedBox(
                  height: width * 0.02,
                ),
                SizedBox(
                  height: width * 0.16,
                  width: width * 0.88,
                  child: TextFormField(
                      controller: nameController,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter,
                        LengthLimitingTextInputFormatter(20)
                      ],
                      decoration: InputDecoration(
                        suffix: InkWell(
                            onTap: () {
                              nameController.clear();
                              setState(() {});
                            },
                            child: Icon(Icons.clear)),
                        labelStyle: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w300,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colour.color4,
                          ),
                          borderRadius: BorderRadius.circular(width * 0.03),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(width * 0.03),
                        ),
                      )),
                ),
                SizedBox(
                  height: width * 0.05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.07,
                    ),
                    Text(
                      "Phone Number",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: width * 0.04),
                    ),
                    Text(
                      " *",
                      style: TextStyle(color: Colour.color4),
                    ),
                  ],
                ),
                SizedBox(
                  height: width * 0.02,
                ),
                SizedBox(
                  height: width * 0.16,
                  width: width * 0.88,
                  child: TextFormField(
                      controller: phoneController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10)
                      ],
                      decoration: InputDecoration(
                        prefixIcon: CountryCodePicker(
                          // dialogSize: ,
                          onChanged: print,
                          initialSelection: "IN",
                          favorite: ["+91", "FR"],
                          textStyle: TextStyle(
                            color: Colour.thirdcolour,
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w300,
                          ),
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                          showDropDownButton: false,
                          searchDecoration: InputDecoration(
                            counterText: "",
                            labelText: "",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colour.thirdcolour,
                              ),
                              borderRadius: BorderRadius.circular(width * 0.03),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colour.thirdcolour),
                              borderRadius: BorderRadius.circular(width * 0.03),
                            ),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(width * 0.03),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(width * 0.03),
                        ),
                      )),
                ),
                SizedBox(
                  height: width * 0.05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.07,
                    ),
                    Text(
                      "Pin Code",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: width * 0.04),
                    ),
                    Text(
                      " *",
                      style: TextStyle(color: Colour.color4),
                    ),
                  ],
                ),
                SizedBox(
                  height: width * 0.02,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.06,
                    ),
                    SizedBox(
                      height: width * 0.12,
                      width: width * 0.3,
                      child: TextFormField(
                          controller: pincodeController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6)
                          ],
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w300,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colour.color4,
                              ),
                              borderRadius: BorderRadius.circular(width * 0.03),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(),
                              borderRadius: BorderRadius.circular(width * 0.03),
                            ),
                          )),
                    ),
                    SizedBox(width: width * 0.08),
                    InkWell(
                      onTap: () async {
                        LocationPermission permission =
                            await Geolocator.checkPermission();
                        if (permission == LocationPermission.denied ||
                            permission == LocationPermission.deniedForever) {
                          Future.error('Location permissions are denied');
                          LocationPermission ask =
                              await Geolocator.requestPermission();
                        }
                        try {
                          Position currentPosition =
                              await Geolocator.getCurrentPosition(
                                  desiredAccuracy: LocationAccuracy.medium);
                          // print(currentPosition.latitude);
                          // print(currentPosition.longitude);
                          List<Placemark> result =
                              await placemarkFromCoordinates(
                                  currentPosition.latitude,
                                  currentPosition.longitude);
                          Placemark first = result.first;
                          print(result);
                          setState(() {
                            pincodeController.text = first.postalCode!;
                            streetController.text = first.subLocality!;
                            cityController.text = first.locality!;
                            countryController.text = first.country!;
                          });
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Failed to load your Location")));
                        }
                      },
                      child: Container(
                        height: width * 0.12,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          // color: Colors.red.withOpacity(0.2),
                          border: Border.all(color: Colour.primarycolour),
                          borderRadius: BorderRadius.circular(width * 0.03),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.my_location_outlined,
                                color: Colour.primarycolour),
                            Text(
                              "My Location",
                              style: TextStyle(color: Colour.primarycolour),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: width * 0.05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.07,
                    ),
                    Text(
                      "Street",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: width * 0.04),
                    ),
                    const Text(
                      " *",
                      style: TextStyle(color: Colour.color4),
                    ),
                  ],
                ),
                SizedBox(
                  height: width * 0.02,
                ),
                SizedBox(
                  height: width * 0.16,
                  width: width * 0.88,
                  child: TextFormField(
                      controller: streetController,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter,
                        LengthLimitingTextInputFormatter(25)
                      ],
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w300,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colour.color4,
                          ),
                          borderRadius: BorderRadius.circular(width * 0.03),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(width * 0.03),
                        ),
                      )),
                ),
                SizedBox(
                  height: width * 0.05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.07,
                    ),
                    Text(
                      "City",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: width * 0.04),
                    ),
                    Text(
                      " *",
                      style: TextStyle(color: Colour.color4),
                    ),
                  ],
                ),
                SizedBox(
                  height: width * 0.02,
                ),
                SizedBox(
                  height: width * 0.16,
                  width: width * 0.88,
                  child: TextFormField(
                      controller: cityController,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter,
                        LengthLimitingTextInputFormatter(15)
                      ],
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w300,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colour.color4,
                          ),
                          borderRadius: BorderRadius.circular(width * 0.03),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(width * 0.03),
                        ),
                      )),
                ),
                SizedBox(
                  height: width * 0.05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.07,
                    ),
                    Text(
                      "Country",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: width * 0.04),
                    ),
                    Text(
                      " *",
                      style: TextStyle(color: Colour.color4),
                    ),
                  ],
                ),
                SizedBox(
                  height: width * 0.02,
                ),
                SizedBox(
                  height: width * 0.16,
                  width: width * 0.88,
                  child: TextFormField(
                      controller: countryController,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter,
                        LengthLimitingTextInputFormatter(15)
                      ],
                      decoration: InputDecoration(
                        // suffixText:"kousar",
                        labelStyle: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w300,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colour.color4,
                          ),
                          borderRadius: BorderRadius.circular(width * 0.03),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(width * 0.03),
                        ),
                      )),
                ),
                SizedBox(
                  height: width * 0.05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.07,
                    ),
                    Text(
                      "House/Apartment name",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: width * 0.04),
                    ),
                    Text(
                      " *",
                      style: TextStyle(color: Colour.color4),
                    ),
                  ],
                ),
                SizedBox(
                  height: width * 0.02,
                ),
                SizedBox(
                  height: width * 0.16,
                  width: width * 0.88,
                  child: TextFormField(
                      controller: houseController,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter,
                        LengthLimitingTextInputFormatter(20)
                      ],
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w300,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colour.color4,
                          ),
                          borderRadius: BorderRadius.circular(width * 0.03),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(width * 0.03),
                        ),
                      )),
                ),
                SizedBox(
                  height: width * 0.06,
                ),
                InkWell(
                    onTap: () {
                      if (nameController.text != "" &&
                          phoneController.text != "" &&
                          pincodeController.text != "" &&
                          streetController.text != "" &&
                          cityController.text != "" &&
                          countryController.text != "" &&
                          houseController.text != "" &&
                          formKey.currentState!.validate()) {
                        addressDetails();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderDetails(
                                  id: AddressModel(
                                      name: nameController.text,
                                      phone: int.parse(phoneController.text),
                                      pincode:
                                          int.parse(pincodeController.text),
                                      street: streetController.text,
                                      city: cityController.text,
                                      country: countryController.text,
                                      houseName: houseController.text,
                                      id: widget.item2.id,
                                      itemName: widget.item2.name,
                                      itemImage: widget.item2.image,
                                      itemMl: widget.item2.ml,
                                      itemQty: widget.item2.qty.toInt(),
                                      itemRate: widget.item2.rate.toInt() *
                                          widget.item2.qty.toInt(),
                                      userId: userId!,
                                      cart: [])),
                            ));
                      } else {
                        nameController.text == ""
                            ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colour.primarycolour,
                                content: Text("Please enter your Name!")))
                            : phoneController.text == ""
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: Colour.primarycolour,
                                        content: Text(
                                            "Please enter your Phone Number!")))
                                : pincodeController.text == ""
                                    ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        backgroundColor: Colour.primarycolour,
                                        content:
                                            Text("Please enter your Pincode!")))
                                    : streetController.text == ""
                                        ? ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor:
                                                    Colour.primarycolour,
                                                content: Text(
                                                    "Please enter your Street!")))
                                        : cityController.text == ""
                                            ? ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    backgroundColor:
                                                        Colour.primarycolour,
                                                    content: Text("Please enter your City!")))
                                            : countryController.text == ""
                                                ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colour.primarycolour, content: Text("Please enter your Country!")))
                                                : houseController.text == ""
                                                    ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colour.primarycolour, content: Text("Please enter your House/Apartment name!")))
                                                    : ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colour.primarycolour, content: Text("Please enter your Valid Details!")));
// Navigator.pop(context);
                      }
                    },
                    child: Container(
                      height: width * 0.13,
                      width: width * 0.84,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Colour.primarycolour,
                            Colour.lightprimarycolor
                          ],
                        ),
                        borderRadius: BorderRadius.circular(width * 0.04),
                      ),
                      child: Center(
                        child: Text(
                          "Add",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colour.secondarycolour,
                              fontSize: width * 0.05),
                        ),
                      ),
                    )),
                SizedBox(
                  height: width * 0.03,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
