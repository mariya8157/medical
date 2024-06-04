import 'package:flutter/material.dart';
import 'package:medical/colour.dart';

import '../../../../main.dart';

class ShedulePage extends StatefulWidget {
  const ShedulePage({super.key});

  @override
  State<ShedulePage> createState() => _ShedulePageState();
}

class _ShedulePageState extends State<ShedulePage> {
  @override
  Widget build(BuildContext context) {
    return       DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Shedule",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: width*0.06
            ),),
        ),
        body: Column(
          children: [
            Container(
              height: width*0.15,
              width: width*1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width*0.03),
                color:Colour.lightgreen,
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                  indicator:  BoxDecoration(
                      color: Colour.primarycolour,
                      borderRadius: BorderRadius.circular(width*0.03),
                      border: Border.all(color: Colour.primarycolour)
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(
                      text: "Shedule",
                    ),
                    Tab(
                      text: "Orders",
                    ),

                  ]
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                  ),
                  Container(
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
