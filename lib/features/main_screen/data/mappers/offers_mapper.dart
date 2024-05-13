import 'package:effective_mobile_test/features/main_screen/data/model/offers_model/offer.dart';
import 'package:effective_mobile_test/features/main_screen/data/model/offers_model/offers_model.dart';
import 'package:effective_mobile_test/features/main_screen/data/model/offers_model/price.dart';
import 'package:effective_mobile_test/features/main_screen/domain/entity/offer_entity.dart';
import 'package:effective_mobile_test/features/main_screen/domain/entity/offers_entity.dart';
import 'package:effective_mobile_test/features/main_screen/domain/entity/price_entity.dart';

extension OffersMapper on OffersModel {
  OffersEntity toEntity() {
    return OffersEntity(
        offers: offers!.map((offer) => offer.toEntity()).toList());
  }
}

extension OfferMapper on OfferModel {
  OfferEntity toEntity() {
    return OfferEntity(
      id: id ?? 0,
      title: title ?? '',
      town: town ?? '',
      price: price!.toEntity(),
    );
  }
}

extension PriceMapper on OfferPriceModel {
  PriceEntity toEntity() {
    return PriceEntity(value: value ?? 0);
  }
}
