import 'package:effective_mobile_test/features/country_selected_scree/data/data_source/tickets_offers_data_source.dart';
import 'package:effective_mobile_test/features/country_selected_scree/data/mappers/price_mapper.dart';
import 'package:effective_mobile_test/features/country_selected_scree/domain/entity/tickets_offer_entity.dart';
import 'package:effective_mobile_test/features/country_selected_scree/domain/repo/ticket_offers_repo.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: TicketsOfferRepo)
class TicketsOfferRepoImpl implements TicketsOfferRepo {
  final TicketsOffersRemoteImpl _remoteData;

  const TicketsOfferRepoImpl({required TicketsOffersRemoteImpl remoteData})
      : _remoteData = remoteData;
  @override
  Future<TicketsOfferEntity> loadTickets() async {
    final remoteData = await _remoteData.loadTickets();
    final domainData = remoteData.toEntity();
    return domainData;
  }
}
