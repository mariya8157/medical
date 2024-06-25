import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../core/constants/images.dart';
import '../../../../main.dart';

class MyCartPage extends StatefulWidget {
  final List d;
  const MyCartPage({super.key,  required this.d});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  // List a = [
  //   {
  //     "image": ImageIcons.herbal,
  //     "text1": "OBH Combi",
  //     "text2": "75ml",
  //     "text3": "1",
  //     "icon": ImageIcons.c_add,
  //     "text4": "\$9.99",
  //   },
  //   {
  //     "image": ImageIcons.calvit,
  //     "text1": "Panadol",
  //     "text2": "20pcs",
  //     "text3": "2",
  //     "icon": ImageIcons.c_add,
  //     "text4": "\$15.99",
  //   },
  // ];
  dynamic total =0;
  dynamic added;
  List f=[];
  totalprice(){
    for(int i=0;i<widget.d.length;i++){
      if(widget.d[i]["text6"]>0){
        added=widget.d[i];
        f.add(added);
      }
      print(f);
      print("oooooooooooooooooooooooooooooooo");

    }

    setState(() {

    });
  }
  totalnprice() {
    total = 0;
    for (int i = 0; i < f.length; i++) {
      total = f[i]["text6"] * f[i]["price"] + total;

    }
    print(total);
    setState(() {

    });
  }

  dynamic total1=0;
  dynamic a=0;
  dynamic b=0;
  dynamic c= 1.00;
  totalAdd(){
    total1=0;
    a=0;
    for(int i=0;i<widget.d.length;i++){
      a=widget.d[i]['price']*widget.d[i]["text6"]+a+c;
      total1=a+total1;
    }
    setState(() {

    });
  }

  void initState() {
    totalprice();
    totalnprice();
    totalAdd();
    // TODO: implement initState
    super.initState();
  }
  int selectedOption=1;
  int activeIndex=0;

  String? j;

  int count=0;

  bool x=false;
  bool y=false;
  bool z=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.secondarycolour,
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
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: width * 0.063),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: width * 0.05,
            ),
            f.isEmpty?Center(child: Text("Empty")):Container(

              margin: EdgeInsets.all(width*0.02),
              child: ListView.separated(

                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Center(
                          child: Container(
                            height: width * 0.35,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.15)),
                                borderRadius: BorderRadius.circular(width * 0.04)),
                            child: Row(
                              children: [
                                Container(
                                  height: width * 0.2,
                                  width: width * 0.27,
                                  child: Image.asset(
                                    f[index]["image"],
                                    width: width * 0.25,
                                  ),
                                ),
                                Container(
                                  height: width * 0.27,
                                  width: width * 0.6,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            f[index]["text1"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: width * 0.06),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                f[index]["text2"],
                                                style: TextStyle(
                                                    fontSize: width * 0.05,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: width * 0.03,
                                      ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Text("Price",style: TextStyle(fontSize: width*0.063,fontWeight: FontWeight.w900),),
                                      Text(
                                        "\$$total",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: width * 0.06),
                                      )
                                    ],
                                  )
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
                  itemCount: f.length
              ),
            ),
            SizedBox(
              height: width * 0.05,
            ),
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
                        fontSize: width * 0.05, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: width * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal",
                          style: TextStyle(
                              fontSize: width * 0.043, color: Colors.grey)),
                      Text("\$$total",
                          style: TextStyle(
                              fontSize: width * 0.045, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Taxes",
                        style: TextStyle(
                            fontSize: width * 0.043, color: Colors.grey),
                      ),
                      Row(
                        children: [
                          Text("\$", style: TextStyle(
                              fontSize: width * 0.045, color: Colors.grey)),
                          Text(c.toString(),
                              style: TextStyle(
                                  fontSize: width * 0.045, color: Colors.grey)),
                          Text("0")
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
                            fontWeight: FontWeight.w600, fontSize: width * 0.047),
                      ),
                      Text("\$$total1",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: width * 0.047)),
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
                  color: Colors.grey,
                ),
                SizedBox(height: width*0.03,),
                Row(
                  children: [
                    SizedBox(width: width*0.05,),
                    Text(
                      "Payment Method",
                      style: TextStyle(
                          fontSize: width * 0.055, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: width*0.042,),
                // Column(
                //     children: [
                //       Container(
                //           height: width*0.18,
                //           width: width*80,
                //           decoration: BoxDecoration(
                //               color: Colour.lightgreen,
                //               borderRadius: BorderRadius.circular(width*0.03)
                //           ),
                //
                //
                //
                //           child: ListTile(
                //             leading: Container(
                //               height: width*0.07,
                //               width: width*0.07,
                //               child: Image(image: NetworkImage("https://pbs.twimg.com/profile_images/1615271089705463811/v-emhrqu_400x400.png"),
                //                 // SvgPicture.asset(ImageIcons.paypal,
                //                 // color: Colors.red,
                //                 // fit: BoxFit.fill,
                //               ),),
                //             title: Text("PhonePe"),
                //             trailing: Radio(value: 1,
                //               groupValue: selectedOption,
                //               onChanged: ( value) {
                //                 setState(() {
                //                   selectedOption=value!;
                //                 });
                //               },
                //             ),
                //           )),
                //       SizedBox(height: height*0.01,),
                //
                //       Container(
                //         height: width*0.18,
                //         width: width*80,
                //         decoration: BoxDecoration(
                //             color: Colour.lightgreen,
                //             borderRadius: BorderRadius.circular(width*0.03)
                //         ),
                //         child: ListTile(
                //           leading: Container(
                //               height: width*0.07,
                //               width: width*0.07,
                //               child: Image(image: NetworkImage("https://www.computerhope.com/jargon/g/google-pay.png"))),
                //           title: Text("GPay"),
                //           trailing: Radio(value: 2,
                //             groupValue: selectedOption,
                //             onChanged: ( value) {
                //               setState(() {
                //                 selectedOption=value!;
                //               });
                //             },),
                //         ),),
                //       SizedBox(height: height*0.01,),
                //
                //       Container(
                //         height: width*0.18,
                //         width: width*80,
                //         decoration: BoxDecoration(
                //             color: Colour.lightgreen,
                //             borderRadius: BorderRadius.circular(width*0.03)
                //         ),
                //         child: ListTile(
                //           leading: SvgPicture.asset(ImageIcons.apple),
                //           title: Text("Apple Pay"),
                //           trailing: Radio(value: 3,
                //             groupValue: selectedOption,
                //             onChanged: ( value) {
                //               setState(() {
                //                 selectedOption=value!;
                //               });
                //             },),),
                //       ),
                //       SizedBox(height: height*0.01,),
                //
                //       // Container(
                //       //   height: width*0.18,
                //       //   width: width*80,
                //       //   color: Colors.blue,
                //       //   child: ListTile(
                //       //     leading: SvgPicture.asset(ImageIcons.circle),
                //       //     title: Text("**** **** **** ****4679"),
                //       //     trailing: Radio(value: 4,
                //       //       groupValue: selectedOption,
                //       //       onChanged: ( value) {
                //       //         setState(() {
                //       //           selectedOption=value!;
                //       //         });
                //       //       },),
                //       //   ),)
                //     ]
                // ),

              ],
            ),
            Container(
              height: width * 0.66,
              width: width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.white,
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
                    title: Text("PhonePe",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width*0.05),),
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
                    title: Text("Google Pay",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width*0.05),),
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
                    title: Text("Paytm",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width*0.05),),
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
            SizedBox(height: width*0.03,)
          ],
        ),
      ),
    );
  }
}
