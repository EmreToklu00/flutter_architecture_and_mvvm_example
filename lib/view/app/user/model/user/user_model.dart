import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../adress/adress_model.dart';
import '../name/name_model.dart';

part "user_model.g.dart";

@JsonSerializable()
class UserModel extends INetworkModel<UserModel> {
  final int? id;
  final String? email;
  final String? username;
  final String? password;
  final NameModel? name;
  final AddressModel? address;

  final String? phone;

  UserModel({
    this.id,
    this.email,
    this.username,
    this.password,
    this.name,
    this.address,
    this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    /* return UserModel(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      name: NameModel.fromJson(json['name']),
      address: AddressModel.fromJson(json['address']),
      phone: json['phone'],
    ); */
    return _$UserModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    /* Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    data['name'] = name?.toJson();
    data['address'] = address?.toJson();
    data['phone'] = phone;
    return data; */
    return _$UserModelToJson(this);
  }

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }
}
