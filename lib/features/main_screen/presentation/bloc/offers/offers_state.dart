part of 'offers_bloc.dart';

sealed class OffersState extends Equatable {
  const OffersState();

  @override
  List<Object> get props => [];
}

final class OffersInitial extends OffersState {}

final class OffersLoading extends OffersState {}

final class OffersLoaded extends OffersState {
  final OffersEntity offers;

  const OffersLoaded({required this.offers});
}

final class OffersError extends OffersState {
  final String message;

  const OffersError({required this.message});
}
