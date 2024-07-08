import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical/features/details_adding/controller/address_controller.dart';
import 'package:medical/features/details_adding/providers/firebase_provider.dart';
import 'package:medical/features/details_adding/screen/online_pharmacy/delivery_address.dart';
import 'package:medical/models/address_model.dart';
import 'package:pinput/pinput.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../core/constants/images.dart';
import '../../../../main.dart';
import '../../../../models/medicine_model.dart';

class MyCartPage extends ConsumerStatefulWidget {
  final MedicineModel details;
  // final QuerySnapshot<Map<String, dynamic>> data;

  const MyCartPage({super.key, required this.details,
    // required this.data,
  });

  @override
  ConsumerState<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends ConsumerState<MyCartPage> {

  dynamic total =0;
  dynamic added;

  dynamic total1=0;
  dynamic a=0;
  dynamic b=0;
  dynamic tax= 1.00;
  totalAdd(){
    total1=0;
    a=0;
  }

  String? j;
  bool x=false;
  bool y=false;
  bool z=false;
 @override

  // double total = 0;
  // double totalPrice = 0;
  // double discount = 0;
  // double shippingCharge = 50;
  // addingTotal() {
  //   total = 0;
  //   for (int i = 0; i < cartMeats.length; i++){
  //     total = cartMeats[i]['qty'] * cartMeats[i]['rate'] + total;
  //     totalPrice = total - discount + shippingCharge;
  //   }
  // }
  // List meatDetailCollection = [];
  // List cartMeats = [];
  // // List orderHistory=[];
  // bool loading = false;
  // bool? loggedIn;
  // Future <void> loadData()  async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   loggedIn = prefs.getBool('LoggedIn') ?? false;
  //   String? jsonString = prefs.getString("cart");
  //   String? jsonString2 = prefs.getString("cart2");
  //   if (jsonString != null  && jsonString2 != null) {
  //     meatDetailCollection = json.decode(jsonString);
  //     addCart = json.decode(jsonString2);
  //     setState(() {
  //
  //     });
  //     for(int i = 0; i < meatDetailCollection.length; i++) {
  //       String meatCategory = meatDetailCollection[i]["category"];
  //       String meatType = meatDetailCollection[i]["type"];
  //       String meatId = meatDetailCollection[i]["id"];
  //       var data = await FirebaseFirestore.instance.collection("meatTypes")
  //           .doc(meatType)
  //           .collection(meatType).doc(meatCategory)
  //           .collection(meatType).doc(meatId)
  //           .get();
  //       if (data.exists) {
  //         // cartMeats.add(CartMeatModel(
  //         //     name: data['name'],
  //         //     image: data['Image'],
  //         //     description: data['description'],
  //         //     category: data['category'],
  //         //     id: data['id'],
  //         //     ingredients: data['ingredients'],
  //         //     type: data['type'],
  //         //     quantity: (data['quantity']).toDouble(),
  //         //     qty: (data['qty']).toDouble(),
  //         //     rate: (data['rate']).toDouble()));
  //         cartMeats.add({
  //           "image": data["Image"],
  //           "id": data["id"],
  //           "name": data["name"],
  //           "rate": data["rate"],
  //           "ingredients": data["ingredients"],
  //           "qty": 0.5,
  //         });
  //       } else {
  //         meatDetailCollection.removeAt(i);
  //         addCart.removeAt(i);
  //         saveData();
  //       }
  //       setState(() {
  //
  //       });
  //     }
  //   }
  //   addingTotal();
  // }
  // Future <void> saveData()async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String jsonString = json.encode(meatDetailCollection);
  //   String jsonString2 = json.encode(addCart);
  //   prefs.setString("cart", jsonString);
  //   prefs.setString("cart2", jsonString2);
  //   }
  @override
  Widget build(BuildContext context) {
    final cart=ref.watch(cartNotifier);
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
              "My Cart",
              style: TextStyle(
                  color: Colour.thirdcolour,
                  fontWeight: FontWeight.w700,
                  fontSize: width * 0.063),
            ),
          ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width*0.04),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(width*0.02),
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance.collection("users").snapshots(),
                  builder: (context, snapshot){
                    if(!snapshot.hasData){
                      return Center(child:Text("Loading..."));
                    }
                    var data =currentModel!.cart;
                    return ListView.separated(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount:data.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
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
                                        child: Image(image: NetworkImage(data[index]['image'].toString()))
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
                                                  data[index]['name'],
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w800,
                                                      fontSize: width * 0.045),
                                                ),
                                                Text(
                                                  data[index]['ml'].toString(),
                                                  style: TextStyle(
                                                      fontSize: width * 0.04,
                                                      color: Colour.gray),
                                                ),
                                                SizedBox(
                                                  height: width * 0.03,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    data[index]['qty'] != 0
                                                        ? Container(
                                                      height: width * 0.095,
                                                      width: width * 0.22,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          InkWell(
                                                              onTap: () {
                                                                data[index]['qty']--;
                                                                // totalnprice();
                                                                setState(() {
                                                                });

                                                              },
                                                              child:  Icon(
                                                                Icons.remove,
                                                                color: Colour.color5,
                                                              )),
                                                          Text(
                                                            data[index]['qty']
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.w800,
                                                                fontSize: width * 0.04,
                                                                color: Colour.thirdcolour),
                                                          ),
                                                          InkWell(
                                                              onTap: () {
                                                                data[index]['qty']++;
                                                                setState(() {

                                                                });
                                                              },
                                                              child: Container(
                                                                color: Colour.primarycolour,
                                                                child: Icon(
                                                                  Icons.add,
                                                                  color: Colour.secondarycolour,
                                                                ),
                                                              )),
                                                        ],
                                                      ),
                                                    )
                                                        : InkWell(
                                                      onTap: () {
                                                        data[index]['qty']++;
                                                        setState(() {

                                                        });
                                                      },
                                                      child: Container(
                                                        height: width * 0.095,
                                                        width: width * 0.22,
                                                        decoration: BoxDecoration(
                                                          color: Colour.primarycolour,
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              width * 0.015),
                                                        ),
                                                        child: Center(
                                                            child: Text(
                                                              "Add item",
                                                              style: TextStyle(
                                                                  color: Colour.secondarycolour),
                                                            )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: width*0.23,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                InkWell(
                                                    onTap:() {

                                                    },
                                                    child: SvgPicture.asset(ImageIcons.delete)),
                                                Text(
                                                  "\$${data[index]['qty']*data[index]['rate']}",
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
                              // SizedBox(height: width*0.03,),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: width * 0.05,
                          );
                        },
                    );
                  },
                )

              ),

          SizedBox(height: width * 0.05,),
                    Container(
                      height: width * 0.3,
                      width: width * 0.9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Payment Detail",
                            style: TextStyle(
                                fontSize: width * 0.047, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Subtotal",
                                  style: TextStyle(
                                      fontSize: width * 0.043, color: Colour.gray)),
                              Text("\$$total",
                                  style: TextStyle(
                                      fontSize: width * 0.045, color: Colour.gray)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Taxes",
                                style: TextStyle(
                                    fontSize: width * 0.043, color: Colour.gray),
                              ),
                              Row(
                                children: [
                                  Text("\$", style: TextStyle(
                                      fontSize: width * 0.045, color: Colour.gray)),
                                  Text(tax.toString(),
                                      style: TextStyle(
                                          fontSize: width * 0.045, color: Colour.gray)),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: width * 0.045),
                              ),
                              Text("\$$total1",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: width * 0.045)),
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Divider(
                          thickness: width * 0.0005,
                          endIndent: width * 0.05,
                          indent: width * 0.05,
                          color: Colour.gray,
                        ),
                        SizedBox(height: width*0.03,),
                        Row(
                          children: [
                            Center(
                              child: Text(
                                "Payment Method",
                                style: TextStyle(
                                    fontSize: width * 0.047, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: width*0.042,),
                        ],
                    ),
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
                    SizedBox(height: width*0.05,),
                    Container(
                      height: width*0.13,
                      width: width*0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                    fontSize: width * 0.042,
                                    fontWeight: FontWeight.w500,
                                    color: Colour.gray),
                              ),
                              Text(
                                "\$$total1",
                                style: TextStyle(
                                    fontSize: width * 0.045,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                          SizedBox(height: width*0.03,),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryPage(cartItems: CartNotifier(), item2: MedicineModel(
                                  name: '',
                                  image: '',
                                  ml: '',
                                  rate: 0,
                                  off: 0,
                                  id: '',
                                  des: '',
                                  qty: 0,
                                  userId: ''),),));
                            },
                            child: Container(
                              height: width * 0.15,
                              width: width * 0.55,
                              decoration: BoxDecoration(
                                  color: Colour.primarycolour,
                                  borderRadius: BorderRadius.circular(width * 0.9)),
                              child: Center(
                                child: Text(
                                  "Checkout",
                                  style: TextStyle(
                                      color: Colour.secondarycolour,
                                      fontWeight: FontWeight.w600,
                                      fontSize: width * 0.055),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
