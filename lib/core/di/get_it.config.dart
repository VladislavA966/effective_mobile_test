// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:effective_mobile_test/core/dio/dio_settings.dart' as _i16;
import 'package:effective_mobile_test/features/all_tickets/data/data_source/tickets_data_source.dart'
    as _i5;
import 'package:effective_mobile_test/features/all_tickets/data/repo_impl/tickets_repo_impl.dart'
    as _i8;
import 'package:effective_mobile_test/features/all_tickets/domain/repo/tickets_repo.dart'
    as _i7;
import 'package:effective_mobile_test/features/all_tickets/domain/use_case/tickets_use_case.dart'
    as _i15;
import 'package:effective_mobile_test/features/country_selected_scree/data/data_source/tickets_offers_data_source.dart'
    as _i4;
import 'package:effective_mobile_test/features/country_selected_scree/data/repository/tickets_offer_repo_impl.dart'
    as _i10;
import 'package:effective_mobile_test/features/country_selected_scree/domain/repo/ticket_offers_repo.dart'
    as _i9;
import 'package:effective_mobile_test/features/country_selected_scree/domain/use_case/tickets_offer_use_case.dart'
    as _i13;
import 'package:effective_mobile_test/features/main_screen/data/data_source/tickets_api_service.dart'
    as _i6;
import 'package:effective_mobile_test/features/main_screen/data/repository_impl/offer_repo_impl.dart'
    as _i12;
import 'package:effective_mobile_test/features/main_screen/domain/repo/offers_repository.dart'
    as _i11;
import 'package:effective_mobile_test/features/main_screen/domain/use_case/offers_use_case.dart'
    as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioSettings = _$DioSettings();
    gh.singleton<_i3.Dio>(() => dioSettings.dio);
    gh.singleton<_i4.TicketsOffersRemoteImpl>(
        () => _i4.TicketsOffersRemoteImpl());
    gh.singleton<_i5.TicketsDataSource>(() => _i5.TicketsDataSource());
    gh.singleton<_i6.TicketsApiService>(
        () => _i6.TicketsApiService(gh<_i3.Dio>()));
    gh.singleton<_i7.TickersRepo>(() =>
        _i8.TicketsRepoImpl(ticketsDataSource: gh<_i5.TicketsDataSource>()));
    gh.singleton<_i9.TicketsOfferRepo>(() => _i10.TicketsOfferRepoImpl(
        remoteData: gh<_i4.TicketsOffersRemoteImpl>()));
    gh.singleton<_i11.OffersRepository>(
        () => _i12.OffersRepoImpl(apiService: gh<_i6.TicketsApiService>()));
    gh.singleton<_i13.TicketOffersUseCase>(
        () => _i13.TicketOffersUseCase(repo: gh<_i9.TicketsOfferRepo>()));
    gh.singleton<_i14.OffersUseCase>(() =>
        _i14.OffersUseCase(offersRepository: gh<_i11.OffersRepository>()));
    gh.singleton<_i15.TicketsUseCase>(
        () => _i15.TicketsUseCase(repo: gh<_i7.TickersRepo>()));
    return this;
  }
}

class _$DioSettings extends _i16.DioSettings {}
