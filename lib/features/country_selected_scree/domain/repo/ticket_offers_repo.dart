import 'package:effective_mobile_test/features/country_selected_scree/domain/entity/tickets_offer_entity.dart';

abstract class TicketsOfferRepo {
  Future<TicketsOfferEntity> loadTickets();
}
