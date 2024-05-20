import 'package:flutter/material.dart';

import '../../../../colour.dart';
import '../../../../icons.dart';
import '../../../../main.dart';

class AmbulancePage extends StatefulWidget {
  const AmbulancePage({super.key});

  @override
  State<AmbulancePage> createState() => _AmbulancePageState();
}

class _AmbulancePageState extends State<AmbulancePage> {
  List docter=[
    { "image":ImageIcons.ambulance1,
      "Text":"mob:9873546751"
    },
    { "image":ImageIcons.ambulance2,
      "Text":"mob:9086543211"
    },
    { "image":ImageIcons.ambulance3,
      "Text":"mob:9878860441"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      )
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: width*0.28,
                          width: width*0.45,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width*0.03),
                              image: DecorationImage(
                                  image: AssetImage(docter[index]["image"]),fit: BoxFit.fill)
                          ),

                        ),
                        Text(docter[index]["Text"],style: TextStyle(
                            fontSize: width*0.05,
                            fontWeight: FontWeight.w600
                        ),),



                      ],
                    ),
                  ),
                );

              },


            ),
          ),
        ],
      ),
    );
  }
}
