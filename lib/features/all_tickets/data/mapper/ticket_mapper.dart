import 'package:effective_mobile_test/features/all_tickets/data/models/tickets_model/ticket.dart';
import 'package:effective_mobile_test/features/all_tickets/domain/entity/ticket_entity.dart';

extension TicketMapper on Ticket {
  TicketDomain toEntity() {
    return TicketDomain(
      id: id ?? 0,
      badge: badge ?? '',
      price: price?.value ?? 0,
      providerName: providerName ?? '',
      company: company ?? '',
      departureDate: departure?.date ?? '',
      departureTown: departure?.town ?? '',
      departureAirport: departure?.airport ?? '',
      arrivalDate: arrival?.date ?? '',
      arrivalTown: arrival?.town ?? '',
      arrivalAirport: arrival?.airport ?? "",
      hasTransfer: hasTransfer,
      hasVisaTransfer: hasVisaTransfer,
      hasLuggage: luggage.hasLuggage ?? false,
      luggagePrice: luggage.price?.value,
      hasHandLuggage: handLuggage.hasHandLuggage ?? false,
      handLuggageSize: handLuggage.size,
      isReturnable: isReturnable,
      isExchangable: isExchangable,
    );
  }
}
