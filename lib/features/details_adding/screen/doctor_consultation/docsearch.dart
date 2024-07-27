import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../main.dart';
import '../../controller/doctor_controller.dart';
import '../../controller/user_controller.dart';

class DocSearchPage extends ConsumerStatefulWidget {
  const DocSearchPage({super.key});

  @override
  ConsumerState<DocSearchPage> createState() => _TopDoctorPageState();
}

class _TopDoctorPageState extends ConsumerState<DocSearchPage> {
  TextEditingController searchController = TextEditingController();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(width*0.03),
          child: Column(
            children: [
              SizedBox(height: width*0.05,),

              // ref.watch(StreamDocProvider(searchController.text)).when(data: (data) => Container(
              //   child: ListView.separated(
              //       shrinkWrap: true,
              //       physics: NeverScrollableScrollPhysics(),
              //       scrollDirection: Axis.vertical,
              //       itemBuilder: (context, index) {
              //         return
              //           Padding(
              //             padding:  EdgeInsets.all(width*0.03),
              //             child: Container(
              //               height: width*0.4,
              //               width: width*1,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(width*0.03),
              //                   border: Border.all(
              //                       color: Colour.color2
              //                   )
              //               ),
              //               child: Row(
              //                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                 children: [
              //                   SizedBox(width: width*0.03,),
              //                   Container(
              //                     height: width*0.5,
              //                     width: width*0.78,
              //
              //                     child: Row(
              //                       mainAxisAlignment: MainAxisAlignment.start,
              //                       children: [
              //                         Container(
              //                           width: width*0.35,
              //                           height:height*0.17,
              //
              //                           decoration: BoxDecoration(
              //                             image: DecorationImage(image: NetworkImage(data[index].image),fit: BoxFit.fill),
              //                             // color: Colors.red,
              //                             borderRadius: BorderRadius.circular(width*0.03),
              //
              //                           ),
              //
              //
              //                         ),
              //                         SizedBox(width: width*0.04,),
              //                         Container(
              //                           width: width*0.3,
              //                           child: Column(
              //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                             crossAxisAlignment: CrossAxisAlignment.start,
              //                             children: [
              //
              //                               Text(data[index].name.toString(),
              //                                 style: TextStyle(
              //                                     fontSize: width*0.05,
              //                                     fontWeight: FontWeight.w800,
              //                                     color:Colour.thirdcolour
              //                                 ),
              //
              //                               ),
              //                               Text(data[index].spcl.toString(),
              //                                 style: TextStyle(
              //                                     color: Colour.gray,
              //                                     fontSize: width*0.04
              //                                 ),
              //
              //                               ),
              //
              //                               Container(
              //                                 width: width*0.25,
              //                                 height: height*0.05,
              //                                 child: Row(
              //                                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                                   children: [
              //                                     // SvgPicture.asset(ImageIcons.location,) ,
              //                                     Text(data[index].exp.toString(),
              //                                       style: TextStyle(
              //                                         color: Colour.color1,
              //
              //                                       ),)
              //                                   ],
              //                                 ),
              //                               )
              //
              //                             ],
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   )
              //
              //
              //                 ],
              //               ),
              //
              //             ),
              //           )
              //         ;
              //
              //       },
              //       separatorBuilder: (context, index) {
              //         return SizedBox(
              //           height: width*0.01,
              //         );
              //       },
              //       itemCount:data.length
              //   ),
              // ), error: (Object error, StackTrace stackTrace) {  return ScaffoldMessenger(
              //     child: Center(child: Text(error.toString()))); },
              //     loading:  () {
              //       return Center(child: CircularProgressIndicator());}
              // )
        ],
          ),
        ),
      ),

    );
  }
}
