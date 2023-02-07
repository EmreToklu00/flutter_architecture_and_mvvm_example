import 'dart:math';

import 'package:flutter/material.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/extensions/string_extension.dart';
import '../../../../../product/locale/locale_keys.g.dart';

import '../../../../../../core/base/view/base_view.dart';
import '../../../../../../product/components/card/user_detail_card.dart';
import '../viewmodel/user_detail_view_model.dart';

class UserDetailView extends StatelessWidget {
  const UserDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<UserDetailViewModel>(
      viewModel: UserDetailViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, UserDetailViewModel value) =>
          buildScaffold(context, value),
    );
  }

  Scaffold buildScaffold(BuildContext context, UserDetailViewModel value) {
    return Scaffold(
      appBar: buildAppBar(context, value),
      body: buildBody(context, value),
    );
  }

  ListView buildBody(BuildContext context, UserDetailViewModel value) {
    return ListView(
      children: [
        CircleAvatar(
          radius: context.width * 0.25,
          backgroundImage: AssetImage("${Random().nextInt(4) + 1}".imageJPG),
          backgroundColor: context.theme.primaryColor,
        ),
        UserDetailCard(
          title: LocaleKeys.userDetail_card1.locale,
          text: "${value.args.name!.firstname} ${value.args.name!.lastname}",
        ),
        UserDetailCard(
          title: LocaleKeys.userDetail_card2.locale,
          text: "${value.args.username}",
        ),
        UserDetailCard(
          title: LocaleKeys.userDetail_card3.locale,
          text: "${value.args.email}",
        ),
        UserDetailCard(
          title: LocaleKeys.userDetail_card4.locale,
          text: "${value.args.password}",
        ),
        UserDetailCard(
          title: LocaleKeys.userDetail_card5.locale,
          text: "${value.args.address!.city}",
        ),
        UserDetailCard(
          title: LocaleKeys.userDetail_card6.locale,
          text: "${value.args.address!.street}",
        ),
        UserDetailCard(
          title: LocaleKeys.userDetail_card7.locale,
          text: "${value.args.address!.number}",
        ),
        UserDetailCard(
          title: LocaleKeys.userDetail_card8.locale,
          text: "${value.args.address!.zipcode}",
        ),
        UserDetailCard(
          title: LocaleKeys.userDetail_card9.locale,
          text: "${value.args.address!.geolocation!.lat}",
        ),
        UserDetailCard(
          title: LocaleKeys.userDetail_card10.locale,
          text: "${value.args.address!.geolocation!.long}",
        ),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context, UserDetailViewModel value) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: context.theme.iconTheme.color,
        ),
        onPressed: () => value.navigation.navigateBack(),
      ),
    );
  }
}
