import 'package:chat_app/common/widgets/error.dart';
import 'package:chat_app/features/auth/screens/login_screen.dart';
import 'package:chat_app/features/auth/screens/otp_screen.dart';
import 'package:chat_app/common/nav_bar.dart';
import 'package:chat_app/features/screens/chat.dart';
import 'package:chat_app/features/screens/chats_list.dart';
import 'package:chat_app/features/screens/user_info.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
          builder: (Context) => OTPScreen(
                verificationId: verificationId,
              ));
    case UserInformationScreen.routeName:
      return MaterialPageRoute(builder: (context) => UserInformationScreen());
    case NavBar.routeName:
      return MaterialPageRoute(builder: (context) => NavBar());
    case Chats.routeName:
      return MaterialPageRoute(builder: (context) => Chats());
    case ChatScreen.routeName:
      return MaterialPageRoute(builder: (context) => ChatScreen());
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: ErrorScreen(error: "error"),
              ));
  }
}
