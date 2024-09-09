import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_lottery/splash/splash_screen.dart';


String userName = '';
String email = '';
String balance = '';
String phoneNumber = '';
String token = '';
String currncy = 'THB';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thai Lottery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
