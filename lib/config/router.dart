import 'package:effective_mobile_test/config/routes.dart';
import 'package:effective_mobile_test/core/di/inject.dart';
import 'package:effective_mobile_test/features/all_tickets/presentation/bloc/tickets_bloc.dart';
import 'package:effective_mobile_test/features/all_tickets/presentation/view/all_tickets_screen.dart';
import 'package:effective_mobile_test/features/country_selected_scree/presentation/bloc/tickets_offer_bloc.dart';
import 'package:effective_mobile_test/features/geo/geo_screen.dart';
import 'package:effective_mobile_test/features/home_screen/presentation/home_screen.dart';
import 'package:effective_mobile_test/features/hotels/hotels_screen.dart';
import 'package:effective_mobile_test/features/main_screen/presentation/bloc/offers/offers_bloc.dart';
import 'package:effective_mobile_test/features/main_screen/presentation/view/main_screen.dart';
import 'package:effective_mobile_test/features/profile/profile_screen.dart';
import 'package:effective_mobile_test/features/subsritions/sub_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/country_selected_scree/presentation/view/country_selected_scree.dart';

final router = GoRouter(
  initialLocation: '/main',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BottomNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/main',
              builder: (context, state) => BlocProvider(
                create: (context) => OffersBloc(
                  inject(),
                ),
                child: const MainScreen(),
              ),
              routes: [
                GoRoute(
                  path: 'selectedCountryScreen',
                  name: Routes.selectedCountryScreen.name,
                  builder: (context, state) {
                    final toController =
                        state.uri.queryParameters["toController"];
                    final fromController =
                        state.uri.queryParameters["fromController"];
                    return BlocProvider(
                      create: (context) => TicketsOfferBloc(
                        inject(),
                      ),
                      child: CountrySelectedScreen(
                        toController: toController ?? '',
                        fromController: fromController ?? '',
                      ),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'allTicketsScreen',
                      name: Routes.allTicketsScreen.name,
                      builder: (context, state) {
                        final fromCity = state.uri.queryParameters["fromCity"];
                        final toCity = state.uri.queryParameters["toCity"];
                        final departure =
                            state.uri.queryParameters["departureDate"];
                        return BlocProvider(
                          create: (context) => TicketsBloc(
                            inject(),
                          ),
                          child: AllTicketsScreen(
                            toCity: toCity ?? '',
                            fromCity: fromCity ?? '',
                            departureDate: departure ?? '',
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/hotels',
              builder: (context, state) => const HotelsScreen(),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/geo',
              builder: (context, state) => const GeoScreen(),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/notifications',
              builder: (context, state) => const SubScreen(),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/notifications',
              builder: (context, state) => const ProfileScreen(),
              routes: [],
            ),
          ],
        ),
      ],
    ),
  ],
);
