import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../icons.dart';
import '../../../../main.dart';

class TopDoctorPage extends StatefulWidget {
  const TopDoctorPage({super.key});

  @override
  State<TopDoctorPage> createState() => _TopDoctorPageState();
}

class _TopDoctorPageState extends State<TopDoctorPage> {
  List drlist=[
    {
      "image":ImageIcons.drmarcus,
      "name":"Dr. Marcus",
      "spl":"Chardiologist",
      "star":"4,7",
      "distene":"800m away",

    },
    {
      "image":ImageIcons.drmaria,
      "name":"Dr. Maria",
      "spl":"Gynecologist",
      "star":"4,7",
      "distene":"500m away",

    },
    {
      "image":ImageIcons.drstevi,
      "name":"Dr. Stevi",
      "spl":"dermatologist",
      "star":"4,8",
      "distene":"900m away",

    }
    ,{
      "image":ImageIcons.drluke,
      "name":"Dr. Luke",
      "spl":"General medicine",
      "star":"4,7",
      "distene":"800m away",

    },
    {
      "image":ImageIcons.drgerty,
      "name":"Dr. Gerty Cori",
      "spl":"Orthopedist",
      "star":"4,7",
      "distene":"800m away",

    },
    {
      "image":ImageIcons.drgerty,
      "name":"Dr. Gerty Cori",
      "spl":"Orthopedist",
      "star":"4,7",
      "distene":"800m away",

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
                  child:
                  SvgPicture.asset(
                    ImageIcons.back,),
                ),
              ),
            ),
          ),
          title:  Text(
            "Top Doctor",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: width*0.063
            ),
          ),
          actions: [Row(
            children: [
              SvgPicture.asset(ImageIcons.columnDot),
              SizedBox(width: width*0.05,)
            ],),]
      ),
    );
  }
}
