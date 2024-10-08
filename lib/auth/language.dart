import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:thai_lottery/auth/login_screnn.dart';
import 'package:thai_lottery/local/app_localizations.dart';
import 'package:thai_lottery/utility/colors.dart';

import '../local/app_langugage_provider.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  var selectLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: Padding(
        //   padding: EdgeInsets.only(left: 10, right: 10),
        //   child: CircleAvatar(
        //     backgroundColor: Color(0xffF1F6F9),
        //     child: Icon(CupertinoIcons.back),
        //   ),
        // ),
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            AppLocalizations.of(context)!.translate("Language")!,
            style: GoogleFonts.breeSerif(
                textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: font_color_cust)),
          ),
          Text(
            AppLocalizations.of(context)!
                .translate("Select your app language")!,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff8B9199)),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  selectLanguage = "English";
                  _changeLanguage(context, Locale('en'));
                  setState(() {});
                },
                child: Container(
                  height: 55,
                  width: 150,
                  decoration: BoxDecoration(
                      color: selectLanguage == "English"
                          ? seconderycolor_cust
                          : dark_grey_background_cust,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.translate("English")!,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: selectLanguage == "English"
                            ? Colors.white
                            : seconderycolor_cust,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  selectLanguage = "Thai";
                  _changeLanguage(context, Locale('th'));
                  setState(() {});
                },
                child: Container(
                  height: 55,
                  width: 150,
                  decoration: BoxDecoration(
                      color: selectLanguage == "Thai"
                          ? seconderycolor_cust
                          : dark_grey_background_cust,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.translate("Thai")!,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: selectLanguage == "Thai"
                              ? Colors.white
                              : seconderycolor_cust),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  selectLanguage = "Russian";
                  _changeLanguage(context, Locale('ru'));
                  setState(() {});
                },
                child: Container(
                  height: 55,
                  width: 150,
                  decoration: BoxDecoration(
                      color: selectLanguage == "Russian"
                          ? seconderycolor_cust
                          : dark_grey_background_cust,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.translate("Russian")!,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: selectLanguage == "Russian"
                              ? Colors.white
                              : seconderycolor_cust),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  selectLanguage = "Chinese";
                  _changeLanguage(context, Locale('zh'));
                  setState(() {});
                },
                child: Container(
                  height: 55,
                  width: 150,
                  decoration: BoxDecoration(
                      color: selectLanguage == "Chinese"
                          ? seconderycolor_cust
                          : dark_grey_background_cust,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.translate("Chinese")!,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: selectLanguage == "Chinese"
                              ? Colors.white
                              : seconderycolor_cust),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false);
        },
        child: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: BoxDecoration(
              color: primarycolor_cust,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.translate("Next")!,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
  void _changeLanguage(BuildContext context, Locale newLocale) {
    Provider.of<AppLanguageProvider>(context, listen: false).changeLanguage(newLocale);
  }
}
