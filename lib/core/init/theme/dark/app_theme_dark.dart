import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../app_theme.dart';

class AppThemeDark extends AppTheme {
  static AppThemeDark? _instace;
  static AppThemeDark get instance {
    _instace ??= AppThemeDark._init();
    return _instace!;
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData.dark().copyWith(
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
              ),
              elevation: 0,
              iconTheme: const IconThemeData(
                size: 25,
              ),
            ),
        tabBarTheme: ThemeData.light().tabBarTheme.copyWith(
              labelColor: const Color.fromRGBO(145, 252, 220, 1),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: Colors.grey[200],
              indicatorSize: TabBarIndicatorSize.label,
            ),
      );
}
