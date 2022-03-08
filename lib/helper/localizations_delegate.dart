import 'dart:async';

import 'package:flutter/material.dart';

import './application.dart';
import 'locolizations.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  final Locale newLocale;

  const AppLocalizationsDelegate({required this.newLocale});

  @override
  bool isSupported(Locale locale) {
    return application.supportedLanguagesCodes.contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(newLocale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return true;
  }
}
