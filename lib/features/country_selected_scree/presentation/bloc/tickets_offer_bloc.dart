import 'package:bloc/bloc.dart';
import 'package:effective_mobile_test/features/country_selected_scree/domain/entity/tickets_offer_entity.dart';
import 'package:effective_mobile_test/features/country_selected_scree/domain/use_case/tickets_offer_use_case.dart';
import 'package:equatable/equatable.dart';

part 'tickets_offer_event.dart';
part 'tickets_offer_state.dart';

class TicketsOfferBloc extends Bloc<TicketsOfferEvent, TicketsOfferState> {
  final TicketOffersUseCase _ticketOffersUseCase;
  TicketsOfferBloc(this._ticketOffersUseCase) : super(TicketsOfferInitial()) {
    on<GetTicketsOfferEvent>(_getTicketOffers);
  }
  Future<void> _getTicketOffers(
    GetTicketsOfferEvent event,
    Emitter<TicketsOfferState> emit,
  ) async {
    emit(TicketsOfferLoading());
    try {
      final ticketOffers = await _ticketOffersUseCase();
      emit(TicketsOfferLoaded(ticketOffers: ticketOffers));
    } catch (e) {
      emit(
        TicketsOfferError(
          message: e.toString(),
        ),
      );
    }
  }
}
