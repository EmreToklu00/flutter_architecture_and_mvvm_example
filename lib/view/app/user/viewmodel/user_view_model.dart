// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/product/extension/network_extension.dart';
import 'package:mobx/mobx.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../product/enum/network_enum.dart';
import '../model/user/user_model.dart';

part 'user_view_model.g.dart';

class UserViewModel = _UserViewModelBase with _$UserViewModel;

abstract class _UserViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  @override
  void init() {}

  @observable
  bool isLoading = false;

  void isLoadingChange() {
    isLoading = !isLoading;
  }

  List<UserModel> users = [];

  @action
  Future<void> fetchUser() async {
    isLoadingChange();
    final response =
        await vexanaManager!.networkManager.send<UserModel, List<UserModel>>(
      // ignore: unnecessary_string_interpolations
      "${NetworkEnum.USERS.rawValue}",
      method: RequestType.GET,
      parseModel: UserModel(),
    );
    if (response.data!.isNotEmpty) {
      for (var element in response.data!) {
        users.add(element);
      }
    }
    isLoadingChange();
  }
}
