import 'package:effective_mobile_test/core/use_case/use_case.dart';
import 'package:effective_mobile_test/features/main_screen/domain/entity/offers_entity.dart';
import 'package:effective_mobile_test/features/main_screen/domain/repo/offers_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class OffersUseCase extends UseCase<Future<OffersEntity>, void> {
  final OffersRepository _offersRepository;

  OffersUseCase({required OffersRepository offersRepository})
      : _offersRepository = offersRepository;
  @override
  Future<OffersEntity> call({void params}) async {
    return await _offersRepository.getOffers();
  }
}
