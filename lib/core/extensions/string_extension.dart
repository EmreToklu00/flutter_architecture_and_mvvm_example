// ignore_for_file: unnecessary_this

import 'package:easy_localization/easy_localization.dart';

extension StringLocalization on String {
  String get locale => this.tr().toString();
}

extension ImageExtension on String {
  String get imagePNG => "asset/image/$this.png";
  String get imageJPG => "asset/image/$this.jpg";
}
