import 'package:json_annotation/json_annotation.dart';

import 'price.dart';

part 'offer.g.dart';

@JsonSerializable()
class OfferModel {
  int? id;
  String? title;
  String? town;
  OfferPriceModel? price;

  OfferModel({this.id, this.title, this.town, this.price});

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$OfferModelToJson(this);
}
