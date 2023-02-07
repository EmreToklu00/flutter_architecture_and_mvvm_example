import '../../extensions/string_extension.dart';
import 'package:flutter/material.dart';

class LocaleText extends StatelessWidget {
  const LocaleText({super.key, required this.value, this.style});

  final String value;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      value.locale,
      style: style,
    );
  }
}
