import 'package:chat_app/common/widgets/custom_button.dart';
import 'package:chat_app/features/auth/contoller/auth_controller.dart';
import 'package:chat_app/features/auth/screens/otp_screen.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login_screen';
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
        context: context,
        showPhoneCode: true,
        // useSafeArea: true,
        onSelect: (Country _country) {
          setState(() {
            country = _country;
          });
        });
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signInWithPhone(context, '+${country!.phoneCode}$phoneNumber');

      print("Hitting or");
      // just for exerimental purpose i need to remove it later
      Navigator.pushNamedAndRemoveUntil(
          context, OTPScreen.routeName, (route) => false);
    } else {
      showSnackBar(context: context, content: 'Fill all the parameters');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter your phone number"),
        centerTitle: true,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    "Whatsapp will need to verify your number.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(),
                TextButton(
                    onPressed: () => pickCountry(),
                    child: Text(
                      "Pick country",
                      style: TextStyle(color: Colors.blue),
                    )),
                Row(
                  children: [
                    if (country != null)
                      Text(
                        "+${country!.phoneCode}",
                        style: TextStyle(fontSize: 16),
                      ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: size.width * 0.7,
                      child: TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          hintText: 'phone number',
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 120,
              child: CustomButton(text: "Verify", onPressed: sendPhoneNumber),
            )
          ],
        ),
      ),
    );
  }
}
