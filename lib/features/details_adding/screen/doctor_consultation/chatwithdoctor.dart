import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:medical/features/details_adding/screen/doctor_consultation/findDoctor.dart';
import 'package:medical/models/doctor_model.dart';
import '../../../../core/constants/colour.dart';
import '../../../../core/constants/icons.dart';
import '../../../../core/constants/images.dart';
import '../../../../main.dart';
import '../../../../models/message_model.dart';
import '../../providers/chat_provider.dart';

class ChatPage extends ConsumerStatefulWidget {
  final String senderId;
  final DoctorModel doctorImage;
  final String receiverId;
  final String doctorId;
  final String chatId;

  ChatPage({
    required this.senderId,
    required this.doctorImage,
    required this.receiverId,
    required this.doctorId,
    required this.chatId,
  });

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  late TextEditingController messageController;

  @override
  void initState() {
    super.initState();
    messageController = TextEditingController();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatController = ref.watch(chatControllerProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FindDoctor()));
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
                radius: width * 0.06,
                backgroundImage: NetworkImage(widget.doctorImage.image.toString())),
            SizedBox(width: width * 0.03),
            Text(
              widget.doctorId,
              style: TextStyle(
                  color: Colour.thirdcolour,
                  fontWeight: FontWeight.w700,
                  fontSize: width * 0.04),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(width * 0.03),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<MessageModel>>(
                stream: chatController.getMessages(widget.receiverId),
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
                        margin: EdgeInsets.all(width * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              message.receiverId,
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  color: Colour.thirdcolour,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              formattedDate,
                              style: TextStyle(
                                  fontSize: width * 0.035,
                                  color: Colour.color5,
                                  fontWeight: FontWeight.w500),
                            ),
                            InkWell(
                              onDoubleTap: () async {
                                bool confirm = await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Container(
                                        height: height * 0.2,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Are you sure you want to\n   Delete this message?',
                                              style: TextStyle(
                                                  fontSize: width * 0.04,
                                                  color: Colour.thirdcolour,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).pop(false);
                                                  },
                                                  child: Container(
                                                    height: width * 0.12,
                                                    width: width * 0.25,
                                                    decoration: BoxDecoration(
                                                        color: Colour.primarycolour,
                                                        borderRadius: BorderRadius.circular(width * 0.03)),
                                                    child: Center(
                                                      child: Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                            fontSize: width * 0.035,
                                                            color: Colour.secondarycolour,
                                                            fontWeight: FontWeight.w600),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).pop(true);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colour.primarycolour,
                                                        borderRadius: BorderRadius.circular(width * 0.03)),
                                                    height: width * 0.12,
                                                    width: width * 0.25,
                                                    child: Center(
                                                      child: Text(
                                                        'Delete',
                                                        style: TextStyle(
                                                            fontSize: width * 0.035,
                                                            color: Colour.secondarycolour,
                                                            fontWeight: FontWeight.w600),
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
                                if (confirm) {
                                  await chatController.deleteMessage(widget.receiverId, message.id);
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: width * 0.03),
                                child: BubbleSpecialOne(
                                  text: message.chatId,
                                  tail: true,
                                  isSender: true,
                                  delivered: true,
                                  seen: true,
                                  color: Colour.primarycolour,
                                  textStyle: TextStyle(
                                      fontSize: width * 0.035,
                                      color: Colour.secondarycolour,
                                      fontWeight: FontWeight.w500),
                                ),
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
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.multiline,
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
                SizedBox(width: width * 0.03),
                InkWell(
                  onTap: () async {
                    if (messageController.text.isNotEmpty) {
                      await chatController.sendMessage(
                        widget.doctorId,
                        widget.senderId,
                        widget.receiverId,
                        messageController.text,
                        widget.chatId,
                        widget.senderId,
                      );
                      messageController.clear();
                    }
                  },
                  child: Container(
                    height: width * 0.15,
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
