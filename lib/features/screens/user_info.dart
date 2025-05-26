import 'package:chat_app/common/widgets/custom_button.dart';
import 'package:chat_app/utils/colors.dart';
import 'package:flutter/material.dart';

class UserInformationScreen extends StatelessWidget {
  static const String routeName = '/user-information-screen';
  const UserInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 1 / 9,
              ),
              Text(
                "Profile Info",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Please provide your name and an optional profile image",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                      'https://t4.ftcdn.net/jpg/05/89/93/27/360_F_589932782_vQAEAZhHnq1QCGu5ikwrYaQD0Mmurm0N.jpg'),
                ),
              ),
              SizedBox(
                height: size.height * 1 / 9,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: SizedBox(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type your name here",
                      suffixIcon: Icon(Icons.emoji_emotions_outlined),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 2 / 9,
              ),
              CustomButton(text: "Next", onPressed: () {})
            ],
          ),
        ),
      )),
    );
  }
}
