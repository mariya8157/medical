import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medical/models/doctor_model.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../core/constants/images.dart';
import '../../../../main.dart';
import '../../../../models/message_model.dart';
import '../../providers/chat_provider.dart';

class ChatPage extends ConsumerWidget {
  final String senderId;
  final DoctorModel doctorImage;
  final String receiverId;
  final String doctorId;
  final String chatId;

  ChatPage({
    required this.senderId,
    required this. doctorImage,
    required this.receiverId,
    required this.doctorId,
    required this.chatId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatController = ref.watch(chatControllerProvider);
    TextEditingController messageController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
            height: width * 0.05,
            width: width * 0.8,
            child: Padding(
              padding: EdgeInsets.all(width * 0.007),
              child: SvgPicture.asset(
                ImageIcons.back,
              ),
            ),
          ),
        ),
        title: Row(
          children: [
            CircleAvatar(
                radius: width*0.06,
                backgroundImage: NetworkImage(doctorImage.image.toString())
               ),
            SizedBox(width: width*0.03,),
            Text(
              doctorId,
              style: TextStyle(
                  color: Colour.thirdcolour,
                  fontWeight: FontWeight.w700,
                  fontSize: width * 0.04),
            ),
          ],
        ),
      ),
      // appBar: AppBar(title: Text(doctorId)),
      body: Padding(
        padding: EdgeInsets.all(width*0.03),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<MessageModel>>(
                stream: chatController.getMessages(chatId, doctorId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No messages'));
                  }

                  final messages = snapshot.data!;

                  return ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(message.timestamp.toLocal());
                      return Container(
                        margin: EdgeInsets.all(width*0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(message.senderEmail,style: TextStyle(
                                fontSize: width*0.04,
                              color: Colour.thirdcolour,
                              fontWeight: FontWeight.w600
                            ),),
                            Text(formattedDate,style: TextStyle(
                                fontSize: width*0.035,
                                color: Colour.color5,
                                fontWeight: FontWeight.w500
                            ),),
                            Container(
                              margin: EdgeInsets.only(top:width*0.03, bottom: width*0.03),
                              padding: EdgeInsets.only(top:width*0.03, bottom: width*0.03,right: width*0.02, left: width*0.05),
                              decoration: BoxDecoration(
                                color: Colour.primarycolour,
                                borderRadius: BorderRadius.circular(width*0.03)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: width*0.03,),
                                    child: Text(message.text,style: TextStyle(
                                        fontSize: width*0.035,
                                        color: Colour.secondarycolour,
                                        fontWeight: FontWeight.w500
                                    ),),
                                  ),
                              Image.asset(ImagePictures.tick)
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colour.color3,
                        borderRadius: BorderRadius.circular(width * 0.07)),
                    child: TextFormField(
                      controller: messageController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w500,
                          color: Colour.thirdcolour),
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(width * 0.03),
                          child: SvgPicture.asset(ImageIcons.Paperclip),
                        ),
                        hintText: 'Type a message...',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: width * 0.045,
                            color: Colour.color1),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colour.color2,
                            ),
                            borderRadius: BorderRadius.circular(width * 0.07)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: width*0.03,),
                 InkWell(
                   onTap: () async {
                     if (messageController.text.isNotEmpty) {
                       await chatController.sendMessage(
                         doctorId,
                         senderId,
                         receiverId,
                         messageController.text,
                         chatId,
                         senderId,
                         receiverId,
                       );
                       messageController.clear();
                     }
                   },
                   child: Container(
                     height: width*0.15,
                    width: width * 0.3,
                    decoration: BoxDecoration(
                        color: Colour.primarycolour,
                        borderRadius: BorderRadius.circular(width * 0.07)),
                    child: Center(
                      child: Text(
                        "Send",
                        style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w600,
                            color: Colour.secondarycolour),
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
  }
}
