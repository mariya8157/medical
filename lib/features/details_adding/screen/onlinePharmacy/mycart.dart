import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../colour.dart';
import '../../../../icons.dart';
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
                          "\$$total1",
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
      ),
    );
  }
}
