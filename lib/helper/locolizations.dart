import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  late Locale locale;
  static Map<dynamic, dynamic> _sentences = Map();

  AppLocalizations(Locale locale) {
    this.locale = locale;
  }

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Future<AppLocalizations> load(Locale locale) async {
    String jsonContent =
        await rootBundle.loadString("assets/lang/${locale.languageCode}.json");
    _sentences = json.decode(jsonContent);
    AppLocalizations appTranslations = AppLocalizations(locale);

    return appTranslations;
  }

  get currentLanguage => locale.languageCode;

  String trans(String key) {
    try {
      return _sentences[key] ?? '$key not found';
    } catch (e) {
      print(e);
      return "not Found";
    }
  }
}

class StringResources {
  Map<String, String> enResources = Map();
  Map<String, String> arResources = Map();

  StringResources() {
    enResources['en_title'] = 'English';
    enResources['ar_title'] = 'العربية';

    arResources['en_title'] = 'الإنجليزية';
    arResources['ar_title'] = 'العربية';
  }
}
