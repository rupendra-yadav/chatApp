import 'package:chat_app/common/widgets/custom_button.dart';
import 'package:chat_app/features/auth/contoller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailPwScreen extends ConsumerStatefulWidget {
  static const String routeName = '/emailpw-screen';
  const EmailPwScreen({super.key});

  @override
  ConsumerState<EmailPwScreen> createState() => _EmailPwScreenState();
}

class _EmailPwScreenState extends ConsumerState<EmailPwScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  void signInEmailPw() {
    String email = emailcontroller.text.trim();
    String password = emailcontroller.text.trim();
    if (email.isNotEmpty && password.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signInWithEmailAndPassword(context, email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login with Email"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                  hintText: "Enter Email address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                    hintText: "Enter password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
              ),
            ),
            CustomButton(text: "Login", onPressed: signInEmailPw)
          ],
        ),
      ),
    );
  }
}
