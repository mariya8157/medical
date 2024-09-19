import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../main.dart';
import '../login_signup/login.dart';

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
              Container(
                  margin: EdgeInsets.all(width*0.02),
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance.collection("users").snapshots(),
                    builder: (context, snapshot){
                      if(!snapshot.hasData){
                        return Center(child:Text("Loading..."));
                      }
                      else{
                        Text("No Products added to Cart");
                      }
                      var data =currentModel!.wish;
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio:.65,
                            crossAxisSpacing: width*0.03,
                            mainAxisSpacing: width*0.03,
                            crossAxisCount: 2),
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount:data.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                height: height * 0.33,
                                  width: width * 0.45,
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
                                           child: Image(image: NetworkImage(data[index]['image'].toString()),fit: BoxFit.fill,
                                          width: width * 0.27,
                                        ),
                                      ),
                                        SizedBox(height: height*0.03,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            width: width*0.4,
                                            height: width * 0.2,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                   data[index]['name'].toString(),
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: width * 0.035),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  data[index]['ml'].toString(),
                                                  style: TextStyle(
                                                      fontSize: width * 0.035,
                                                      color: Colour.gray,
                                                      fontWeight: FontWeight.w500),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "\$${(data[index]['rate']).toStringAsFixed(2)}",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: width * 0.035),
                                                    ),
                                                    InkWell(
                                                        onTap: () {

                                                        },
                                                        child: SvgPicture.asset(
                                                          ImageIcons.heart,
                                                          width: width * 0.06,
                                                        ))
                                                  ],
                                                ),
                                                 ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
