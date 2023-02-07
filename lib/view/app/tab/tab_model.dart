// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../../../product/locale/locale_keys.g.dart';
import '../home/view/home_view.dart';
import '../user/view/user_view.dart';

class _TabModel {
  final Widget page;
  final String title;
  final IconData icon;

  _TabModel(this.page, {required this.title, required this.icon});
}

class TabModels {
  late final List<_TabModel> tabItems;

  TabModels.create() {
    tabItems = [
      _TabModel(
        const HomeView(),
        icon: Icons.inventory_2_sharp,
        title: LocaleKeys.tabBar_tab1,
      ),
      _TabModel(
        const UserView(),
        icon: Icons.search,
        title: LocaleKeys.tabBar_tab2,
      ),
    ];
  }
}
