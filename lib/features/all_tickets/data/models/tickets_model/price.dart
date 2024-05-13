import 'package:json_annotation/json_annotation.dart';

part 'price.g.dart';

@JsonSerializable()
class TicketPriceModel {
  int? value;

  TicketPriceModel({this.value});

  factory TicketPriceModel.fromJson(Map<String, dynamic> json) =>
      _$TicketPriceModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketPriceModelToJson(this);
}
