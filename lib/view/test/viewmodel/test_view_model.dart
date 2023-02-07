// ignore_for_file: library_private_types_in_public_api, unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:vexana/vexana.dart';
import '../../../core/base/viewmodel/base_view_model.dart';
import '../model/test_model.dart';
part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  @override
  void init() {
    getJsonData();
  }

  @observable
  bool isLoading = false;
  List<TestModel> posts = [];

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  @observable
  int number = 6;

  @action
  void incrementNumber() {
    number++;
  }

  Future<void> getJsonData() async {
    isLoadingChange();
    final response = await vexanaManager?.networkManager
        .send<TestModel, List<TestModel>>("posts",
            parseModel: TestModel(), method: RequestType.GET);
    if (response?.data is List) {
      posts.addAll(response!.data!);
    } else {
      // ignore: avoid_print
      print("get json data error");
    }
    isLoadingChange();
  }
}
