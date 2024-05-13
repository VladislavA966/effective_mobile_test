import 'package:effective_mobile_test/features/main_screen/domain/entity/offer_entity.dart';
import 'package:equatable/equatable.dart';

class OffersEntity extends Equatable {
  final List<OfferEntity> offers;

  const OffersEntity({required this.offers});

  @override
  List<Object?> get props => [offers];
}
