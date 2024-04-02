import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../colour.dart';
import '../../../../icons.dart';
import '../../../../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search_controller=TextEditingController();
  List items=[
    {"images":ImageIcons.catogory1,
      "text":"Doctor"
    },
    {"images":ImageIcons.Pharmacy,
      "text":"Pharmacy"
    },{"images":ImageIcons.Hospital,
      "text":"Hospital"
    },{"images":ImageIcons.Ambulance,
      "text":"Ambulance"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find your desire\n health solution",style: TextStyle(
            fontWeight: FontWeight.w700
        ),),
        actions: [
          SvgPicture.asset(ImageIcons.bell,),
          SizedBox(width: width*0.03,)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: width*0.05,),
            Container(
              height: height*0.06,
              decoration: BoxDecoration(
                  color: Colour.color3,
                  borderRadius: BorderRadius.circular(width*0.07)
              ),
              child: TextFormField(
                controller:search_controller ,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.search,
                style: TextStyle(fontSize: width*0.045,fontWeight: FontWeight.w500,color: Colour.thirdcolour),
                decoration: InputDecoration(
                    prefixIcon:Padding(
                      padding:  EdgeInsets.all(width*0.03),
                      child: SvgPicture.asset(ImageIcons.search),
                    ),
                    labelText: "Search doctors,drugs,articles...",
                    labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: width*0.04, color: Colour.color1),
                    hintText: "please enter search ",
                    hintStyle: TextStyle(
                      fontSize: width*0.05,
                      fontWeight: FontWeight.w400,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colour.color2,

                        ),
                        borderRadius: BorderRadius.circular(
                            width*0.07)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width*0.07),
                        borderSide: BorderSide(
                          color: Colour.color2,

                        )
                    )
                ),
              ),
            ),
            SizedBox(height: width*0.05,),
           Container(
             height: width*0.3,
             width: width*0.9,
             color: Colors.blue,
             child: ListView.separated(
               shrinkWrap: true,
               scrollDirection: Axis.horizontal,
               physics: NeverScrollableScrollPhysics(),
               itemCount: 4,
                 itemBuilder: (context, index) {
                 return Column(
                   children: [
                     Container(
                      height: width*0.3,
                      width: width*0.2,
                      child: SvgPicture.asset(ImageIcons.catogory1),
                     ),
                   ],
                 );
                 },
                 separatorBuilder: (context, index) {

                 return  SizedBox(width: width*0.04,);
                 }, ),
           )

          ],
        ),
        
      ),
    );
  }
}
