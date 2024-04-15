import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical/colour.dart';

import '../../../../icons.dart';
import '../../../../main.dart';

class DrugDetailsPage extends StatefulWidget {

  const DrugDetailsPage({super.key});

  @override
  State<DrugDetailsPage> createState() => _DrugDetailsPageState();
}
int total = 0;
class _DrugDetailsPageState extends State<DrugDetailsPage> {
  dynamic added;
  List a=[];
  // totalprice(){
  //   for(int i=0;i<widget.c.length;i++){
  //     if(widget.c[i]["quantity"]>0){
  //       added=widget.c[i];
  //       a.add(added);
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
  totalprice() {
    total = 0;
    for (int i = 0; i < a.length; i++) {
      total = a[i]["quantity"] * a[i]["Price"] +
          total;
    }
  }
  void initState() {
    totalprice();
    // tascprice();
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
        actions: [
          Row(
            children: [
              Icon(Icons.shopping_cart_outlined),
              // SvgPicture.asset(ImageIcons.columnDot),
              SizedBox(
                width: width * 0.05,
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: width * 0.05,
          ),
          Center(child: Image.asset(ImageIcons.herbal)),
          SizedBox(
            height: width * 0.05,
          ),
          Container(
            height: width * 0.4,
            width: width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "OBH Combi",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: width * 0.057),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "75ml",
                      style:
                          TextStyle(color: Colors.grey, fontSize: width * 0.05),
                    ),
                    SvgPicture.asset(ImageIcons.heart)
                  ],
                ),
                SvgPicture.asset(ImageIcons.star4),
                SizedBox(
                  height: width * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.remove,
                          size: width * 0.09,
                        ),
                        Text(
                          "  1   ",
                          style: TextStyle(
                              fontSize: width * 0.06,
                              fontWeight: FontWeight.w700),
                        ),
                        InkWell(
                          // onTap: () {
                          //   c[index]
                          //   ["quantity"] ++;
                          //   // totalprice();
                          //   setState(() {});
                          // },
                          child: SvgPicture.asset(
                            ImageIcons.c_add,
                            width: width * 0.05,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "$total",
                      style: TextStyle(
                          fontWeight: FontWeight.w800, fontSize: width * 0.06),
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
            height: width * 0.3,
            width: width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Description",
                  style: TextStyle(
                      fontSize: width * 0.053, fontWeight: FontWeight.w600),
                ),
                Text(
                  "OBH COMBI  is a cough medicine containing,"
                  " Paracetamol, Ephedrine HCl, and Chlorphenamine maleate"
                  " which is used to relieve coughs accompanied by flu symptoms "
                  "such as fever, headache, and sneezing...Read more ",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Container(
            height: width * 0.488,
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
                          borderRadius: BorderRadius.circular(width * 0.02)),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.green,
                      ),
                    ),
                    Container(
                      height: width * 0.14,
                      width: width * 0.64,
                      decoration: BoxDecoration(
                          color: Colour.primarycolour,
                          borderRadius: BorderRadius.circular(width * 0.07)),
                      child: Center(
                        child: Text(
                          "Buy Now",
                          style: TextStyle(
                              fontSize: width * 0.06,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
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
    );
  }
}
