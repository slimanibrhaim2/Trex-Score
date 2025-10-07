import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  // 1. Initial State: Set the default language (English)
  // Locale takes a language code (e.g., 'en', 'ar') and optional country code.
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void setLocale (Locale newLocale){
    if (_locale != newLocale){
      _locale = newLocale;
      notifyListeners();
    }
  }

  void toggleLanguage(){
    if(_locale.languageCode == 'en'){
      setLocale(const Locale('ar'));
    }
    else {
      setLocale(const Locale('en'));
    }
  }

}