import 'package:effective_mobile_test/features/main_screen/domain/entity/price_entity.dart';
import 'package:equatable/equatable.dart';

class OfferEntity extends Equatable {
  final int id;
  final String title;
  final String town;
  final PriceEntity price;

  const OfferEntity(
      {required this.id,
      required this.title,
      required this.town,
      required this.price});

  @override
  List<Object?> get props => [
        id,
        title,
        town,
        price,
      ];
}
