import 'package:json_annotation/json_annotation.dart';

part "name_model.g.dart";

@JsonSerializable()
class NameModel {
  final String? firstname;
  final String? lastname;

  NameModel({
    this.firstname,
    this.lastname,
  });

  factory NameModel.fromJson(Map<String, dynamic> json) {
    /* return NameModel(
      firstname: json['firstname'],
      lastname: json['lastname'],
    ); */
    return _$NameModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    /* Map<String, dynamic> data = <String, dynamic>{};
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    return data; */
    return _$NameModelToJson(this);
  }
}
