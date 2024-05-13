import 'package:json_annotation/json_annotation.dart';

import 'price.dart';

part 'tickets_offer.g.dart';

@JsonSerializable()
class TicketsOfferModel {
  int? id;
  String? title;
  @JsonKey(name: 'time_range')
  List<String>? timeRange;
  PriceModel? price;

  TicketsOfferModel({this.id, this.title, this.timeRange, this.price});

  factory TicketsOfferModel.fromJson(Map<String, dynamic> json) {
    return _$TicketsOfferModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TicketsOfferModelToJson(this);
}
