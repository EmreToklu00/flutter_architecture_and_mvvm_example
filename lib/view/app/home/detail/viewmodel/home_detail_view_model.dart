// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

import '../../../../../core/base/viewmodel/base_view_model.dart';
import '../../model/home_model.dart';

part 'home_detail_home_view.g.dart';

class HomeDetailViewModel = _HomeDetailViewModelBase with _$HomeDetailViewModel;

abstract class _HomeDetailViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  late HomeModel args;
  @override
  void init() {
    args = getArg(viewModelContext) as HomeModel;
  }
}
