import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/features/details_adding/screen/splashSceen/getstarted.dart';

import '../../../../colour.dart';
import '../../../../icons.dart';
import '../../../../main.dart';

class OnBordingPage extends StatefulWidget {
  const OnBordingPage({super.key});

  @override
  State<OnBordingPage> createState() => _OnBordingPageState();
}

class _OnBordingPageState extends State<OnBordingPage> {
  int currentIndex=0;
  PageController controller=PageController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(width*0.04),
          child: Column(
            children: [
              Container(
                height: width*1.6,
                width: width*0.94,
                child: PageView.builder(controller: controller,
                  padEnds:false,
                  itemCount: constants.length,
                  onPageChanged: (int index){
                    setState(() {
                      currentIndex=index;
                    });
                  },
                  itemBuilder:(_,i) {
                    return Column(

                      children: [
                        Container(
                          height: width*1.25,
                          width: width*1,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(constants[i].image),fit: BoxFit.fill,)
                          ),
                        ),
                        SizedBox(height: width*0.1,),
                        Row(
                          children: [
                            Text(constants[i].discription,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w800,
                                color: Colour.thirdcolour,
                                fontSize: width*0.062,
                              ),),
                          ],
                        ),
                        Row(
                          children: [
                            Text(constants[i].discription2,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w800,
                                color: Colour.thirdcolour,
                                fontSize: width*0.062,
                              ),),
                          ],
                        ),
                    ]);
                  },),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:List.generate(3, (index) => Container(
                      height: width*0.02,
                      width: currentIndex==index?width*0.065:width*0.02,
                      margin: EdgeInsets.only(right: width*0.03),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        color: currentIndex==index?Colour.primarycolour:Colour.thirdcolour,
                      ),
                    )),
                  ),
                  // currentIndex==3?SizedBox():
                  GestureDetector(
                    onTap: (){
                      controller.jumpToPage(2);
                      Future.delayed(Duration(milliseconds: 500)).then((value) =>
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>GetStartedPage() ,))
                      );
                      setState(() {

                      });
                    },
                    child: SvgPicture.asset(ImageIcons.button),
                  ),
                 ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
