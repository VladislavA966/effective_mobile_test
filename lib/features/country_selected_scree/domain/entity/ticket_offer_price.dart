import 'package:equatable/equatable.dart';

class TicketOfferPriceEntity extends Equatable {
  final int value;

  const TicketOfferPriceEntity({required this.value});
  @override
  List<Object?> get props => [value];
}
