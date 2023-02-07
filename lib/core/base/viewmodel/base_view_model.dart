import 'package:flutter/material.dart';

import '../../init/navigation/navigation_service.dart';
import '../../init/network/vexana_manager.dart';

abstract class BaseViewModel {
  late BuildContext viewModelContext;

  VexanaManager? vexanaManager = VexanaManager.instance;

  NavigationService navigation = NavigationService.instance;
  Object? getArg(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      return ModalRoute.of(context)!.settings.arguments;
    }
    return null;
  }

  void setContext(BuildContext context);

  void init();
}
