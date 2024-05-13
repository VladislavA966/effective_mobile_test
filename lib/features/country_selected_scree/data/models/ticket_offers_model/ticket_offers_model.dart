import 'package:json_annotation/json_annotation.dart';

import 'tickets_offer.dart';

part 'ticket_offers_model.g.dart';

@JsonSerializable()
class TicketOffersModel {
  @JsonKey(name: 'tickets_offers')
  List<TicketsOfferModel>? ticketsOffers;

  TicketOffersModel({this.ticketsOffers});

  factory TicketOffersModel.fromJson(Map<String, dynamic> json) {
    return _$TicketOffersModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TicketOffersModelToJson(this);
}
