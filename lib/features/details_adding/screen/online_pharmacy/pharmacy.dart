import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../core/constants/images.dart';
import '../../../../main.dart';
import '../../controller/medicine_controller.dart';
import 'drugsdetail.dart';
import 'mycart.dart';

class PharmacyPage extends ConsumerStatefulWidget {
  const PharmacyPage({super.key});

  @override
  ConsumerState<PharmacyPage> createState() => _PharmacyPageState();
}

class _PharmacyPageState extends ConsumerState<PharmacyPage> {
  TextEditingController drugsControl = TextEditingController();
  List a = [
    {
      "image": ImagePictures.panadol,
      "text1": "Panadol",
      "text2": "20pcs",
      "text3": "\$15.98",
      "price": 15.98,
      "icon": ImageIcons.c_add,
      "icon1": ImageIcons.heart,
      "text6": 0,
      "text5": "PANADOL  is a cough medicine containing,"
          " Paracetamol, Ephedrine HCl, and Chlorphenamine maleate"
          "such as fever, headache, and sneezing...",
    },
    {
      "image": ImagePictures.herbal,
      "text1": "Bodrex Herbal",
      "text2": "100ml",
      "text3": "\$7.99",
      "price": 7.99,
      "icon": ImageIcons.c_add,
      "icon1": ImageIcons.heart,
      "text6": 0,
      "text5": "BODREX HERBAL  is a cough medicine containing,"
          " Paracetamol, Ephedrine HCl, and Chlorphenamine maleate"
          "such as fever, headache, and sneezing...",
    },
    {
      "image": ImagePictures.konidin,
      "text1": "Konidin",
      "text2": "3pcs",
      "text3": "\$5.99",
      "price": 5.99,
      "icon": ImageIcons.c_add,
      "icon1": ImageIcons.heart,
      "text6": 0,
      "text5": "KONIDIN  is a cough medicine containing,"
          " Paracetamol, Ephedrine HCl, and Chlorphenamine maleate"
          "such as fever, headache, and sneezing...",
    },
  ];
  List c = [
    {
      "image": ImagePictures.calvit,
      "text1": "OBH Combi",
      "text2": "75ml",
      "text3": "\$9.99",
      "price": 9.99,
      "text4": "\$10.99",
      "icon": ImageIcons.c_add,
      "icon1": ImageIcons.heart,
      "text6": 0,
      "text5": "OBH COMBI  is a cough medicine containing,"
          " Paracetamol, Ephedrine HCl, and Chlorphenamine maleate"
          "such as fever, headache, and sneezing...",
    },
    {
      "image": ImagePictures.herbal,
      "text1": "Betadine",
      "text2": "50ml",
      "text3": "\$6.99",
      "price": 6.99,
      "text4": "\$8.99",
      "icon": ImageIcons.c_add,
      "icon1": ImageIcons.heart,
      "text6": 0,
      "text5": "Betadine  is a cough medicine containing,"
          " Paracetamol, Ephedrine HCl, and Chlorphenamine maleate"
          "such as fever, headache, and sneezing...",
    },
    {
      "image": ImagePictures.konidin,
      "text1": "Bodrexin",
      "text2": "75ml",
      "text3": "\$7.99",
      "price": 7.99,
      "text4": "\$8.99",
      "icon": ImageIcons.c_add,
      "icon1": ImageIcons.heart,
      "text6": 0,
      "text5": " Bodrexin is a cough medicine containing,"
          " Paracetamol, Ephedrine HCl, and Chlorphenamine maleate"
          "such as fever, headache, and sneezing...",
    },
  ];
  bool r = false;
  bool t = false;

  int count = 0;
  int selectindex = 0;
  int selectindex1 = 0;
  List d = [];
  List f = [];

  bool k = false;
  bool g = false;
  bool o = false;

