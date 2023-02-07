import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../product/locale/locale_keys.g.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewmodel/user_view_model.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<UserViewModel>(
      viewModel: UserViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.fetchUser();
      },
      onPageBuilder: (BuildContext context, UserViewModel value) =>
          buildScaffold(context, value),
    );
  }

  Scaffold buildScaffold(BuildContext context, UserViewModel value) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(value),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text(
        LocaleKeys.user_appbar_title.locale,
        style: TextStyle(
          color: context.theme.textTheme.bodyText2!.color,
          fontSize: context.theme.textTheme.headline5!.fontSize,
        ),
      ),
    );
  }

  Observer buildBody(UserViewModel value) {
    return Observer(
      builder: (context) {
        if (value.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.separated(
          padding: context.paddingLow,
          itemCount: value.users.length,
          separatorBuilder: (context, index) => SizedBox(
            height: context.height * 0.01,
            width: context.width,
            child: Divider(
              color: context.theme.primaryColor,
              endIndent: context.width * 0.05,
              indent: context.width * 0.05,
            ),
          ),
          itemBuilder: (context, index) {
            return getUserCard(context, value, index);
          },
        );
      },
    );
  }

  ListTile getUserCard(BuildContext context, UserViewModel value, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: context.theme.primaryColor,
        backgroundImage: AssetImage("${Random().nextInt(4) + 1}".imageJPG),
      ),
      title: Text(value.users[index].email.toString()),
      subtitle: Text(
          "${value.users[index].name!.firstname} ${value.users[index].name!.lastname}"),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: context.theme.primaryColor,
        size: context.width * 0.1,
      ),
      onTap: () {
        value.navigation.navigateToPage(
          path: "/user_detail",
          arguments: value.users[index],
        );
      },
    );
  }
}
