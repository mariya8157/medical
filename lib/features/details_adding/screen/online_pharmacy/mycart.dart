import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical/features/details_adding/controller/address_controller.dart';
import 'package:medical/features/details_adding/providers/firebase_provider.dart';
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

  const MyCartPage({super.key, required this.details,});

  @override
  ConsumerState<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends ConsumerState<MyCartPage> {

  dynamic total =0;
  dynamic added;
  List f=[];
  // totalprice(){
  //   for(int i=0;i<widget.d.length;i++){
  //     if(widget.d[i]["text6"]>0){
  //       added=widget.d[i];
  //       f.add(added);
  //     }
  //     print(f);
  //     print("oooooooooooooooooooooooooooooooo");
  //
  //   }
  //
  //   setState(() {
  //
  //   });
  // }
  // totalnprice() {
  //   total = 0;
  //   for (int i = 0; i < f.length; i++) {
  //     total = f[i]["text6"] * f[i]["price"] + total;
  //
  //   }
  //   print(total);
  //   setState(() {
  //
  //   });
  // }

  dynamic total1=0;
  dynamic a=0;
  dynamic b=0;
  dynamic tax= 1.00;
  totalAdd(){
    total1=0;
    a=0;
  //   for(int i=0;i<widget.d.length;i++){
  //     a=widget.d[i]['price']*widget.d[i]["text6"]+a+c;
  //     total1=a+total1;
  //   }
  //   setState(() {
  //
  //   });
  }

  void initState() {
     // TODO: implement initState
    super.initState();
  }

  String? j;
  bool x=false;
  bool y=false;
  bool z=false;
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
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
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
                                    child: Image(image: NetworkImage(cart[index].image.toString()))
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
                                              cart[index].name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: width * 0.045),
                                            ),
                                            Text(
                                              cart[index].ml.toString(),
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
                                                cart[index].qty != 0
                                                    ? Container(
                                                  height: width * 0.095,
                                                  width: width * 0.22,
                                                  decoration: BoxDecoration(
                                                      color: Colour.primarycolour,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          width * 0.03)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                          onTap: () {
                                                            cart[index].qty--;
                                                            // totalnprice();
                                                            setState(() {
                                                            });

                                                          },
                                                          child:  Icon(
                                                            Icons.remove,
                                                            color: Colour.secondarycolour,
                                                          )),
                                                      Text(
                                                        cart[index].qty
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colour.secondarycolour),
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            cart[index].qty++;
                                                            // totalnprice();
                                                            setState(() {

                                                            });
                                                          },
                                                          child: Icon(
                                                            Icons.add,
                                                            color: Colour.secondarycolour,
                                                          )),
                                                    ],
                                                  ),
                                                )
                                                    : InkWell(
                                                  onTap: () {
                                                    cart[index].qty++;
                                                    // totalnprice();
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
                                                          width * 0.03),
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                          "Add item",
                                                          style: TextStyle(
                                                              color: Colour.secondarycolour),
                                                        )),
                                                  ),
                                                ),

                                                Text(
                                                  "${cart[index].qty*cart[index].rate}",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w800,
                                                      fontSize: width * 0.06),
                                                )
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
                                            Container(
                                              child: Row(
                                                children: [
                                                  Text("\$",style: TextStyle(
                                                      fontWeight: FontWeight.w800,
                                                      fontSize: width * 0.04)),
                                                  Text(
                                                    cart[index].rate.toString(),
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w800,
                                                        fontSize: width * 0.04),
                                                  ),
                                                ],
                                              ),
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
                    itemCount:cart.length
                ),
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
                              QuickAlert.show(
                              titleColor: Colour.primarycolour,
                                textColor: Colour.primarycolour,

                                context: context,
                                type: QuickAlertType.success,
                                text: 'Transaction Completed Successfully!',
                                autoCloseDuration: const Duration(seconds: 2),
                                showConfirmBtn: false,
                              );
                            },
                            // onTap: () {
                            //   x = false;
                            //   y = true;
                            //   z = false;
                            //   showDialog(
                            //     barrierDismissible: false,
                            //     context: context,
                            //     builder: (context) {
                            //       return AlertDialog(
                            //         title: Column(
                            //           mainAxisAlignment: MainAxisAlignment.center,
                            //           children: [
                            //             Center(
                            //               child: Text(
                            //                   "Your payment has been successful, \n"
                            //                       "you can have a consultation session \n "
                            //                       "with your trusted doctor",
                            //                 style: TextStyle(fontSize: width*0.044),textAlign:TextAlign.center,
                            //               ),
                            //             ),
                            //             Container(
                            //               height: width*0.13,
                            //               width: width*0.44,
                            //               decoration: BoxDecoration(
                            //                 color: Colour.primarycolour,
                            //                 borderRadius: BorderRadius.circular(width*0.07)
                            //               ),
                            //               child: Center(child: Text("Back to Home",style: TextStyle(fontSize: width*0.05,color: Colors.white,fontWeight: FontWeight.w900),)),
                            //             )
                            //           ],
                            //         ),
                            //
                            //       );
                            //     },
                            //   );
                            //   setState(() {});
                            // },
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
