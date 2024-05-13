import 'package:effective_mobile_test/features/country_selected_scree/domain/entity/ticket_offer_price.dart';
import 'package:equatable/equatable.dart';

class TicketOffersEntity extends Equatable {
  final int id;
  final String title;

  final List<String>? timeRange;
  final TicketOfferPriceEntity price;

  const TicketOffersEntity(
      {required this.id,
      required this.title,
      required this.timeRange,
      required this.price});
  @override
  List<Object?> get props => [
        id,
        title,
        timeRange,
        price,
      ];
}
