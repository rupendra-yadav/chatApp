import 'package:chat_app/common/widgets/profile_image.dart';
import 'package:chat_app/utils/colors.dart';
import 'package:chat_app/utils/info.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Updates"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          ],
          elevation: 2,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "   Status",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 24),
            ),
            ListTile(
              title: Text(info[0]['name'].toString()),
              subtitle: Text(info[0]['time'].toString()),
              leading: ProfileImage(imageUrl: info[0]['profilePic'].toString()),
            ),
            Text("   Recent Updates"),
            Expanded(
              child: ListView.builder(
                  itemCount: info.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(info[index]['name'].toString()),
                      subtitle: Text(info[index]['time'].toString()),
                      leading: ProfileImage(
                          imageUrl: info[index]['profilePic'].toString()),
                    );
                  }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          child: Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
  }
}
