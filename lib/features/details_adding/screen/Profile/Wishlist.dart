import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../main.dart';

class MySaved extends ConsumerStatefulWidget {
  const MySaved({super.key});

  @override
  ConsumerState createState() => _MySavedState();
}

class _MySavedState extends ConsumerState<MySaved> {
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
          "My Saved",
          style: TextStyle(
              color: Colour.thirdcolour,
              fontWeight: FontWeight.w700,
              fontSize: width * 0.04),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width*0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance.collection("users").snapshots(),
                builder: (context, snapshot){
                  if(!snapshot.hasData){
                    return Center(child:Text("Loading..."));
                  }
                  else{
                    Text("No Products added to My Saved");
                  }
                  var data =currentModel!.wish;
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount:data.length,
                    itemBuilder: (context, index) {
                      print('--------------------------------------------------');
                      print(currentModel!.wish);
                      print('--------------------------------------------------');
                      Column(
                        children: [
                          Container(
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
                                  SizedBox(height: width * 0.01,),
                                  Container(
                                    height: width * 0.3,
                                    width: width * 0.3,
                                    child: Image(image:NetworkImage(data[index]['image'].toString()),fit: BoxFit.fill,
                                      width: width * 0.27,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: width * 0.15,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    data[index]['name'].toString(),
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: width * 0.035),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              data[index]['ml'].toString(),
                                              style: TextStyle(
                                                  fontSize: width * 0.035,
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
                                          "\$${data[index]["rate"].toString()}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: width * 0.035),
                                        ),
                                        // InkWell(
                                        //     onTap: () {
                                        //       setState(() {
                                        //
                                        //         if (favorite.contains(index)) {
                                        //           favorite.remove(index);
                                        //         } else {
                                        //           favorite.add(index);
                                        //           MedicineModel wishlist= MedicineModel(
                                        //               name: data[selectindex].name,
                                        //               image: data[selectindex].image.toString(),
                                        //               ml: data[selectindex].ml.toString(),
                                        //               rate: data[selectindex].rate,
                                        //               off: data[selectindex].off,
                                        //               id: data[selectindex].id.toString(),
                                        //               des: data[selectindex].des.toString(),
                                        //               qty: data[selectindex].qty,
                                        //               userId: userId!);
                                        //           ref.read(AddingControllerProvider).updatewish(currentModel!,wishlist);
                                        //         }
                                        //       });
                                        //     },
                                        //     child: !favorite.contains(index)
                                        //         ? SvgPicture.asset(
                                        //       ImageIcons.c_add,
                                        //       width: width * 0.05,
                                        //     )
                                        //         : SvgPicture.asset(
                                        //       ImageIcons.heart,
                                        //       width: width * 0.06,
                                        //     ))
                                        SvgPicture.asset(ImageIcons.heart)
                                      ],
                                    ),
                                  )
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
                  );

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
