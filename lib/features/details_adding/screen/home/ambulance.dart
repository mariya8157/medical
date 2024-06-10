import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../colour.dart';
import '../../../../icons.dart';
import '../../../../colour.dart';
import '../../../../icons.dart';
import '../../../../main.dart';
import 'bottomnavigation.dart';

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
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white24,
        // resizeToAvoidBottomInset: false,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationPage(email: '', password: '',),));
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
          "Ambulance",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: width*0.06
          ),
        ),
        // actions: [Row(
        //     children: [
        //       SvgPicture.asset(ImageIcons.columnDot),
        //       SizedBox(width: width*0.05,)
        //     ],)],
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),

        child: Padding(
          padding:  EdgeInsets.all(width*0.03),
          child: Column(
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
                        padding: EdgeInsets.all(width*0.03),
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
                            InkWell(
                              onTap: () async {
                                final Uri url =Uri(
                                  scheme: "tel",
                                  path:"9873546751",

                                );
                                if(await canLaunchUrl(url)){
                                  await launchUrl(url);

                                }else{
                                  print("cannot launch this url");
                                }
                              },
                              child: Text(docter[index]["Text"],style: TextStyle(
                                  fontSize: width*0.05,
                                  fontWeight: FontWeight.w600
                              ),),
                            ),
                          ],
                        ),
                      ),
                    );
        
                  },
        
        
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
