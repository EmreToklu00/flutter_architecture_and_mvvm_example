import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../cache/local_storage.dart';

class AppInitiliaze {
  Future<void> initBeforeAppStart() async {
    WidgetsFlutterBinding.ensureInitialized();
    await LocalStorage.init();
    await EasyLocalization.ensureInitialized();
  }
}
