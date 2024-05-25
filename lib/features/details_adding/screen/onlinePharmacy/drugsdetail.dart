import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:givestarreviews/givestarreviews.dart';

import '../../../../core/colour.dart';
import '../../../../core/icons.dart';
import '../../../../main.dart';
import 'mycart.dart';

class DrugDetailsPage extends StatefulWidget {
  final List c;
  final List a;
  const DrugDetailsPage({super.key, required this.c, required this.a});

  @override
  State<DrugDetailsPage> createState() => _DrugDetailsPageState();
}

class _DrugDetailsPageState extends State<DrugDetailsPage> {
  List d = [];
  dynamic added;
  dynamic total = 0;
  // totalprice(){
  //   for(int i=0;i>widget.c.length;i++){
  //     if(widget.c[i]["quantity"]>0){
  //       added=widget.c[i];
  //       d.add(added);
  //     }
  //     // print(a);
  //     // print("oooooooooooooooooooooooooooooooo");
  //
  //   }
  //
  //   setState(() {
  //
  //   });
  // }
  totalnprice() {
    total = 0;
    for (int i = 0; i < d.length; i++) {
      total = d[i]["text6"] * d[i]["price"] + total;

    }
    print(total);
    setState(() {

    });
  }

  void initState() {
    if (widget.c.isNotEmpty) {
      d = widget.c;
    } else {
      d = widget.a;
    }
    // totalprice();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
            "Drugs Detail",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: width * 0.063),
          ),

        ),
        body: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream:  FirebaseFirestore.instance.collection("Exam").snapshots(),
              builder: (context, snapshot) {
                return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: width * 0.05,
                            ),
                            Center(child: Image.asset(d[index]["image"])),
                            SizedBox(
                              height: width * 0.05,
                            ),
                            Container(
                              height: width * 0.45,
                              width: width * 0.9,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    d[index]["text1"],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: width * 0.057),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        d[index]["text2"],
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: width * 0.05),
                                      ),
                                      //     SvgPicture.asset(
                                      //   d[index]["icon1"],
                                      //   width: width * 0.06,
                                      // )
                                    ],
                                  ),
                
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      d[index]["text6"] != 0
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
                                                    d[index]["text6"]--;
                                                    totalnprice();
                                                    setState(() {
                                                  });
                
                                                },
                                                child: const Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                )),
                                            Text(
                                              d[index]["text6"]
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  d[index]["text6"]++;
                                                  totalnprice();
                                                  setState(() {
                
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                )),
                                          ],
                                        ),
                                      )
                                          : InkWell(
                                        onTap: () {
                                          d[index]["text6"]++;
                                          totalnprice();
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
                                                    color: Colors.white),
                                              )),
                                        ),
                                      ),
                                      // InkWell(
                                      //   onTap: () {
                                      //     d[index]["text6"]--;
                                      //     totalnprice();
                                      //     setState(() {});
                                      //   },
                                      //   child: Icon(
                                      //     Icons.remove,
                                      //     size: width * 0.09,
                                      //   ),
                                      // ),
                                      //     // SizedBox(),
                                      // Text(
                                      //   d[index]["text6"].toString(),
                                      //   style: TextStyle(
                                      //       fontSize: width * 0.06,
                                      //       fontWeight: FontWeight.w700),
                                      // ),
                                      // InkWell(
                                      //   onTap: () {
                                      //     d[index]["quantity"]++;
                                      //     totalnprice();
                                      //     setState(() {});
                                      //   },
                                      //   child: SvgPicture.asset(
                                      //     d[index]["icon"],
                                      //     width: width * 0.05,
                                      //   ),
                                      // ),
                                      Text(
                                       "\$${total.toStringAsFixed(2)}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: width * 0.06),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: width * 0.05,
                            ),
                            Container(
                              height: width * 0.37,
                              width: width * 0.9,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Description",
                                    style: TextStyle(
                                        fontSize: width * 0.053,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    d[index]["text5"],
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: width*0.05,),
                            Container(
                              height: width * 0.45,
                              width: width * 0.9,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: width * 0.14,
                                        width: width * 0.14,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.lightGreen.withOpacity(0.09),
                                            borderRadius: BorderRadius.circular(
                                                width * 0.02)),
                                        child: Icon(
                                          Icons.shopping_cart_outlined,
                                          color: Colors.green,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context, MaterialPageRoute(
                                            builder: (context) => MyCartPage(d: d,),));
                                        },
                                        child: Container(
                                          height: width * 0.14,
                                          width: width * 0.64,
                                          decoration: BoxDecoration(
                                              color: Colour.primarycolour,
                                              borderRadius: BorderRadius.circular(
                                                  width * 0.07)),
                                          child: Center(
                                            child: Text(
                                              "Buy Now",
                                              style: TextStyle(
                                                  fontSize: width * 0.06,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: width * 0.02,
                        );
                      },
                      itemCount: d.length),
                );
              }
            )
          ],
        ));
  }
}
