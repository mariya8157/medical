import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../colour.dart';
import '../../../../icons.dart';
import '../../../../main.dart';

class MyCartPage extends StatefulWidget {
  final List c;
  const MyCartPage({super.key, required this.c});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}
int total =0;
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
  dynamic added;
  List a=[];
  totalprice(){
    for(int i=0;i<widget.c.length;i++){
      if(widget.c[i]["quantity"]>0){
        added=widget.c[i];
        a.add(added);
      }
      // print(a);
      // print("oooooooooooooooooooooooooooooooo");

    }

    setState(() {

    });
  }
  tascprice() {
    total = 0;
    for (int i = 0; i < a.length; i++) {
      total = a[i]["quantity"] * a[i]["Price"] +
          total;
    }
  }
  void initState() {
    totalprice();
    tascprice();
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
          "My Cart",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: width * 0.063),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: width * 0.05,
          ),
          ListView.separated(
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
                                a[index]["image"],
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
                                        a[index]["text1"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: width * 0.06),
                                      ),
                                      Icon(
                                        Icons.delete_outline_rounded,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            a[index]["text2"],
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: width * 0.2,
                                        // color: Colors.red,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.remove,
                                              size: width * 0.08,
                                            ),
                                            Text(
                                              a[index]["text3"],
                                              style: TextStyle(
                                                  fontSize: width * 0.06,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SvgPicture.asset(
                                              a[index]["icon"],
                                              width: width * 0.05,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        a[index]["text4"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: width * 0.06),
                                      )
                                    ],
                                  ),
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
              itemCount: a.length),
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
                    Text("\$25.98",
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
                    Text("\$1.00",
                        style: TextStyle(
                            fontSize: width * 0.045, color: Colors.grey)),
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
                    Text("\$26.98",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.047)),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: width * 0.37,
            width: width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Divider(
                  thickness: width * 0.0005,
                  endIndent: width * 0.01,
                  indent: width * 0.01,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Text(
                      "Payment Method",
                      style: TextStyle(
                          fontSize: width * 0.055, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Container(
                  height: width * 0.16,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.13)),
                      borderRadius: BorderRadius.circular(width * 0.04)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: width * 0.09,
                        width: width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              ImageIcons.visa,
                              width: width * 0.15,
                            ),
                            Text(
                              "Change",
                              style: TextStyle(
                                  fontSize: width * 0.046, color: Colors.grey),
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
          Container(
            height: width * 0.28,
            width: width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: width * 0.16,
                  width: width * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                            fontSize: width * 0.042,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      Text(
                        "\$ 26.98",
                        style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    
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
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.055),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
