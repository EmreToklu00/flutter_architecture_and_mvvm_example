import '../enum/network_enum.dart';

extension NetworkExtension on NetworkEnum {
  String get rawValue {
    switch (this) {
      case NetworkEnum.USERS:
        return 'users';
      case NetworkEnum.PRODUCT:
        return 'products';
      case NetworkEnum.CART:
        return 'carts';
      default:
        throw 'ERROR TYPE';
    }
  }
}
