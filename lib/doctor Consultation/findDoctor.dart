import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical/colour.dart';
import 'package:medical/image.dart';

import '../main.dart';

class FindDoctor extends StatefulWidget {
  const FindDoctor({super.key});

  @override
  State<FindDoctor> createState() => _FindDoctorState();
}

class _FindDoctorState extends State<FindDoctor> {
  TextEditingController searchController=TextEditingController();
  List category=[
    {
      "image":Images.catogory1,
      "text":"General",
    },
    {
      "image":Images.catogory2,
      "text":"",
    },
    {
      "image":Images.catogory3,
      "text":"car",
    },
    {
      "image":Images.catogory4,
      "text":"cars",
    },
    {
      "image":Images.catogory5,
      "text":"train",
    },
    {
      "image":Images.catogory6,
      "text":"auto",
    },
    {
      "image":Images.catogory7,
      "text":"car3",
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:Column(
          children: [
            TextFormField(
              controller:searchController ,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                  prefixIcon:Icon(Icons.search),
                  labelText: "Search any Product..",
                  labelStyle: TextStyle(
                    fontSize: width*0.05,
                    fontWeight: FontWeight.w400,
                  ),
                  hintText: "please enter search product",
                  hintStyle: TextStyle(
                    fontSize: width*0.05,
                    fontWeight: FontWeight.w400,
                  ),
                  suffixIcon: Icon(Icons.keyboard_voice_outlined),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                      ),
                      borderRadius: BorderRadius.circular(
                          width*0.03)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width*0.03),
                      borderSide: BorderSide(
                      )
                  )
              ),
            ),
            Container(

              child: Column(
                children: [
                  Text("Category",
                    style: TextStyle(
                        fontSize: width*0.05,
                        fontWeight: FontWeight.w800,
                        color:Colour.thirdcolour
                    ),),
                  Expanded(
                    child: GridView.builder(
                      itemCount:category.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisSpacing: width*0.05,
                        mainAxisSpacing: width*0.05,
                        crossAxisCount: 3,
                      ),
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return
                          Container(
                            width: width*1,
                            height: width*0.5,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(width*0.03),
                              border: Border.all(
                                  color: Colors.black,
                                  width: width*0.008
                              ),
                            ),
                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

                                Container(
                                  width: width*0.2,
                                  height: width*0.2,
                                  child: SvgPicture.asset(category[index]["image"]),
                                ),

                                Text(category[index]["text"],)],),
                          );

                      },


                    ),
                  ),



                ],
              ),
            ),


          ],
        )

          ,
      ),

    );
  }
}
