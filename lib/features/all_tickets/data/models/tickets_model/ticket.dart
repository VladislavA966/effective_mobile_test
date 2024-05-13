import 'package:json_annotation/json_annotation.dart';

import 'arrival.dart';
import 'departure.dart';
import 'hand_luggage.dart';
import 'luggage.dart';
import 'price.dart';

part 'ticket.g.dart';

@JsonSerializable()
class Ticket {
  int? id;
  String? badge;
  TicketPriceModel? price;
  @JsonKey(name: 'provider_name')
  String? providerName;
  String? company;
  Departure? departure;
  Arrival? arrival;
  @JsonKey(name: 'has_transfer')
  bool hasTransfer;
  @JsonKey(name: 'has_visa_transfer')
  bool hasVisaTransfer;
  Luggage luggage;
  @JsonKey(name: 'hand_luggage')
  HandLuggage handLuggage;
  @JsonKey(name: 'is_returnable')
  bool isReturnable;
  @JsonKey(name: 'is_exchangable')
  bool isExchangable;

  Ticket({
    required this.id,
    required this.badge,
    this.price,
    required this.providerName,
    required this.company,
    this.departure,
    required this.arrival,
    required this.hasTransfer,
    required this.hasVisaTransfer,
    required this.luggage,
    required this.handLuggage,
    required this.isReturnable,
    required this.isExchangable,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return _$TicketFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TicketToJson(this);
}
