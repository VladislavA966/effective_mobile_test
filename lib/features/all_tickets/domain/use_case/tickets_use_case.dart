import 'package:effective_mobile_test/core/use_case/use_case.dart';
import 'package:effective_mobile_test/features/all_tickets/domain/entity/ticket_entity.dart';
import 'package:effective_mobile_test/features/all_tickets/domain/repo/tickets_repo.dart';
import 'package:injectable/injectable.dart';

@singleton
class TicketsUseCase extends UseCase<Future<List<TicketDomain>>, void> {
  final TickersRepo repo;

  TicketsUseCase({required this.repo});
  @override
  Future<List<TicketDomain>> call({void params}) async {
    return await repo.getTickets();
  }
}
