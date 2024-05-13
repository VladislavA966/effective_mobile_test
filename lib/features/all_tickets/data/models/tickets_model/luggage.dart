import 'package:json_annotation/json_annotation.dart';

import 'price.dart';

part 'luggage.g.dart';

@JsonSerializable()
class Luggage {
  @JsonKey(name: 'has_luggage')
  bool? hasLuggage;
  TicketPriceModel? price;

  Luggage({this.hasLuggage, this.price});

  factory Luggage.fromJson(Map<String, dynamic> json) {
    return _$LuggageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LuggageToJson(this);
}
