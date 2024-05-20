import 'package:flutter/material.dart';

import '../../../../colour.dart';
import '../../../../icons.dart';
import '../../../../main.dart';

class HospitalPage extends StatefulWidget {
  const HospitalPage({super.key});

  @override
  State<HospitalPage> createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  List docter=[
    {"image":ImageIcons.hsptl1,
    "text":"ICU"},
    {"image":ImageIcons.hsptl2,
      "text":"Op"},
    {"image":ImageIcons.hsptl3,
      "text":"hospital"},
    {"image":ImageIcons.hsptl4,
      "text":"Pharmacy"},
    {"image":ImageIcons.hsptl5,
      "text":"Reception"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: width*1,
            height: height*1,
            child: GridView.builder(
              itemCount:docter.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // childAspectRatio: 1.9,
                crossAxisSpacing:height*0.01,
                mainAxisSpacing: width*0.02,
                crossAxisCount: 2,
              ),

              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              // scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: width*0.35,
                  width: width*0.47,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.04),
                      border: Border.all(
                          color: Colour.color2
                      ),
                    image: DecorationImage(image: AssetImage(docter[index]["image"]),fit: BoxFit.fill)
                  ),
                   child: Text("Icu",style: TextStyle(
                     fontWeight: FontWeight.w700,
                     color: Colour.thirdcolour
                   ),),

                );

              },


            ),
          ),
        ],
      ),
    );
  }
}
