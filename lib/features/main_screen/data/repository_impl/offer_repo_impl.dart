import 'dart:io';

import 'package:dio/dio.dart';
import 'package:effective_mobile_test/features/main_screen/data/data_source/tickets_api_service.dart';
import 'package:effective_mobile_test/features/main_screen/data/mappers/offers_mapper.dart';
import 'package:effective_mobile_test/features/main_screen/domain/entity/offers_entity.dart';
import 'package:effective_mobile_test/features/main_screen/domain/repo/offers_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@Singleton(as: OffersRepository)
class OffersRepoImpl implements OffersRepository {
  final TicketsApiService _apiService;

  OffersRepoImpl({required TicketsApiService apiService})
      : _apiService = apiService;
  @override
  Future<OffersEntity> getOffers() async {
    final hasInternetAccess = await InternetConnectionChecker().hasConnection;
    if (!hasInternetAccess) {
      throw Exception();
    }
    try {
      final httpResponse = await _apiService.getOffers();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return httpResponse.data.toEntity();
      } else {
        throw Exception();
      }
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }
}
