import 'package:chat_app/features/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OTPScreen extends ConsumerWidget {
  static const String routeName = '/otp-screen';
  final String verificationId;
  const OTPScreen({super.key, required this.verificationId});

  // static const userOTP =
  void verifyOTP(WidgetRef ref, BuildContext context, String verificationId,
      String userOTP) {
    ref.read(authRepositoryProvider).verifyOTP(
        context: context, verificationId: verificationId, userOTP: userOTP);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify your number"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Text("Enter the otp sent on your number"),
          SizedBox(
            width: size.width / 2,
            child: TextField(
              textAlign: TextAlign.center,
              // controller: ,
              decoration: InputDecoration(
                  hintText: '- - - - - -',
                  hintStyle: TextStyle(
                    fontSize: 30,
                  )),
              keyboardType: TextInputType.number,
              onChanged: (value) => {
                if (value.length == 6)
                  {verifyOTP(ref, context, verificationId, value.trim())}
              },
            ),
          ),
        ],
      ),
    );
  }
}
