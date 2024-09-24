import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/images.dart';
import '../../../../main.dart';

class HospitalPage extends ConsumerStatefulWidget {
  const HospitalPage({super.key});

  @override
  ConsumerState createState() => _HospitalPageState();
}

class _HospitalPageState extends ConsumerState<HospitalPage> {
  int currentIndex = 0;
  List pages = [
    ImagePictures.hsptl1,
    ImagePictures.hsptl2,
    ImagePictures.hsptl3,
    ImagePictures.hsptl4,
    ImagePictures.hsptl5,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hospital",
          style: TextStyle(
              color: Colour.thirdcolour,
              fontWeight: FontWeight.w700,
              fontSize: width * 0.06),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider.builder(
                  itemCount: 4,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: width * 0.2,
                          width: width * 1.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(pages[index]),
                                fit: BoxFit.fill),
                          )),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 0.8,
                    autoPlayAnimationDuration: Duration(milliseconds: 200),
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  )),
              SizedBox(
                height: width * 0.03,
              ),
              Text(
                "Description",
                style: TextStyle(
                    fontSize: width * 0.04, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: width * 0.03,
              ),
              Text(
                  "Medics General Hospital is a leading healthcare institution renowned for its commitment to providing high-quality medical care to the community. Established in 1965, our hospital has grown to become a center of excellence in various medical fields, including cardiology, oncology, neurology, and orthopedics .Our state-of-the-art facilities are equipped with the latest medical technology, and our team of experienced doctors and healthcare professionals is dedicated to delivering compassionate and personalized care. Whether you need routine check-ups or specialized treatments, Medics General Hospital is here to support your health and well-being.Visit us today and experience the difference in quality healthcare at Medics General Hospital. Your health is our priority.")
            ],
          ),
        ),
      ),
    );
  }
}
