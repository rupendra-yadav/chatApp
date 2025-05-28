import 'package:chat_app/common/widgets/profile_image.dart';
import 'package:chat_app/common/widgets/sender_card.dart';
import 'package:chat_app/utils/colors.dart';
import 'package:chat_app/utils/info.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  static const String routeName = '/chat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(info[0]['name'].toString()),
        automaticallyImplyLeading: true,
        elevation: 2,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.video_call_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            if (messages[index]['isMe'] == true) {
              return SenderCard(
                message: messages[index]['text'].toString(),
                time: messages[index]['time'].toString(),
              );
            } else {
              return ReceiverCard(
                message: messages[index]['text'].toString(),
                time: messages[index]['time'].toString(),
              );
            }
          }),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Type a message",
              prefixIcon: Icon(Icons.emoji_emotions_outlined),
              suffixIcon: Icon(Icons.camera_alt_outlined),
              enabled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 4, color: primaryColor),
                  borderRadius: BorderRadius.circular(25))),
        ),
      ),
    );
  }
}
