import 'package:flutter/material.dart';
import '../../core/extensions/string_extension.dart';
import 'tab/tab_model.dart';

class AppView extends StatelessWidget {
  AppView({super.key});

  final _items = TabModels.create().tabItems;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(children: _items.map((e) => e.page).toList()),
        bottomNavigationBar: BottomAppBar(
          child: TabBar(
            tabs: _items
                .map(
                  (e) => Tab(
                    text: e.title.locale,
                    icon: Icon(e.icon),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
