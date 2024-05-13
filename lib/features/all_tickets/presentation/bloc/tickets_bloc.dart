import 'package:bloc/bloc.dart';
import 'package:effective_mobile_test/features/all_tickets/domain/entity/ticket_entity.dart';
import 'package:effective_mobile_test/features/all_tickets/domain/use_case/tickets_use_case.dart';
import 'package:equatable/equatable.dart';

part 'tickets_event.dart';
part 'tickets_state.dart';

class TicketsBloc extends Bloc<TicketsEvent, TicketsState> {
  final TicketsUseCase _ticketsUseCase;
  TicketsBloc(this._ticketsUseCase) : super(TicketsInitial()) {
    on<TicketsEvent>(_getTickets);
  }
  Future<void> _getTickets(
      TicketsEvent event, Emitter<TicketsState> emit) async {
    emit(TicketsLoading());
    try {
      final tickets = await _ticketsUseCase();
      emit(TicketsLoaded(tickets: tickets));
    } catch (e) {
      emit(
        TicketsError(
          message: e.toString(),
        ),
      );
    }
  }
}
