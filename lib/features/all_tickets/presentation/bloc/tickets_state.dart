part of 'tickets_bloc.dart';

sealed class TicketsState extends Equatable {
  const TicketsState();

  @override
  List<Object> get props => [];
}

final class TicketsInitial extends TicketsState {}

final class TicketsLoading extends TicketsState {}

final class TicketsLoaded extends TicketsState {
  final List<TicketDomain> tickets;

  const TicketsLoaded({required this.tickets});
}

final class TicketsError extends TicketsState {
  final String message;

  const TicketsError({required this.message});
}
