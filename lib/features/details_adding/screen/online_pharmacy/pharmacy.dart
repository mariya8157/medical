import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical/models/medicine_model.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../core/constants/images.dart';
import '../../../../main.dart';
import '../../controller/medicine_controller.dart';
import 'drugdetail2.dart';
import 'drugsdetail.dart';
import 'mycart.dart';

class PharmacyPage extends ConsumerStatefulWidget {
  const PharmacyPage({super.key});

  @override
  ConsumerState<PharmacyPage> createState() => _PharmacyPageState();
}

class _PharmacyPageState extends ConsumerState<PharmacyPage> {

  TextEditingController drugsControl = TextEditingController();
  int selectindex = 0;
  int selectindex1 = 0;
  bool see = false;
  bool see2 = false;
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
      body: Padding(
        padding: EdgeInsets.all(width*0.03),
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              height: width * 0.7,
              width: width * 1,
              child: Column(
                 children: [
                  Container(
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
                  SizedBox(height: width*0.03,),
                  Container(
                    height: width * 0.43,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.lightGreen.withOpacity(0.09),
                        borderRadius: BorderRadius.circular(width * 0.03)),
                    child: Row(
                      children: [
                        Center(
                          child: Container(
                            height: width * 0.28,
                            width: width * 0.5,
                            child: Container(
                              height: height*0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                  Text(
                                    "Order quickly with\nPrescription",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: width * 0.05),
                                  ),
                                  Container(
                                    height: width * 0.099,
                                    width: width * 0.35,
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
                      children: [
                        Text(
                          "Trending Articles",
                          style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )),
                Row(
                  children: [
                         InkWell(
                            onTap: () {
                              see=!see;
                              setState(() {});
                            },
                            child: Container(
                                height: width * 0.13,
                                width: width * 0.25,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    see?Text(
                                      "See less",
                                      style: TextStyle(
                                          fontSize: width * 0.035,
                                          color: Colour.primarycolour),
                                    ):Text(
                                      "See all",
                                      style: TextStyle(
                                          fontSize: width * 0.035,
                                          color: Colour.primarycolour),
                                    ),
                                  ],
                                )),
                          )
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
                            selectindex=index;
                            setState(() {

                            });
                            MedicineModel medicineData= MedicineModel(
                                name: data[selectindex].name.toString(),
                                image: data[selectindex].image.toString(),
                                ml: data[selectindex].ml.toString(),
                                rate: data[selectindex].rate,
                                off: data[selectindex].off,
                                id: data[selectindex].id.toString(),
                                des: data[selectindex].des.toString(),
                                qty: data[selectindex].qty,
                                userId: '');
                            // print(currentModel!.id);
                            // print("----------------===================000000000000");
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DrugDetailsPage( med: medicineData,)));
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
                                              ImagePictures.heart,
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
                  itemCount:  see? data.length:2),
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
                    // z == false?
                          InkWell(
                            onTap: () {
                              see2=!see2;
                              setState(() {
                              });
                            },
                            child: Container(
                                height: width * 0.13,
                                width: width * 0.25,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   see2? Text(
                                     "See less",
                                     style: TextStyle(
                                         fontSize: width * 0.045,
                                         color: Colour.primarycolour),
                                   ):Text(
                                      "See all",
                                      style: TextStyle(
                                          fontSize: width * 0.045,
                                          color: Colour.primarycolour),
                                    ),
                                  ],
                                )),
                          )
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
                            selectindex1=index;
                            setState(() {

                            });
                            MedicineModel medicineData2= MedicineModel(
                                name: data[selectindex1].name.toString(),
                                image: data[selectindex1].image.toString(),
                                ml: data[selectindex1].ml.toString(),
                                rate: data[selectindex1].rate,
                                off: data[selectindex1].off,
                                id: data[selectindex1].id.toString(),
                                des: data[selectindex1].des.toString(),
                                qty: data[selectindex1].qty,
                                userId: '');
                            // print(currentModel!.id);
                            print("----------------===================000000000000");
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DrugDetailsPage2(med2: medicineData2,)));
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
                                        Text(
                                          "${data[index].off.toString()}",
                                          style: TextStyle( decoration: TextDecoration.lineThrough,
                                              decorationColor: Colour.color1,
                                              fontWeight: FontWeight.w700,
                                              color: Colour.gray),
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
                                              ImagePictures.heart,
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
                itemCount: see2? data.length:2,
    ),
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
      ),
    );
  }
}
