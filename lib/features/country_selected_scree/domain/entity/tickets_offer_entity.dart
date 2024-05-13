import 'package:effective_mobile_test/features/country_selected_scree/domain/entity/ticket_offers_entity.dart';
import 'package:equatable/equatable.dart';

class TicketsOfferEntity extends Equatable {
  final List<TicketOffersEntity> offers;

  const TicketsOfferEntity({required this.offers});
  @override
  List<Object?> get props => [offers];
}
