import 'package:chat_app/common/widgets/custom_button.dart';
import 'package:chat_app/common/widgets/language_selector.dart';
import 'package:chat_app/features/auth/screens/login_screen.dart';
import 'package:chat_app/common/nav_bar.dart';
import 'package:chat_app/features/screens/user_info.dart';
import 'package:chat_app/utils/colors.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void navigateToLoginScreen(BuildContext context) {
    //fix for later
    // Navigator.pushNamed(context, LoginScreen.routeName);
    // Navigator.pushNamed(context, UserInformationScreen.routeName);
    Navigator.pushNamedAndRemoveUntil(
        context, NavBar.routeName, (val) => false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Image.asset(
              "assets/bg.png",
              height: 340,
              width: 340,
              color: primaryColor,
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Center(
              child: Text(
                "Welcome to Chattapp",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  text: "Read our ",
                  style: TextStyle(
                    color: primaryColor,
                  ),
                  children: [
                    TextSpan(
                      text: "Primary policy",
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                    TextSpan(
                      text: ". Click 'Agree and Continue' to accept our ",
                    ),
                    TextSpan(
                      text: "Terms & Condition",
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: size.width * 0.35,
                child: LanguageSelector(),
              ),
            ),
            SizedBox(
              width: size.width * 0.95,
              child: CustomButton(
                text: "Agree & Continue",
                onPressed: () => navigateToLoginScreen(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
