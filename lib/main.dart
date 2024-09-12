import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:thai_lottery/local/app_langugage_provider.dart';
import 'package:thai_lottery/splash/splash_screen.dart';

import 'local/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

String userName = '';
String email = '';
String balance = '';
String phoneNumber = '';
String token = '';
String currncy = '';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguageProvider appLanguage = AppLanguageProvider();
  await appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}

class MyApp extends StatelessWidget {
  final AppLanguageProvider appLanguage;

  MyApp({super.key, required this.appLanguage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => appLanguage,
      child: Consumer<AppLanguageProvider>(
        builder: (context, model, child) {
          return MaterialApp(
            title: 'Thai Lottery',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: false,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            debugShowCheckedModeBanner: false,
            locale: model.appLocal, // Use the locale from AppLanguageProvider
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ru', 'RU'),
              Locale('th', 'TH'),
              Locale('zh', 'CN'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
