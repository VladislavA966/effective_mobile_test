import 'package:effective_mobile_test/core/use_case/use_case.dart';
import 'package:effective_mobile_test/features/country_selected_scree/domain/entity/tickets_offer_entity.dart';
import 'package:effective_mobile_test/features/country_selected_scree/domain/repo/ticket_offers_repo.dart';
import 'package:injectable/injectable.dart';

@singleton
class TicketOffersUseCase extends UseCase<Future<TicketsOfferEntity>, void> {
  final TicketsOfferRepo repo;

  TicketOffersUseCase({required this.repo});
  @override
  Future<TicketsOfferEntity> call({void params}) async {
    return await repo.loadTickets();
  }
}
