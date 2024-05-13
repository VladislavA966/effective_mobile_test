import 'package:equatable/equatable.dart';

class TicketDomain extends Equatable {
  final int id;
  final String? badge;
  final int price;
  final String providerName;
  final String company;
  final String departureDate;
  final String departureTown;
  final String departureAirport;
  final String arrivalDate;
  final String arrivalTown;
  final String arrivalAirport;
  final bool hasTransfer;
  final bool hasVisaTransfer;
  final bool hasLuggage;
  final int? luggagePrice;
  final bool hasHandLuggage;
  final String? handLuggageSize;
  final bool isReturnable;
  final bool isExchangable;

  TicketDomain({
    required this.id,
    this.badge,
    required this.price,
    required this.providerName,
    required this.company,
    required this.departureDate,
    required this.departureTown,
    required this.departureAirport,
    required this.arrivalDate,
    required this.arrivalTown,
    required this.arrivalAirport,
    required this.hasTransfer,
    required this.hasVisaTransfer,
    required this.hasLuggage,
    this.luggagePrice,
    required this.hasHandLuggage,
    this.handLuggageSize,
    required this.isReturnable,
    required this.isExchangable,
  });

  @override
  List<Object?> get props => [
        id,
        badge,
        price,
        providerName,
        company,
        departureDate,
        departureTown,
        departureAirport,
        arrivalDate,
        arrivalAirport,
        hasTransfer,
        hasVisaTransfer,
        hasLuggage,
        luggagePrice,
        hasHandLuggage,
        handLuggageSize,
        isReturnable,
        isExchangable,
      ];
}
