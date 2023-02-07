import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';

class UserDetailCard extends StatelessWidget {
  const UserDetailCard({Key? key, required this.text, required this.title})
      : super(key: key);
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.width * 0.075,
        vertical: context.height * 0.01,
      ),
      width: context.width,
      height: context.height * 0.075,
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: context.theme.primaryColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Text(
          title,
          style: TextStyle(
            color: context.theme.disabledColor,
            fontSize: context.textTheme.titleSmall!.fontSize,
            fontWeight: context.textTheme.titleLarge!.fontWeight,
          ),
        ),
        title: Text(
          text,
          style: TextStyle(
            color: context.textTheme.bodyText1!.color,
            fontSize: context.textTheme.titleLarge!.fontSize,
            fontWeight: context.textTheme.titleLarge!.fontWeight,
          ),
        ),
      ),
    );
  }
}
