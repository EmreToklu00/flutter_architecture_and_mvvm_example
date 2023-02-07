// ignore_for_file: file_names

abstract class INavigationService {
  Future<void> navigateToPage({String? path, Object? arguments});
  Future<void> navigateToPageClear({String? path, Object? data});
  Future<void> navigateBack();
}
