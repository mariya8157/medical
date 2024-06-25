import 'package:flutter/cupertino.dart';
import '../../../../core/constants/colour.dart';
import '../../../../main.dart';

class ChatInfo extends StatelessWidget {
  const ChatInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Container(
        width: width*1,
        height: height*0.12,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width*0.03),
            border: Border.all(color: Colour.lightgreen)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Consultion Start",
              style: TextStyle(
                  fontSize: width*0.05,
                  fontWeight: FontWeight.w600,
                  color:Colour.primarycolour
              ),
            ),
            Text("You can consult your problem to the doctor",
              style: TextStyle(
                  fontSize: width*0.04,
                  fontWeight: FontWeight.w400,
                  color:Colour.gray
              ),
            ),


          ],
        ),
      )
      ,

    );
  }
}
