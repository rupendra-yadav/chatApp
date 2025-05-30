import 'package:chat_app/common/widgets/custom_button.dart';
import 'package:chat_app/common/widgets/profile_image.dart';
import 'package:chat_app/features/screens/chat.dart';
import 'package:chat_app/utils/colors.dart';
import 'package:chat_app/utils/info.dart';
import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  static const String routeName = '/chats';
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "Chatsapp",
          style: TextStyle(
            color: primaryColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.qr_code_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.all(6.0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: info.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(ChatScreen.routeName);
                    },
                    child: ListTile(
                      leading: ProfileImage(
                          imageUrl: info[index]['profilePic'].toString()),
                      title: Text(info[index]['name'].toString()),
                      subtitle: Text(info[index]['message'].toString()),
                      trailing: Text(info[index]['time'].toString()),
                      isThreeLine: false,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
