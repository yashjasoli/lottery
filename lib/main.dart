import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:thai_lottery/splash/splash_screen.dart';

import 'local/app_langugage_provider.dart';
import 'local/app_localizations.dart';

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
  AppLanguageProvider? appLanguage;

  MyApp({super.key, required this.appLanguage});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => appLanguage!,
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
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ru', 'RU'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
            ],
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
