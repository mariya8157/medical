import 'package:flutter/material.dart';
import 'package:medical/colour.dart';

import '../../../../main.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Container(
            height:width*0.35 ,
            width: width*0.35,
            color: Colour.primarycolour,
          )
        ],
      ),
    );
  }
}
