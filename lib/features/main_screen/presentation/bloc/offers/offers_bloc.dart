import 'package:bloc/bloc.dart';
import 'package:effective_mobile_test/features/main_screen/domain/entity/offers_entity.dart';
import 'package:effective_mobile_test/features/main_screen/domain/use_case/offers_use_case.dart';
import 'package:equatable/equatable.dart';

part 'offers_event.dart';
part 'offers_state.dart';

class OffersBloc extends Bloc<OffersEvent, OffersState> {
  final OffersUseCase _offersUseCase;
  OffersBloc(this._offersUseCase) : super(OffersInitial()) {
    on<GetOffersEvent>(_getOffersEvent);
  }
  Future<void> _getOffersEvent(
      GetOffersEvent event, Emitter<OffersState> emit) async {
    emit(OffersLoading());
    try {
      final response = await _offersUseCase.call();
      emit(OffersLoaded(offers: response));
    } catch (e) {
      emit(
        OffersError(
          message: e.toString(),
        ),
      );
    }
  }
}
