// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/product/extension/network_extension.dart';
import 'package:mobx/mobx.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../product/enum/network_enum.dart';
import '../model/home_model.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  @override
  void init() {
    formattedDate =
        "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year}";
  }

  @observable
  bool isLoading = false;

  DateTime now = DateTime.now();
  late String formattedDate;

  void isLoadingChange() {
    isLoading = !isLoading;
  }

  List<HomeModel> products = [];

  @action
  Future<void> fetchProducts() async {
    isLoadingChange();
    final response =
        await vexanaManager!.networkManager.send<HomeModel, List<HomeModel>>(
      NetworkEnum.PRODUCT.rawValue,
      method: RequestType.GET,
      parseModel: HomeModel(),
    );
    try {
      if (response.data!.isNotEmpty) {
        for (var element in response.data!) {
          products.add(element);
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    isLoadingChange();
  }
}
