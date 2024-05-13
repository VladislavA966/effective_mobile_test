import 'package:json_annotation/json_annotation.dart';

import 'offer.dart';

part 'offers_model.g.dart';

@JsonSerializable()
class OffersModel {
  List<OfferModel>? offers;

  OffersModel({this.offers});

  factory OffersModel.fromJson(Map<String, dynamic> json) {
    return _$OffersModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OffersModelToJson(this);
}
