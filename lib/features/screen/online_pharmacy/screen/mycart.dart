import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical/features/screen/online_pharmacy/screen/pharmacy.dart';
import '../../../../../core/constants/colour.dart';
import '../../../../../core/constants/icons.dart';
import '../../../../../main.dart';
import '../../../../../models/medicine_model.dart';
import '../../login_signup/screen/login.dart';
import '../../orders/screen/delivery_address2.dart';

class MyCartPage extends ConsumerStatefulWidget {
  final MedicineModel details;

  // final QuerySnapshot<Map<String, dynamic>> data;

  const MyCartPage({
    super.key,
    required this.details,
    // required this.data,
  });

  @override
  ConsumerState<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends ConsumerState<MyCartPage> {
  double tax = 1.00;
  double totalss = 0;
  bool delete = false;
  int selectedOption = 1;

  subTotal(List data) {
    totalss = 0;
    for (int i = 0; i < data.length; i++) {
      totalss = totalss + data[i]['rate'] * data[i]["qty"];
    }
    print(totalss);
  }

  cartAdd(List data) {
    for (int i = 0; i < data.length; i++) {
      data = currentModel!.cart;
      // ref.read(AddressControllerProvider).updatecart(currentModel!,data);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DeliveryPage2(cartItems: data),
          ));
    }
    print(data);
  }

  @override
  void initState() {
    subTotal(currentModel!.cart);
    setState(() {});
    // TODO: implement initState
    super.initState();
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
                  builder: (context) => PharmacyPage(),
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
          "My Cart",
          style: TextStyle(
              color: Colour.thirdcolour,
              fontWeight: FontWeight.w700,
              fontSize: width * 0.06),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04, bottom: width * 0.04),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.all(width * 0.02),
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: Text("Loading..."));
                      } else {
                        Text("No Products added to Cart");
                      }
                      var data = currentModel!.cart;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return data[index]['qty'] != 0
                              ? Column(
                                  children: [
                                    Container(
                                      height: width * 0.35,
                                      width: width * 0.94,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: width * 0.005,
                                              color: Colors.grey
                                                  .withOpacity(0.15)),
                                          borderRadius: BorderRadius.circular(
                                              width * 0.04)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                              height: width * 0.2,
                                              width: width * 0.27,
                                              child: Image(
                                                  image: NetworkImage(
                                                      data[index]['image']
                                                          .toString()))),
                                          SizedBox(
                                            height: width * 0.27,
                                            width: width * 0.55,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        data[index]['name'],
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize:
                                                                width * 0.045),
                                                      ),
                                                      Text(
                                                        data[index]['ml']
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize:
                                                                width * 0.04,
                                                            color: Colour.gray),
                                                      ),
                                                      SizedBox(
                                                        height: width * 0.03,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          data[index]['qty'] !=
                                                                  0
                                                              ? SizedBox(
                                                                  height:
                                                                      width *
                                                                          0.095,
                                                                  width: width *
                                                                      0.22,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            data[index]['qty']--;
                                                                            await FirebaseFirestore.instance.collection("users").doc(userId!).update({
                                                                              "cart": data,
                                                                            });

                                                                            // totalnprice();
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.remove,
                                                                            color:
                                                                                Colour.color5,
                                                                          )),
                                                                      Text(
                                                                        data[index]['qty']
                                                                            .toString(),
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .w800,
                                                                            fontSize: width *
                                                                                0.04,
                                                                            color:
                                                                                Colour.thirdcolour),
                                                                      ),
                                                                      InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            data[index]['qty']++;

                                                                            await FirebaseFirestore.instance.collection("users").doc(userId!).update({
                                                                              "cart": data,
                                                                            });
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            color:
                                                                                Colour.primarycolour,
                                                                            child:
                                                                                Icon(
                                                                              Icons.add,
                                                                              color: Colour.secondarycolour,
                                                                            ),
                                                                          )),
                                                                    ],
                                                                  ),
                                                                )
                                                              : InkWell(
                                                                  onTap: () {
                                                                    data[index][
                                                                        'qty']++;
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        width *
                                                                            0.095,
                                                                    width:
                                                                        width *
                                                                            0.22,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colour
                                                                          .primarycolour,
                                                                      borderRadius:
                                                                          BorderRadius.circular(width *
                                                                              0.015),
                                                                    ),
                                                                    child: Center(
                                                                        child: Text(
                                                                      "Add item",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colour.secondarycolour),
                                                                    )),
                                                                  ),
                                                                ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: width * 0.23,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                          onTap: () {},
                                                          child:
                                                              SvgPicture.asset(
                                                                  ImageIcons
                                                                      .delete)),
                                                      Text(
                                                        "\$${(data[index]['qty'] * data[index]['rate']).toStringAsFixed(2)}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize:
                                                                width * 0.04),
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
                                    SizedBox(
                                      height: height * 0.02,
                                    )
                                  ],
                                )
                              : Container(
                                  color: Colors.blue,
                                );
                        },
                      );
                    },
                  )),
              SizedBox(
                height: width * 0.05,
              ),
              SizedBox(
                height: width * 0.32,
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
                                fontSize: width * 0.04, color: Colour.gray)),
                        Text("\$${totalss.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: width * 0.042, color: Colour.gray)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Taxes",
                          style: TextStyle(
                              fontSize: width * 0.04, color: Colour.gray),
                        ),
                        Text("\$${tax.toString()}",
                            style: TextStyle(
                                fontSize: width * 0.042,
                                color: Colour.gray)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: width * 0.042),
                        ),
                        Text("\$${(totalss + tax).toStringAsFixed(2)}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.042)),
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
                  SizedBox(
                    height: width * 0.03,
                  ),
                  Row(
                    children: [
                      Center(
                        child: Text(
                          "Payment Method",
                          style: TextStyle(
                              fontSize: width * 0.047,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: width * 0.042,
                  ),
                ],
              ),
              Column(children: [
                Container(
                    height: width * 0.18,
                    width: width * 80,
                    decoration: BoxDecoration(
                        color: Colour.lightgreen,
                        borderRadius: BorderRadius.circular(width * 0.03)),
                    child: ListTile(
                      leading: Container(
                        height: width * 0.07,
                        width: width * 0.07,
                        child: Image(
                          image: NetworkImage(
                              "https://pbs.twimg.com/profile_images/1615271089705463811/v-emhrqu_400x400.png"),
                        ),
                      ),
                      title: Text(
                        "PhonePe",
                        style: TextStyle(
                          fontSize: width * 0.04,
                        ),
                      ),
                      trailing: Radio(
                        value: 1,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        },
                      ),
                    )),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: width * 0.18,
                  width: width * 80,
                  decoration: BoxDecoration(
                      color: Colour.lightgreen,
                      borderRadius: BorderRadius.circular(width * 0.03)),
                  child: ListTile(
                    leading: SizedBox(
                        height: width * 0.07,
                        width: width * 0.07,
                        child: Image(
                            image: NetworkImage(
                                "https://www.computerhope.com/jargon/g/google-pay.png"))),
                    title: Text(
                      "GPay",
                      style: TextStyle(
                        fontSize: width * 0.04,
                      ),
                    ),
                    trailing: Radio(
                      value: 2,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: width * 0.18,
                  width: width * 80,
                  decoration: BoxDecoration(
                      color: Colour.lightgreen,
                      borderRadius: BorderRadius.circular(width * 0.03)),
                  child: ListTile(
                    leading: SvgPicture.asset(ImageIcons.apple),
                    title: Text(
                      "Apple Pay",
                      style: TextStyle(
                        fontSize: width * 0.04,
                      ),
                    ),
                    trailing: Radio(
                      value: 3,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
              ]),
              SizedBox(
                height: width * 0.05,
              ),
              SizedBox(
                height: width * 0.15,
                width: width * 0.9,
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
                          "\$${(totalss + tax).toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: width * 0.03,
                    ),
                    InkWell(
                      onTap: () {
                        cartAdd(currentModel!.cart);
                        // var data= currentModel!.cart;
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryPage(cartItems: [
                        // data['name'],
                        // data[i]['image'],
                        // data[i]['ml'],
                        // data[i]['rate'],
                        // data[i]['id'],
                        // data[i]['qty'],
                        // userId!
                        // ], item2: MedicineModel(
                        // name:  '',
                        // image: '',
                        // ml: '',
                        // rate: 0,
                        // off: 0,
                        // id: '',
                        // des: '',
                        // qty: 0,
                        //  userId: userId!),),));
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
