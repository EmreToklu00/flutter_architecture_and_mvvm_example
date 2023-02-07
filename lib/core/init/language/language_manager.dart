// ignore_for_file: unnecessary_null_comparison, prefer_conditional_assignment

import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager? _instance;

  static LanguageManager get instance {
    if (_instance == null) _instance = LanguageManager._init();
    return _instance!;
  }

  LanguageManager._init();
  final enLocale = const Locale("en", "US");
  final trLocale = const Locale("tr", "TR");
  List<Locale> get supportedLocales => [enLocale, trLocale];
}
