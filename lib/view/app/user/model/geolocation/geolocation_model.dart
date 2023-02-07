import 'package:json_annotation/json_annotation.dart';

part "geolocation_model.g.dart";

@JsonSerializable()
class GeolocationModel {
  final String? lat;
  final String? long;

  GeolocationModel({this.lat, this.long});

  factory GeolocationModel.fromJson(Map<String, dynamic> json) {
    /* return GeolocationModel(
      lat: json['lat'],
      long: json['long'],
    ); */
    return _$GeolocationModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    /* Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['long'] = long;
    return data; */
    return _$GeolocationModelToJson(this);
  }
}
