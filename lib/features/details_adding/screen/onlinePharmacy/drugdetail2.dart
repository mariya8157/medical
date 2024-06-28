import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:givestarreviews/givestarreviews.dart';
import 'package:medical/models/medcinemodal.dart';

// import '../../../../colour.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
// import '../../../../icons.dart';
import '../../../../main.dart';
import '../online_pharmacy/mycart.dart';
// import 'mycart.dart';

class DrugDetailsPage extends StatefulWidget {
  final MedicineModel detail;
  const DrugDetailsPage({super.key, required this.detail});

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

  double price = 0;
  double quantity = 1;
  totalnprice() {
    total = 0;
    total = price * quantity;
    print(total);
    setState(() {});
  }

  qtyAdd() {
    quantity = quantity + 1;
    totalnprice();
  }

  qtyMinus() {
    quantity = quantity - 1;
    totalnprice();
  }

  void initState() {
    price = widget.detail.rate;
    // quantity = widget.detail.;
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
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: width * 0.05,
                  ),
                  Center(
                    child: Image.network(
                      widget.detail.image,
                      width: width * 0.7,
                    ),
                  ),
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
                          widget.detail.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: width * 0.057),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.detail.ml,
                              style: TextStyle(
                                  color: Colors.grey, fontSize: width * 0.05),
                            ),
                            //     SvgPicture.asset(
                            //   d[index]["icon1"],
                            //   width: width * 0.06,
                            // )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            widget.detail.qty != 1
                                ? Container(
                                    height: width * 0.095,
                                    width: width * 0.22,
                                    decoration: BoxDecoration(
                                        color: Colour.primarycolour,
                                        borderRadius: BorderRadius.circular(
                                            width * 0.03)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              widget.detail.qty--;
                                              totalnprice();
                                              qtyMinus();
                                              setState(() {});
                                            },
                                            child: const Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            )),
                                        Text(
                                          quantity.toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              widget.detail.qty++;
                                              totalnprice();
                                              qtyAdd();
                                              setState(() {});
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
                                      widget.detail.qty++;
                                      totalnprice();
                                      qtyAdd();
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: width * 0.095,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                        color: Colour.primarycolour,
                                        borderRadius:
                                            BorderRadius.circular(width * 0.03),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "Add item",
                                        style: TextStyle(color: Colors.white),
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
                  Container(
                    height: width * 0.09,
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
                        // Text(
                        //   d[index]["text5"],
                        //   style: TextStyle(color: Colors.grey),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: width * 0.05,
                  ),
                  Container(
                    height: width * 0.45,
                    width: width * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: width * 0.14,
                              width: width * 0.14,
                              decoration: BoxDecoration(
                                  color: Colors.lightGreen.withOpacity(0.09),
                                  borderRadius:
                                      BorderRadius.circular(width * 0.02)),
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.green,
                              ),
                            ),
                            InkWell(
                              // onTap: () {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => MyCartPage(
                              //           d: d,
                              //         ),
                              //       ));
                              // },
                              child: Container(
                                height: width * 0.14,
                                width: width * 0.64,
                                decoration: BoxDecoration(
                                    color: Colour.primarycolour,
                                    borderRadius:
                                        BorderRadius.circular(width * 0.07)),
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
              )
            ],
          ),
        ));
  }
}
