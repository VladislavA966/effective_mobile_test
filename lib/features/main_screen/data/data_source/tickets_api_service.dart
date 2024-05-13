import 'package:dio/dio.dart';
import 'package:effective_mobile_test/core/consts/network_consts.dart';
import 'package:effective_mobile_test/features/main_screen/data/model/offers_model/offers_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'tickets_api_service.g.dart';

@RestApi()
@singleton
abstract class TicketsApiService {
  @factoryMethod
  factory TicketsApiService(Dio dio) = _TicketsApiService;

  @GET(NetworkConsts.offers)
  Future<HttpResponse<OffersModel>> getOffers();
}
