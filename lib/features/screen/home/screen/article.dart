import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constants/colour.dart';
import '../../../../../core/constants/icons.dart';
import '../../../../../core/constants/images.dart';
import '../../../../../main.dart';
import 'bottomnavigation.dart';

class Articles extends StatefulWidget {
  const Articles({super.key});

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  TextEditingController articleController = TextEditingController();
  List a = [
    {"Text": "Covid-19"},
    {"Text": "Diet"},
    {"Text": "Fitness"},
  ];
  List c = [
    {
      "image": ImagePictures.covid1,
      "Text1": "Covid-19",
      "Text2": "Comparing the \nAstraZeneca and \nSinovac COVID-19 \nVaccines",
      "Text3": "Jun 12, 2021.",
      "Text4": " 6 min read",
    },
    {
      "image": ImagePictures.covid2,
      "Text1": "Covid-19",
      "Text2": "The Horror Of The \nSecond Wave Of \nCOVID-19",
      "Text3": "Jun 10, 2021.",
      "Text4": " 5 min read",
    },
    {
      "image": ImagePictures.covid3,
      "Text1": "Covid-19",
      "Text2": "Comparing the \nAstraZeneca and \nSinovac COVID-19 \nVaccines",
      "Text3": "Jun 12, 2021.",
      "Text4": " 6 min read",
    },
  ];
  List d = [
    {
      "image": ImagePictures.covid4,
      "text1": "The 25 Healthiest Fruits Eat\nAccording to a Nutritionist",
      "icon": ImageIcons.save,
      "text2": "Jun 10, 2021.",
      "text3": " 5min read",
    },
    {
      "image": ImagePictures.covid5,
      "text1": "Traditional Herbal Medicine\nTreatments for COVID-19",
      "icon": ImageIcons.save,
      "text2": "Jun 9, 2021.",
      "text3": " 8 min read",
    },
    {
      "image": ImagePictures.covid6,
      "text1": "Beauty Tips For Face: 10 Dos\nNaturally Beautiful Skin",
      "icon": ImageIcons.save,
      "text2": "Jun 10, 2021.",
      "text3": " 7min read",
    },
  ];
  bool k = false;
  bool g = false;
  bool o = false;