  bool x = false;
  bool y = false;
  bool z = false;
  List<int> favorite = [];
  List<int> favorite1 = [];
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
          "Pharmacy",
          style: TextStyle(
              color: Colour.thirdcolour,
              fontWeight: FontWeight.w700,
              fontSize: width * 0.063),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: width * 0.7,
            width: width * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Container(
                    height: width * 0.13,
                    width: width * 0.88,
                    decoration: BoxDecoration(
                      color: Colour.gray.withOpacity(0.07),
                      border:
                          Border.all(color: Colour.lightgreen.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(width * 0.08),
                    ),
                    child: TextFormField(
                      controller: drugsControl,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(
                          fontSize: width * 0.04, fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        prefixIcon: SizedBox(
                            height: width * 0.03,
                            width: width * 0.05,
                            child: Center(
                                child: SvgPicture.asset(
                              ImageIcons.search,
                              width: width * 0.06,
                            ))),
                        // suffixText:"kousar",

                        labelStyle: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w500,
                        ),
                        hintText: "Search drugs, category...",
                        hintStyle: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w600,
                        ),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colour.lightgreen.withOpacity(0.03),
                          ),
                          borderRadius: BorderRadius.circular(width * 0.08),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: width * 0.4,
                  width: width * 0.877,
                  decoration: BoxDecoration(
                      color: Colors.lightGreen.withOpacity(0.09),
                      borderRadius: BorderRadius.circular(width * 0.03)),
                  child: Row(
                    children: [
                      Center(
                        child: Container(
                          height: width * 0.28,
                          width: width * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Order quickly with\nPrescription",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: width * 0.05),
                              ),
                              Container(
                                height: width * 0.099,
                                width: width * 0.33,
                                decoration: BoxDecoration(
                                    color: Colour.primarycolour,
                                    borderRadius:
                                        BorderRadius.circular(width * 0.02)),
                                child: Center(
                                    child: Text(
                                  "Upload Prescription",
                                  style: TextStyle(
                                      color: Colour.secondarycolour,
                                      fontWeight: FontWeight.w700),
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image.asset(
                        ImagePictures.tablet,
                        width: width * 0.37,
                      ),
                      // SizedBox(width: width*0.03,)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: width * 0.13,
                  width: width * 0.58,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Trending Articles",
                        style: TextStyle(
                            fontSize: width * 0.07,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )),
              Row(
                children: [
                  o == false
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              k = true;
                              g = true;
                              o = true;
                            });
                          },
                          child: Container(
                              height: width * 0.13,
                              width: width * 0.25,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "See all",
                                    style: TextStyle(
                                        fontSize: width * 0.045,
                                        color: Colour.primarycolour),
                                  ),
                                ],
                              )),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              // k = false;
                              // g = true;
                              // o = false;
                            });
                          },
                          child: Container(
                              height: width * 0.13,
                              width: width * 0.25,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "See less",
                                    style: TextStyle(
                                        fontSize: width * 0.045,
                                        color: Colour.primarycolour),
                                  ),
                                ],
                              )),
                        ),
                ],
              ),
            ],
          ),
          ref.watch(StreamMedProvider).when(data: (data) => Container(
            height: width * 0.63,
            width: width * 1,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          selectindex1 = index;
                          setState(() {});
                          f.add({
                            "image": a[index]["image"],
                            "text1": a[index]["text1"],
                            "text2": a[index]["text2"],
                            "text3": a[index]["text3"],
                            "price": a[index]["price"],
                            "icon": a[index]["icon"],
                            "icon1": a[index]["icon1"],
                            "text6": a[index]["text6"],
                            "text5": a[index]["text5"],
                          });
                          f.length == 1
                              ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DrugDetailsPage(
                                    c: [],
                                    a: f,
                                  )))
                              : f.clear();
                        },
                        child: Container(
                          height: width * 0.6,
                          width: width * 0.45,
                          margin: EdgeInsets.only(left: width * 0.055),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colour.gray.withOpacity(0.2)),
                              borderRadius:
                              BorderRadius.circular(width * 0.05)),
                          child: Padding(
                            padding: EdgeInsets.all(width * 0.017),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: width * 0.01,
                                ),
                                Container(
                                  height: width * 0.3,
                                  width: width * 0.3,
                                  child: Image(image:NetworkImage(data[index].image.toString()),fit: BoxFit.fill,
                                    width: width * 0.27,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: width * 0.15,
                                      width: width * 0.32,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                data[index].name.toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: width * 0.045),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            data[index].ml.toString(),
                                            style: TextStyle(
                                                fontSize: width * 0.043,
                                                color: Colour.gray,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: width * 0.10,
                                  width: width * 0.45,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${data[index].rate.toString()}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: width * 0.05),
                                      ),
                                      Text(
                                        "${data[index].off.toString()}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: width * 0.05),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (favorite.contains(index)) {
                                                favorite.remove(index);
                                              } else {
                                                favorite.add(index);
                                              }
                                            });
                                          },
                                          child: !favorite.contains(index)
                                              ? Image.asset(
                                            ImagePictures.heart1,
                                            width: width * 0.05,
                                          )
                                              : SvgPicture.asset(
                                            ImageIcons.heart,
                                            width: width * 0.06,
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: width * 0.03,
                  );
                },
                itemCount: o == true ? a.length : 2),
          ),
            error: (error, stackTrace) {
              return ScaffoldMessenger(
                  child: Center(child: Text(error.toString())));
            },
            loading: () {
              return Center(child: CircularProgressIndicator());
            },),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: width * 0.13,
                  width: width * 0.55,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Product on Sale",
                        style: TextStyle(
                            fontSize: width * 0.07,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )),
              Row(
                children: [
                  z == false
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              // x = true;
                              // y = false;
                              // z = true;
                            });
                          },
                          child: Container(
                              height: width * 0.13,
                              width: width * 0.25,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "See all",
                                    style: TextStyle(
                                        fontSize: width * 0.045,
                                        color: Colour.primarycolour),
                                  ),
                                ],
                              )),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              // x = false;
                              // y = true;
                              // z = false;
                            });
                          },
                          child: Container(
                              height: width * 0.13,
                              width: width * 0.25,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "See less",
                                    style: TextStyle(
                                        fontSize: width * 0.045,
                                        color: Colour.primarycolour),
                                  ),
                                ],
                              )),
                        ),
                ],
              ),
            ],
          ),
          ref.watch(StreamMedProvider).when(data: (data) => Container(
            height: width * 0.63,
            width: width * 1,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          selectindex = index;
                          setState(() {});
                          d.add({
                            "image": c[index]["image"],
                            "text1": c[index]["text1"],
                            "text2": c[index]["text2"],
                            "text3": c[index]["text3"],
                            "price": c[index]["price"],
                            "icon": c[index]["icon"],
                            "icon1": c[index]["icon1"],
                            "text6": c[index]["text6"],
                            "text5": c[index]["text5"],
                          });
                          d.length == 1
                              ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DrugDetailsPage(
                                    c: d,
                                    a: [],
                                  )))
                              : d.clear();
                        },
                        child: Container(
                          height: width * 0.6,
                          width: width * 0.45,
                          margin: EdgeInsets.only(left: width * 0.055),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colour.gray.withOpacity(0.2)),
                              borderRadius:
                              BorderRadius.circular(width * 0.05)),
                          child: Padding(
                            padding: EdgeInsets.all(width * 0.017),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: width * 0.01,
                                ),
                                Container(
                                  height: width * 0.3,
                                  width: width * 0.3,
                                  child: Image(image:NetworkImage(data[index].image.toString()),fit: BoxFit.fill,
                                    width: width * 0.27,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: width * 0.15,
                                      width: width * 0.3,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            data[index].name.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: width * 0.05),
                                          ),
                                          Text(
                                            data[index].ml.toString(),
                                            style: TextStyle(
                                                fontSize: width * 0.043,
                                                color: Colour.gray,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: width * 0.10,
                                  width: width * 0.45,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${data[index].rate.toString()}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: width * 0.05),
                                      ),
                                      Stack(
                                        children: [
                                          Text(
                                            "${data[index].off.toString()}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Colour.gray),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: width * 0.0185,
                                                right: width * 0.04),
                                            child: Container(
                                              height: width * 0.005,
                                              width: width * 0.115,
                                              color: Colour.gray,
                                            ),
                                          )
                                        ],
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (favorite1.contains(index)) {
                                                favorite1.remove(index);
                                              } else {
                                                favorite1.add(index);
                                              }
                                            });
                                          },
                                          child: !favorite1.contains(index)
                                              ? Image.asset(
                                            ImagePictures.heart1,
                                            width: width * 0.05,
                                          )
                                              : SvgPicture.asset(
                                            ImageIcons.heart,
                                            width: width * 0.06,
                                          ))
                                      // Container(
                                      //   height: width*0.06,
                                      //   width: width*0.06,
                                      //   decoration: BoxDecoration(
                                      //       color: Colour.primarycolour,
                                      //       borderRadius: BorderRadius.circular(width*0.01)
                                      //   ),
                                      //   child: Icon(Icons.add,color: Colors.white,),
                                      // )
                                    ],
                                  ),
                                )
                              ],),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: width * 0.03,
                  );
                },
                itemCount: z == true ? c.length : 2),
          ),
            error: (error, stackTrace) {
              return ScaffoldMessenger(
                  child: Center(child: Text(error.toString())));
            },
            loading: () {
              return Center(child: CircularProgressIndicator());
            },),

        ],
      ),
    );
  }
}
