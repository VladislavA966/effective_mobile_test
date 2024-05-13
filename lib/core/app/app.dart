import 'package:effective_mobile_test/config/router.dart';
import 'package:effective_mobile_test/core/di/inject.dart';
import 'package:effective_mobile_test/core/resources/app_colors.dart';
import 'package:effective_mobile_test/features/main_screen/presentation/bloc/offers/offers_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OffersBloc(
        inject(),
      ),
      child: MaterialApp.router(
        theme: ThemeData(scaffoldBackgroundColor: AppColors.black),
        routerConfig: router,
      ),
    );
  }
}
