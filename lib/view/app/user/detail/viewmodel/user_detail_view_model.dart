// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/viewmodel/base_view_model.dart';
import '../../model/user/user_model.dart';
part 'user_detail_view_model.g.dart';

class UserDetailViewModel = _UserDetailViewModelBase with _$UserDetailViewModel;

abstract class _UserDetailViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  late UserModel args;

  @override
  void init() {
    args = getArg(viewModelContext) as UserModel;
  }
}
