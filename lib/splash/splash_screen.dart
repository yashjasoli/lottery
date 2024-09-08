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
  SessionManager pref = SessionManager();

  @override
  void initState() {
    navigation();
    getuserData();
    super.initState();
  }

  getuserData() async {
    userName = await pref.getString("username", "");
    phoneNumber = await pref.getString("phone", "");
    balance = await pref.getString("balance", "");
    email = await pref.getString("email", "");
    token = await pref.getString("token", "");
    setState(() {});
  }

  navigation() async {
    SessionManager pref = SessionManager();
    userName = await pref.getString("username", "");
    if (userName == '') {
      await Future.delayed(
          Duration(seconds: 1),
          () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LanguageScreen()),
              (route) => false));
    } else {
      await Future.delayed(
          Duration(seconds: 1),
          () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false));
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
