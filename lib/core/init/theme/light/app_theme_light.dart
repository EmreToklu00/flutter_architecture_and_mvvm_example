import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../app_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instace;
  static AppThemeLight get instance {
    _instace ??= AppThemeLight._init();
    return _instace!;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              backgroundColor: Colors.white,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
              ),
              elevation: 0,
              iconTheme: const IconThemeData(
                color: Colors.grey,
                size: 25,
              ),
            ),
        tabBarTheme: ThemeData.light().tabBarTheme.copyWith(
              labelColor: Colors.blue,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
            ),
      );
}
