

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
   Locale _appLocale = const Locale("en");

  Locale get appLocal => _appLocale;
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = const Locale('en');
      return Null;
    }
  
  print(prefs.getString("language_code"));
    _appLocale = Locale(prefs.getString('language_code')!);
    notifyListeners();
    return Null;
  }

   void changeLanguage(Locale type) async {
     var prefs = await SharedPreferences.getInstance();
     if (_appLocale == type) {
       return;
     }
     _appLocale = type; // Directly assigning the new locale
     await prefs.setString('language_code', type.languageCode);
     notifyListeners(); // Notify listeners to rebuild the UI
   }
}
