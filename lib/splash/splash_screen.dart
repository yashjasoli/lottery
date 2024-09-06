import 'package:flutter/material.dart';
import 'package:thai_lottery/auth/language.dart';
import 'package:thai_lottery/home/home_screen.dart';
import 'package:thai_lottery/main.dart';
import 'package:thai_lottery/utility/image.dart';
import 'package:thai_lottery/utility/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigation();
    super.initState();
  }

  navigation() async {
    SessionManager pref = SessionManager();
    userName = await pref.getString("username", "");
    if (userName == '') {
      await Future.delayed(
          Duration(seconds: 1),
          () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LanguageScreen())));
    } else {
      await Future.delayed(
          Duration(seconds: 1),
          () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(ic_splash_logo),
      ),
    );
  }
}
