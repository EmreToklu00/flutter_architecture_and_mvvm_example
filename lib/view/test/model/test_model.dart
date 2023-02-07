import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'test_model.g.dart';

@JsonSerializable()
class TestModel extends INetworkModel<TestModel> {
  int? userId;
  int? id;
  String? title;
  String? body;

  TestModel({this.userId, this.id, this.title, this.body});

  @override
  Map<String, dynamic> toJson() {
    return _$TestModelToJson(this);
  }

  @override
  TestModel fromJson(Map<String, dynamic> json) {
    return _$TestModelFromJson(json);
  }
}
