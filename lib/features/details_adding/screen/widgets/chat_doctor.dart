import 'package:flutter/cupertino.dart';
import 'package:medical/main.dart';

import '../../../../core/colour.dart';
import '../../../../core/icons.dart';

class Chatdoctor extends StatelessWidget {
  const Chatdoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: height*0.06,
          width: width*0.8,
          child: Row(
            children: [
              Container(
                height: height*0.05,
                width: width*0.15,
                decoration: BoxDecoration(
                  color: Colour.secondarycolour,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(ImageIcons.drmarcus),
                    filterQuality: FilterQuality.high
                  )
                ),
              ),
              SizedBox(width: width*0.05,),
              Container(
                width: width*0.6,
                height: height*0.05,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dr. Marcus Horizon",
                    style: TextStyle(
                      color: Colour.thirdcolour,
                      fontSize: width*0.04,
                      fontWeight: FontWeight.w500,

                    ),
                    ),
                    Text("10 min ago",
                      style: TextStyle(
                        color: Colour.gray,
                        fontSize: width*0.03
                    ),),

            ],
                ),

              )

            ],
          ),
        )
      ],
    );
  }
}
