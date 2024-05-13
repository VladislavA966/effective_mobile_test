import 'package:equatable/equatable.dart';

class PriceEntity extends Equatable {
  final int value;

  const PriceEntity({required this.value});

  @override
  List<Object?> get props => [value];
}
