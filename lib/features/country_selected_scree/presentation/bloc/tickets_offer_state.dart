part of 'tickets_offer_bloc.dart';

sealed class TicketsOfferState extends Equatable {
  const TicketsOfferState();

  @override
  List<Object> get props => [];
}

final class TicketsOfferInitial extends TicketsOfferState {}

final class TicketsOfferLoading extends TicketsOfferState {}

final class TicketsOfferLoaded extends TicketsOfferState {
  final TicketsOfferEntity ticketOffers;

  const TicketsOfferLoaded({required this.ticketOffers});
}

final class TicketsOfferError extends TicketsOfferState {
  final String message;

  const TicketsOfferError({required this.message});
}
