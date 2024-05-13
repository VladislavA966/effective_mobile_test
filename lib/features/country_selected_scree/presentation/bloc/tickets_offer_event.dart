part of 'tickets_offer_bloc.dart';

sealed class TicketsOfferEvent extends Equatable {
  const TicketsOfferEvent();

  @override
  List<Object> get props => [];
}

final class GetTicketsOfferEvent extends TicketsOfferEvent {}
