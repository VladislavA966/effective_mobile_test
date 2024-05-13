import 'package:json_annotation/json_annotation.dart';

part 'price.g.dart';

@JsonSerializable()
class PriceModel {
  int? value;

  PriceModel({this.value});

  factory PriceModel.fromJson(Map<String, dynamic> json) =>
      _$PriceModelFromJson(json);

  Map<String, dynamic> toJson() => _$PriceModelToJson(this);
}
