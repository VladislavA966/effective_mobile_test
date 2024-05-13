import 'package:effective_mobile_test/features/all_tickets/data/data_source/tickets_data_source.dart';
import 'package:effective_mobile_test/features/all_tickets/data/mapper/ticket_mapper.dart';
import 'package:effective_mobile_test/features/all_tickets/domain/entity/ticket_entity.dart';
import 'package:effective_mobile_test/features/all_tickets/domain/repo/tickets_repo.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: TickersRepo)
class TicketsRepoImpl implements TickersRepo {
  final TicketsDataSource _ticketsDataSource;

  TicketsRepoImpl({required TicketsDataSource ticketsDataSource})
      : _ticketsDataSource = ticketsDataSource;
  @override
  Future<List<TicketDomain>> getTickets() async {
    final remoteData = await _ticketsDataSource.getTickets();
    final domainData =
        remoteData.tickets?.map((ticket) => ticket.toEntity()).toList() ?? [];
    return domainData;
  }
}
