import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel extends INetworkModel<HomeModel> {
  int? id;
  String? title;
  double? price;
  String? category;
  String? description;
  String? image;

  HomeModel({
    this.id,
    this.title,
    this.price,
    this.category,
    this.description,
    this.image,
  });

  @override
  HomeModel fromJson(Map<String, dynamic> json) {
    return _$HomeModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$HomeModelToJson(this);
  }
}
