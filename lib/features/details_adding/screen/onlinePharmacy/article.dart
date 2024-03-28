import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../colour.dart';
import '../../../../icons.dart';

import '../../../../main.dart';


class articles extends StatefulWidget {
  const articles({super.key});

  @override
  State<articles> createState() => _articlesState();
}

class _articlesState extends State<articles> {
  TextEditingController articleController =TextEditingController();
  List a=[
    {
      "Text":"Covid-19"
    },
    {
      "Text":"Diet"
    },
    {
      "Text":"Fitness"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: EdgeInsets.only(left: width*0.023),
              child: Padding(
                padding:  EdgeInsets.all(width*0.007),
                child: SvgPicture.asset(
                  ImageIcons.catogory1
                ),
              ),
            ),
          ),
        ),
        title:  Text(
          "Articles",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: width*0.063
          ),
        ),
        actions: [Row(
          children: [
            // SvgPicture.asset(ImageIcons.columnDot),
            SizedBox(width: width*0.05,)
          ],
        )],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: width*0.14,
              width: width*0.88,
              decoration: BoxDecoration(
                color:Colour.secondarycolour,
                borderRadius: BorderRadius.circular(width*0.08),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.295), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 03, // Blur radius
                    offset: Offset(0, 3), // Offset
                  ),
                ],
              ),
              child: TextFormField(
                controller:articleController ,
                // textCapitalization: TextCapitalization.sentences,
                keyboardType:TextInputType.text ,
                autofocus: false,
                textInputAction: TextInputAction.next,
                // maxLines:6,
                // minLines: 2,
                // maxLength: 4,
                // obscureText: true,
                // obscuringCharacter: "*",

                style: TextStyle(
                    fontSize: width*0.04,
                    fontWeight: FontWeight.w600
                ),
                decoration: InputDecoration(

                  prefixIcon: SizedBox(
                      height: width*0.03,
                      width: width*0.05,
                      child: Center(child: SvgPicture.asset(ImageIcons.catogory1,width: width*0.06,))),
                  // suffixText:"kousar",

                  labelStyle: TextStyle(
                    fontSize: width*0.05,
                    fontWeight: FontWeight.w500,
                  ),
                  hintText: "Search articles, news...",
                  hintStyle: TextStyle(
                    fontSize: width*0.05,
                    fontWeight: FontWeight.w600,
                  ),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colour.gray.withOpacity(0.12),
                    ),
                    borderRadius: BorderRadius.circular(width*0.08),
                  ),

                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                  height: width*0.16,
                  width: width*0.53,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Popular Articles",
                        style: TextStyle(
                            fontSize: width*0.07,
                            fontWeight: FontWeight.w700
                        ),),
                    ],
                  )),
            ],
          ),
          // SizedBox(width: width*0.05,),
          Container(
            height: width*0.18,
            width: width*1,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: width*0.17,
                            width: width*0.33,
                            margin: EdgeInsets.only(left: width*0.05),
                            decoration: BoxDecoration(
                                color: Colour.primarycolour,
                                borderRadius: BorderRadius.circular(width*0.02)
                            ),
                            child: Center(child: Text(
                              a[index]["Text"],
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: width*0.043,
                                  color: Colour.secondarycolour
                              ),)),
                          ),
                        ],
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: width*0.03,
                  );
                },
                itemCount:a.length
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: width*0.16,
                  width: width*0.545,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Trending Articles",
                        style: TextStyle(
                            fontSize: width*0.07,
                            fontWeight: FontWeight.w700
                        ),),
                    ],
                  )),
              Container(
                  height: width*0.16,
                  width: width*0.22,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("See all",
                        style: TextStyle(
                            fontSize: width*0.045,
                            color:  Colour.primarycolour
                        ),),
                    ],
                  )),
            ],
          ),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: width*0.83,
                        width: width*0.55,
                        margin:  EdgeInsets.only(left: width*0.05),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colour.gray.withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(width*0.04)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(width*0.025),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Image.asset(Image.covid1,),
                              Row(
                                children: [
                                  Container(
                                    height: width*0.08,
                                    width: width*0.2,
                                    decoration: BoxDecoration(
                                        color: Colour.lightgreen,
                                        borderRadius: BorderRadius.circular(width*0.01)
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Covid-19",
                                        style: TextStyle(
                                            color: Colour.primarycolour,
                                            fontWeight: FontWeight.w500
                                        ),),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Comparing the \nAstraZeneca and \nSinovac COVID-19 \nVaccines",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: width*0.05
                                    ),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Jun 12, 2021 . ",style: TextStyle(fontWeight: FontWeight.w500),),
                                  Text("6 min read",style: TextStyle(fontWeight: FontWeight.w500,color: Colour.primarycolour),),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: width*0.03,)
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: width*0.03,
                  );
                },
                itemCount: 3
            ),
          )
        ],
      ),
    );
  }
}

