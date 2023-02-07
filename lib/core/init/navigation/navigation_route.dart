import 'package:flutter/material.dart';

import '../../../view/app/app_view.dart';
import '../../../view/app/home/detail/view/home_detail_view.dart';
import '../../../view/app/user/detail/view/user_detail_view.dart';
import '../../../view/test/view/test_view.dart';
import '../../components/card/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(const TestView(), NavigationConstants.TEST_VIEW);

      case NavigationConstants.APP_VIEW:
        return normalNavigate(AppView(), NavigationConstants.APP_VIEW);

      case NavigationConstants.HOME_DETAIL:
        return normalNavigate(
          const HomeDetailView(),
          NavigationConstants.HOME_DETAIL,
          arguments: args.arguments,
        );
      case NavigationConstants.USER_DETAIL:
        return normalNavigate(
          const UserDetailView(),
          NavigationConstants.USER_DETAIL,
          arguments: args.arguments,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName,
      {Object? arguments}) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: pageName, arguments: arguments),
    );
  }
}
