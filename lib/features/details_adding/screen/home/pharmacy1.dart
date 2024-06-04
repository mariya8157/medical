import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../colour.dart';
import '../../../../icons.dart';
import '../../../../main.dart';

class PharmacyOne extends StatefulWidget {
  const PharmacyOne({super.key});

  @override
  State<PharmacyOne> createState() => _PharmacyOneState();
}

class _PharmacyOneState extends State<PharmacyOne> {
  List docter=[
    {
      "image":ImageIcons.paracetamol,
      "name":"Paracetamol",
      "ml":"650mg",
      "Rs":"\$25"
    },
    {
      "image":ImageIcons.omega,
      "name":"Omega",
      "ml":"100mg",
      "Rs":"\$155"
    },
    {
      "image":ImageIcons.cough,
      "name":"Cough",
      "ml":"500mg",
      "Rs":"\$30"
    },
    {
      "image":ImageIcons.cardiac,
      "name":"Cardicheck",
      "ml":"10mg",
      "Rs":"\$80"
    },
    {
      "image":ImageIcons.telma,
      "name":"Telma",
      "ml":"20mg",
      "Rs":"\$80"
    },
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
                        Text(docter[index]["name"],style: TextStyle(
                          fontSize: width*0.05,
                          fontWeight: FontWeight.w600
                        ),),

                        Text(docter[index]["ml"],style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: width*0.04
                        ),),
                        Text(docter[index]["Rs"],style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: width*0.04
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
