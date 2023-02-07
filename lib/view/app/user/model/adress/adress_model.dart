import 'package:json_annotation/json_annotation.dart';

import '../geolocation/geolocation_model.dart';

part "adress_model.g.dart";

@JsonSerializable()
class AddressModel {
  final String? city;
  final String? street;
  final int? number;
  final String? zipcode;
  final GeolocationModel? geolocation;

  AddressModel({
    this.city,
    this.street,
    this.number,
    this.zipcode,
    this.geolocation,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    /*  return AddressModel(
      city: json['city'],
      street: json['street'],
      number: json['number'],
      zipcode: json['zipcode'],
      geolocation: GeolocationModel.fromJson(json['geolocation']),
    ); */
    return _$AddressModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    /* Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['street'] = street;
    data['number'] = number;
    data['zipcode'] = zipcode;
    return data; */
    return _$AddressModelToJson(this);
  }
}
