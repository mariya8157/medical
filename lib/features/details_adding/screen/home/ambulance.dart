import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../core/constants/images.dart';
import '../../../../main.dart';
import '../../controller/ambulance_controller.dart';
import '../../controller/user_controller.dart';
import 'bottomnavigation.dart';

class AmbulancePage extends ConsumerStatefulWidget {
  const AmbulancePage({super.key});

  @override
  ConsumerState<AmbulancePage> createState() => _AmbulancePageState();
}

class _AmbulancePageState extends ConsumerState<AmbulancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavigationPage(),
                ));
          },
          child: SizedBox(
            height: width * 0.05,
            width: width * 0.8,
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.023),
              child: Padding(
                padding: EdgeInsets.all(width * 0.007),
                child: SvgPicture.asset(
                  ImageIcons.back,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          "Ambulance",
          style: TextStyle(
              color: Colour.thirdcolour,
              fontWeight: FontWeight.w700,
              fontSize: width * 0.06),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * 0.03),
          child: Column(
            children: [
              Container(
                height: height * 0.33,
                width: width * 0.96,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.03),
                  border: Border.all(
                      color: Colour.lightgreen, width: width * 0.005),
                  image: DecorationImage(
                      image: AssetImage(ImagePictures.ambulance7),
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ref.watch(StreamAmbulanceProvider).when(
                    data: (data) => SizedBox(
                      width: width * 1,
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              height: height * 0.12,
                              width: width * 0.93,
                              decoration: BoxDecoration(
                                  color: Colour.secondarycolour,
                                  borderRadius:
                                      BorderRadius.circular(width * 0.025),
                                  border: Border.all(color: Colour.lightgreen)),
                              child: Padding(
                                padding: EdgeInsets.all(width * 0.02),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          data[index].name.toString(),
                                          style: TextStyle(
                                              fontSize: width * 0.04,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          data[index].number.toString(),
                                          style: TextStyle(
                                              fontSize: width * 0.04,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    content: SizedBox(
                                                      height: height * 0.18,
                                                      width: width * 0.5,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          SizedBox(
                                                              child: Column(
                                                            children: [
                                                              Text(
                                                                "Are you sure You want to",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                    color: Colour
                                                                        .thirdcolour),
                                                              ),
                                                              Text(
                                                                "Contact this Number?",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                    color: Colour
                                                                        .thirdcolour),
                                                              ),
                                                            ],
                                                          )),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  final Uri
                                                                      url = Uri(
                                                                    scheme:
                                                                        "tel",
                                                                    path: data[
                                                                            index]
                                                                        .number
                                                                        .toString(),
                                                                  );
                                                                  if (await canLaunchUrl(
                                                                      url)) {
                                                                    await launchUrl(
                                                                        url);
                                                                  } else {
                                                                    print(
                                                                        "cannot launch this url");
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      height *
                                                                          0.05,
                                                                  width: width *
                                                                      0.26,
                                                                  decoration: BoxDecoration(
                                                                      color: Colour
                                                                          .primarycolour,
                                                                      borderRadius:
                                                                          BorderRadius.circular(width *
                                                                              0.03)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Call",
                                                                      style: TextStyle(
                                                                          fontSize: width *
                                                                              0.04,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color:
                                                                              Colour.secondarycolour),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      height *
                                                                          0.05,
                                                                  width: width *
                                                                      0.26,
                                                                  decoration: BoxDecoration(
                                                                      color: Colour
                                                                          .primarycolour,
                                                                      borderRadius:
                                                                          BorderRadius.circular(width *
                                                                              0.03)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Cancel",
                                                                      style: TextStyle(
                                                                          fontSize: width *
                                                                              0.04,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color:
                                                                              Colour.secondarycolour),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: SvgPicture.asset(
                                                ImageIcons.nxtback))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: height * 0.015);
                          },
                          itemCount: data.length),
                    ),
                    error: (error, stackTrace) {
                      return ScaffoldMessenger(
                          child: Center(child: Text(error.toString())));
                    },
                    loading: () {
                      return Center(child: CircularProgressIndicator());
                    },
                  )
            ],
          ),
        ),
      ),
    );
  }
}
