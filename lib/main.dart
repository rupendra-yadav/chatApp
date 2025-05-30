import 'package:chat_app/features/screens/landing.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/router.dart';
import 'package:chat_app/utils/colors.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseAppCheck.instance.activate(
  // androidProvider: AndroidProvider.debug,
  // isTokenAutoRefreshEnabled: true,
  // );
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ChatApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.white,
            ),
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: const AppBarTheme(
              color: backgroundColor,
            )),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const LandingScreen());
  }
}
