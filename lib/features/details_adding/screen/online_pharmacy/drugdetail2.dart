import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:givestarreviews/givestarreviews.dart';
import 'package:medical/features/details_adding/screen/online_pharmacy/delivery_address.dart';
import 'package:medical/models/medicine_model.dart';

import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../main.dart';
import 'mycart.dart';

class DrugDetailsPage2 extends StatefulWidget {
  final MedicineModel med2;
  const DrugDetailsPage2({super.key, required this.med2});

  @override
  State<DrugDetailsPage2> createState() => _DrugDetailsPage2State();
}

class _DrugDetailsPage2State extends State<DrugDetailsPage2> {
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
    // totalprice();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colour.secondarycolour,
        appBar: AppBar(
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
            "Drugs Detail",
            style: TextStyle(
                color: Colour.thirdcolour,
                fontWeight: FontWeight.w700,
                fontSize: width * 0.04),
          ),

        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(width*0.03),
            child: Column(
              children: [
                SizedBox(
                  height: width * 0.05,
                ),
                Container(
                    height: height*0.25,
                    width: width*0.5,
                    child: Image(image: NetworkImage(widget.med2.image,),fit: BoxFit.fill,)),
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
                        widget.med2.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: width * 0.04),
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.med2.ml,
                            style: TextStyle(
                                color: Colour.gray,
                                fontSize: width * 0.04),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          widget.med2.qty != 0
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
                                      widget.med2.qty--;
                                      totalnprice();
                                      setState(() {
                                      });

                                    },
                                    child:  Icon(
                                      Icons.remove,
                                      color: Colour.secondarycolour,
                                    )),
                                Text(
                                  widget.med2.qty
                                      .toString(),
                                  style: TextStyle(
                                      color: Colour.secondarycolour),
                                ),
                                InkWell(
                                    onTap: () {
                                      widget.med2.qty++;
                                      totalnprice();
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
                              widget.med2.qty++;
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
                                        color: Colour.secondarycolour),
                                  )),
                            ),
                          ),

                          Text(
                            "${widget.med2.qty*widget.med2.rate}",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: width * 0.04),
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
                  width: width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: height*0.03,),
                      Text(
                        widget.med2.des,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height*0.15,),
                Container(
                  height: width * 0.15,
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
                              MedicineModel itemDtails= MedicineModel(
                                  name: widget.med2.name.toString(),
                                  image: widget.med2.image.toString(),
                                  ml: widget.med2.ml.toString(),
                                  rate: widget.med2.rate,
                                  off: widget.med2.off,
                                  id: widget.med2.id.toString(),
                                  des: '',
                                  qty: widget.med2.qty,
                                  userId: '');
                              Navigator.push(
                                  context, MaterialPageRoute(
                                builder: (context) => DeliveryPage(item2: itemDtails,)));
                            },
                            child: Container(
                              height: width * 0.12,
                              width: width * 0.62,
                              decoration: BoxDecoration(
                                  color: Colour.primarycolour,
                                  borderRadius: BorderRadius.circular(
                                      width * 0.07)),
                              child: Center(
                                child: Text(
                                  "Buy Now",
                                  style: TextStyle(
                                      fontSize: width * 0.045,
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
            ),
          ),
        ));
  }
}
