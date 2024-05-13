import 'package:json_annotation/json_annotation.dart';

part 'price.g.dart';

@JsonSerializable()
class OfferPriceModel {
  int? value;

  OfferPriceModel({this.value});

  factory OfferPriceModel.fromJson(Map<String, dynamic> json) =>
      _$OfferPriceModelFromJson(json);

  Map<String, dynamic> toJson() => _$OfferPriceModelToJson(this);
}
