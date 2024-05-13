import 'package:effective_mobile_test/features/all_tickets/domain/entity/ticket_entity.dart';

abstract class TickersRepo {
  Future<List<TicketDomain>> getTickets();
}
