// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/svg.dart';
// // import 'package:medical/features/details_adding/screen/onlinePharmacy/drugsdetail.dart';
//
// // import '../../../../colour.dart';
// import '../../../../core/constants/colour.dart';
// import '../../../../core/constants/icons.dart';
// import '../../../../core/constants/images.dart';
// // import '../../../../icons.dart';
// import '../../../../main.dart';
// // import '../../controller/addingcontroller_page.dart';
// import 'drugdetail2.dart';
//
// class PharmacyPage extends ConsumerStatefulWidget {
//   const PharmacyPage({super.key});
//
//   @override
//   ConsumerState<PharmacyPage> createState() => _pharmacy2State();
// }
//
// class _pharmacy2State extends ConsumerState<PharmacyPage> {
//   TextEditingController drugsControl = TextEditingController();
//
//   bool k = false;
//   bool g = false;
//   bool o = false;
//
//   bool x = false;
//   bool y = false;
//   bool z = false;
//
//   List<int> favorite = [];
//   List<int> favorite1 = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         scrolledUnderElevation: 0,
//         centerTitle: true,
//         backgroundColor: Colors.white24,
//         // resizeToAvoidBottomInset: false,
//         elevation: 0,
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: SizedBox(
//             height: width * 0.05,
//             width: width * 0.8,
//             child: Padding(
//               padding: EdgeInsets.only(left: width * 0.023),
//               child: Padding(
//                 padding: EdgeInsets.all(width * 0.007),
//                 child: SvgPicture.asset(ImageIcons.back),
//               ),
//             ),
//           ),
//         ),
//         title: Text(
//           "Pharmacy",
//           style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.w700,
//               fontSize: width * 0.063),
//         ),
//       ),
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Column(
//           children: [
//             Center(
//               child: Container(
//                 height: width * 0.13,
//                 width: width * 0.88,
//                 decoration: BoxDecoration(
//                   color: Colour.gray.withOpacity(0.07),
//                   border:
//                   Border.all(color: Colour.lightgreen.withOpacity(0.3)),
//                   borderRadius: BorderRadius.circular(width * 0.08),
//                 ),
//                 child: TextFormField(
//                   controller: drugsControl,
//                   keyboardType: TextInputType.text,
//                   autofocus: false,
//                   textInputAction: TextInputAction.next,
//                   style: TextStyle(
//                       fontSize: width * 0.04, fontWeight: FontWeight.w600),
//                   decoration: InputDecoration(
//                     prefixIcon: SizedBox(
//                         height: width * 0.03,
//                         width: width * 0.05,
//                         child: Center(
//                             child: SvgPicture.asset(
//                               ImageIcons.search,
//                               width: width * 0.06,
//                             ))),
//                     // suffixText:"kousar",
//
//                     labelStyle: TextStyle(
//                       fontSize: width * 0.05,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     hintText: "Search drugs, category...",
//                     hintStyle: TextStyle(
//                       fontSize: width * 0.05,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     border: InputBorder.none,
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colour.lightgreen.withOpacity(0.03),
//                       ),
//                       borderRadius: BorderRadius.circular(width * 0.08),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: width*0.05,),
//             Container(
//               height: width * 0.4,
//               width: width * 0.877,
//               decoration: BoxDecoration(
//                   color: Colors.lightGreen.withOpacity(0.09),
//                   borderRadius: BorderRadius.circular(width * 0.03)),
//               child: Row(
//                 children: [
//                   Center(
//                     child: Container(
//                       height: width * 0.28,
//                       width: width * 0.5,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Order quickly with\nPrescription",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w900,
//                                 fontSize: width * 0.05),
//                           ),
//                           Container(
//                             height: width * 0.099,
//                             width: width * 0.33,
//                             decoration: BoxDecoration(
//                                 color: Colour.primarycolour,
//                                 borderRadius:
//                                 BorderRadius.circular(width * 0.02)),
//                             child: Center(
//                                 child: Text(
//                                   "Upload Prescription",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w700),
//                                 )),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Image.asset(
//                     ImagePictures.tablet,
//                     width: width * 0.37,
//                   ),
//                   // SizedBox(width: width*0.03,)
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                     height: width * 0.13,
//                     width: width * 0.58,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Popular Product",
//                           style: TextStyle(
//                               fontSize: width * 0.07,
//                               fontWeight: FontWeight.w700),
//                         ),
//                       ],
//                     )),
//                 Row(
//                   children: [
//                     o == false
//                         ? InkWell(
//                       onTap: () {
//                         setState(() {
//                           k = true;
//                           g = false;
//                           o = true;
//                         });
//                       },
//                       child: Container(
//                           height: width * 0.13,
//                           width: width * 0.25,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "See all",
//                                 style: TextStyle(
//                                     fontSize: width * 0.045,
//                                     color: Colour.primarycolour),
//                               ),
//                             ],
//                           )),
//                     )
//                         : InkWell(
//                       onTap: () {
//                         setState(() {
//                           k = false;
//                           g = true;
//                           o = false;
//                         });
//                       },
//                       child: Container(
//                           height: width * 0.13,
//                           width: width * 0.25,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "See less",
//                                 style: TextStyle(
//                                     fontSize: width * 0.045,
//                                     color: Colour.primarycolour),
//                               ),
//                             ],
//                           )),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//          ref.read(StreamMedProvider).when(
//            data: (data) => Container(
//            height: width * 0.63,
//            width: width * 1,
//
//            child: ListView.separated(
//              shrinkWrap: true,
//              itemCount: data.length,
//              scrollDirection: Axis.horizontal,
//              physics: BouncingScrollPhysics(),
//              itemBuilder: (context, index) {
//                return Column(
//                  children: [
//                    InkWell(
//                      onTap: () {
//                        Navigator.push(context, MaterialPageRoute(
//                          builder: (context) => DrugDetailsPage(detail:data [index], ),));
//                      },
//                      child: Container(
//                        height: width * 0.6,
//                        width: width * 0.45,
//                        margin: EdgeInsets.only(left: width * 0.055),
//                        decoration: BoxDecoration(
//                            border: Border.all(
//                                color: Colour.gray.withOpacity(0.2)),
//                            borderRadius:
//                            BorderRadius.circular(width * 0.05)),
//                        child: Padding(
//                          padding: EdgeInsets.all(width * 0.017),
//                          child: Column(
//                            children: [
//                              SizedBox(
//                                height: width * 0.01,
//                              ),
//                              Container(
//                                height: width * 0.3,
//                                width: width * 0.3,
//                                child: Image.network(data[index].image),
//                              ),
//                              Row(
//                                children: [
//                                  Container(
//                                    height: width * 0.15,
//                                    width: width * 0.32,
//                                    child: Column(
//                                      crossAxisAlignment:
//                                      CrossAxisAlignment.start,
//                                      mainAxisAlignment:
//                                      MainAxisAlignment.spaceEvenly,
//                                      children: [
//                                        Row(
//                                          children: [
//                                            Text(
//                                              data[index].name,
//                                              style: TextStyle(
//                                                  fontWeight: FontWeight.w800,
//                                                  fontSize: width * 0.045),
//                                            ),
//                                          ],
//                                        ),
//                                        Text(
//                                          data[index].ml,
//                                          style: TextStyle(
//                                              fontSize: width * 0.043,
//                                              color: Colour.gray,
//                                              fontWeight: FontWeight.w500),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                ],
//                              ),
//                              Container(
//                                height: width * 0.10,
//                                width: width * 0.45,
//                                child: Row(
//                                  mainAxisAlignment:
//                                  MainAxisAlignment.spaceBetween,
//                                  children: [
//                                    Text(
//                                      "\$ ${data[index].rate.toString()}",
//                                      style: TextStyle(
//                                          fontWeight: FontWeight.w900,
//                                          fontSize: width * 0.05),
//                                    ),
//                                    InkWell(
//                                        onTap: () {
//                                          setState(() {
//                                            if (favorite.contains(index)) {
//                                              favorite.remove(index);
//                                            } else {
//                                              favorite.add(index);
//                                            }
//                                          });
//                                        },
//                                        child: !favorite.contains(index)
//                                            ? Image.asset(
//                                          ImagePictures.heart,
//                                          width: width * 0.05,
//                                        )
//                                            : SvgPicture.asset(
//                                          ImageIcons.heart,
//                                          width: width * 0.06,
//                                        ))
//                                  ],
//                                ),
//                              )
//                            ],
//                          ),
//                        ),
//                      ),
//                    ),
//                  ],
//                );
//              },
//              separatorBuilder: (context, index) {
//                return SizedBox(
//                  height: width*0.03,
//                );
//              },
//            ),
//          ),
//             error: (error, stackTrace) => Text(error.toString()),
//             loading: () => CircularProgressIndicator(),),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                     height: width * 0.13,
//                     width: width * 0.55,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Product on Sale",
//                           style: TextStyle(
//                               fontSize: width * 0.07,
//                               fontWeight: FontWeight.w700),
//                         ),
//                       ],
//                     )),
//                 Row(
//                   children: [
//                     z == false
//                         ? InkWell(
//                       onTap: () {
//                         setState(() {
//                           x = true;
//                           y = false;
//                           z = true;
//                         });
//                       },
//                       child: Container(
//                           height: width * 0.13,
//                           width: width * 0.25,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "See all",
//                                 style: TextStyle(
//                                     fontSize: width * 0.045,
//                                     color: Colour.primarycolour),
//                               ),
//                             ],
//                           )),
//                     )
//                         : InkWell(
//                       onTap: () {
//                         setState(() {
//                           x = false;
//                           y = true;
//                           z = false;
//                         });
//                       },
//                       child: Container(
//                           height: width * 0.13,
//                           width: width * 0.25,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "See less",
//                                 style: TextStyle(
//                                     fontSize: width * 0.045,
//                                     color: Colour.primarycolour),
//                               ),
//                             ],
//                           )),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             ref.watch(StreamMedProvider).when(
//                 data: (data){
//                   data.shuffle();
//                   return Container(
//                     height: width * 0.63,
//                     width: width * 1,
//                     child: ListView.separated(
//                         shrinkWrap: true,
//                         physics: BouncingScrollPhysics(),
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, index) {
//                           return Column(
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   Navigator.push(context, MaterialPageRoute(
//                                     builder: (context) => DrugDetailsPage(detail: data[index], ),));
//                                 },
//                                 child: Container(
//                                   height: width * 0.6,
//                                   width: width * 0.45,
//                                   margin: EdgeInsets.only(left: width * 0.055),
//                                   decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: Colour.gray.withOpacity(0.2)),
//                                       borderRadius:
//                                       BorderRadius.circular(width * 0.05)),
//                                   child: Padding(
//                                     padding: EdgeInsets.all(width * 0.017),
//                                     child: Column(
//                                       children: [
//                                         SizedBox(
//                                           height: width * 0.01,
//                                         ),
//                                         Container(
//                                           height: width * 0.3,
//                                           width: width * 0.3,
//                                           child: Image.network(
//                                             data[index].image,
//                                             width: width * 0.27,
//                                           ),
//                                         ),
//                                         Row(
//                                           children: [
//                                             Container(
//                                               height: width * 0.15,
//                                               width: width * 0.3,
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment.spaceEvenly,
//                                                 children: [
//                                                   Text(
//                                                     data[index].name,
//                                                     style: TextStyle(
//                                                         fontWeight: FontWeight.w800,
//                                                         fontSize: width * 0.05),
//                                                   ),
//                                                   Text(
//                                                     data[index].ml,
//                                                     style: TextStyle(
//                                                         fontSize: width * 0.043,
//                                                         color: Colour.gray,
//                                                         fontWeight: FontWeight.w500),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Container(
//                                           height: width * 0.10,
//                                           width: width * 0.45,
//                                           child: Row(
//                                             mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 "\$ ${data[index].rate.toString()}",
//                                                 style: TextStyle(
//                                                     fontWeight: FontWeight.w900,
//                                                     fontSize: width * 0.05),
//                                               ),
//                                               Stack(
//                                                 children: [
//                                                   Text(
//                                                     "\$ ${data[index].off.toString()}",
//                                                     style: TextStyle(
//                                                         fontWeight: FontWeight.w700,
//                                                         color: Colour.gray),
//                                                   ),
//                                                   Padding(
//                                                     padding: EdgeInsets.only(
//                                                         top: width * 0.0185,
//                                                         right: width * 0.04),
//                                                     child: Container(
//                                                       height: width * 0.005,
//                                                       width: width * 0.115,
//                                                       color: Colors.grey,
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                               InkWell(
//                                                   onTap: () {
//                                                     setState(() {
//                                                       if (favorite1.contains(index)) {
//                                                         favorite1.remove(index);
//                                                       } else {
//                                                         favorite1.add(index);
//                                                       }
//                                                     });
//                                                   },
//                                                   child: !favorite1.contains(index)
//                                                       ? Image.asset(
//                                                     ImageIcons.heart,
//                                                     width: width * 0.05,
//                                                   )
//                                                       : SvgPicture.asset(
//                                                     ImageIcons.heart,
//                                                     width: width * 0.06,
//                                                   ))
//                                             ],
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                         separatorBuilder: (context, index) {
//                           return SizedBox(
//                             height: width*0.03,
//                           );
//                         },
//                         itemCount: data.length
//                     ),
//                   );
//                 },
//                 error: (error, stackTrace) => Text(stackTrace.toString()),
//                 loading: () => CircularProgressIndicator(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
