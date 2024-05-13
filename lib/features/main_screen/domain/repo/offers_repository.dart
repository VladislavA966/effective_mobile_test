import 'package:effective_mobile_test/features/main_screen/domain/entity/offers_entity.dart';

abstract class OffersRepository {
  Future<OffersEntity> getOffers();
}
