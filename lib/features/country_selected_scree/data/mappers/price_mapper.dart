import 'package:effective_mobile_test/features/country_selected_scree/data/models/ticket_offers_model/price.dart';
import 'package:effective_mobile_test/features/country_selected_scree/data/models/ticket_offers_model/ticket_offers_model.dart';
import 'package:effective_mobile_test/features/country_selected_scree/data/models/ticket_offers_model/tickets_offer.dart';
import 'package:effective_mobile_test/features/country_selected_scree/domain/entity/ticket_offer_price.dart';
import 'package:effective_mobile_test/features/country_selected_scree/domain/entity/ticket_offers_entity.dart';
import 'package:effective_mobile_test/features/country_selected_scree/domain/entity/tickets_offer_entity.dart';

extension TicketOfferPrice on PriceModel {
  TicketOfferPriceEntity toEntity() {
    return TicketOfferPriceEntity(
      value: value ?? 0,
    );
  }
}

extension TicketOffersMapper on TicketsOfferModel {
  TicketOffersEntity toEntity() {
    return TicketOffersEntity(
      id: id ?? 0,
      title: title ?? '',
      timeRange: timeRange ?? [],
      price: price!.toEntity(),
    );
  }
}

extension TicketsOfferMapper on TicketOffersModel {
  TicketsOfferEntity toEntity() {
    return TicketsOfferEntity(
      offers: ticketsOffers!.map((offer) => offer.toEntity()).toList(),
    );
  }
}