  bool x = false;
  bool y = false;
  bool z = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          centerTitle: true,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavigationPage(),
                  ));
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
            "Articles",
            style: TextStyle(
                color: Colour.thirdcolour,
                fontWeight: FontWeight.w700,
                fontSize: width * 0.04),
          ),
          actions: [
            Row(
              children: [
                SvgPicture.asset(ImageIcons.columnDot),
                SizedBox(
                  width: width * 0.05,
                )
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(width * 0.04),
            child: Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: width * 0.05,
                    ),
                    Center(
                      child: Container(
                        height: height * 0.06,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                            color: Colour.color3,
                            borderRadius: BorderRadius.circular(width * 0.07)),
                        child: TextFormField(
                          controller: articleController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.search,
                          style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.w500,
                              color: Colour.thirdcolour),
                          decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(width * 0.03),
                                child: SvgPicture.asset(ImageIcons.search),
                              ),
                              labelText: "search articles,news..,",
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width * 0.04,
                                  color: Colour.color1),
                              hintText: "search  articles",
                              hintStyle: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w400,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colour.color2,
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(width * 0.07)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.07),
                                  borderSide: BorderSide(
                                    color: Colour.color2,
                                  ))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width * 0.05,
                    ),
                    Row(
                      children: [
                        Text(
                          "Popular Articles",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.015),
                    SizedBox(
                      height: width * 0.18,
                      width: width * 1,
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
                                      height: width * 0.13,
                                      width: width * 0.28,
                                      // margin: EdgeInsets.only(left: width*0.05),
                                      decoration: BoxDecoration(
                                          color: Colour.primarycolour,
                                          borderRadius: BorderRadius.circular(
                                              width * 0.02)),
                                      child: Center(
                                          child: Text(
                                        a[index]["Text"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: width * 0.04,
                                            color: Colour.secondarycolour),
                                      )),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: width * 0.03,
                              width: width * 0.03,
                            );
                          },
                          itemCount: a.length),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Trending Articles",
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: width * 0.16,
                            width: width * 0.22,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    z == false
                                        ? InkWell(
                                            onTap: () {
                                              setState(() {
                                                x = true;
                                                y = false;
                                                z = true;
                                              });
                                            },
                                            child: SizedBox(
                                                height: width * 0.13,
                                                width: width * 0.22,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "See all",
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * 0.03,
                                                          color: Colour
                                                              .primarycolour),
                                                    ),
                                                  ],
                                                )),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              setState(() {
                                                x = false;
                                                y = true;
                                                z = false;
                                              });
                                            },
                                            child: SizedBox(
                                                height: width * 0.13,
                                                width: width * 0.22,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "See less",
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * 0.03,
                                                          color: Colour
                                                              .primarycolour),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: width * 0.85,
                      width: width * 1,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  height: width * 0.83,
                                  width: width * 0.53,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colour.gray.withOpacity(0.2)),
                                      borderRadius:
                                          BorderRadius.circular(width * 0.04)),
                                  child: Padding(
                                    padding: EdgeInsets.all(width * 0.025),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(
                                          c[index]["image"],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: width * 0.08,
                                              width: width * 0.2,
                                              decoration: BoxDecoration(
                                                  color: Colour.lightgreen,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          width * 0.01)),
                                              child: Center(
                                                child: Text(
                                                  c[index]["Text1"],
                                                  style: TextStyle(
                                                      color:
                                                          Colour.primarycolour,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              c[index]["Text2"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: width * 0.037),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              c[index]["Text3"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey,
                                                  fontSize: width * 0.034),
                                            ),
                                            Text(
                                              c[index]["Text4"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colour.primarycolour,
                                                  fontSize: width * 0.034),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: width * 0.03,
                              width: width * 0.04,
                            );
                          },
                          itemCount: z == true ? c.length : 2),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Related Articles",
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: width * 0.175,
                            width: width * 0.24,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    o == false
                                        ? InkWell(
                                            onTap: () {
                                              setState(() {
                                                k = true;
                                                g = false;
                                                o = true;
                                              });
                                            },
                                            child: SizedBox(
                                                height: width * 0.13,
                                                width: width * 0.22,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "See all",
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * 0.03,
                                                          color: Colour
                                                              .primarycolour),
                                                    ),
                                                  ],
                                                )),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              setState(() {
                                                k = false;
                                                g = true;
                                                o = false;
                                              });
                                            },
                                            child: SizedBox(
                                                height: width * 0.13,
                                                width: width * 0.22,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "See less",
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * 0.03,
                                                          color: Colour
                                                              .primarycolour),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: width * 0.85,
                      width: width * 1,
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Center(
                                  child: Container(
                                    height: width * 0.26,
                                    width: width * 0.95,
                                    // margin:  EdgeInsets.only(left: width*0.05),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colour.gray.withOpacity(0.2)),
                                        borderRadius: BorderRadius.circular(
                                            width * 0.04)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(
                                          d[index]["image"],
                                        ),
                                        SizedBox(
                                          width: width * 0.62,
                                          height: width * 0.2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: width * 0.03,
                                              ),
                                              Text(
                                                d[index]["text1"],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: width * 0.037),
                                              ),
                                              SizedBox(
                                                width: width * 0.56,
                                                child: Row(
                                                  children: [
                                                    Text(d[index]["text2"]),
                                                    Text(
                                                      d[index]["text3"],
                                                      style: TextStyle(
                                                          color: Colour
                                                              .primarycolour),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          d[index]["icon"],
                                          width: width * 0.07,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: width * 0.03,
                            );
                          },
                          itemCount: o == true ? d.length : 2),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
