import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:timeware_test/src/features/login/presentation/pages/login_page.dart';
import 'package:timeware_test/src/shared/user/presentation/view_model/user_view_model.dart';

enum AppRoute {
  login(name: 'login'),
  vulnerableSpecies(name: 'vulnerable_species'),
  vulnerableSpeciesDetail(name: 'vulnerable_species_detail');

  final String name;

  const AppRoute({required this.name});
}

final goRouter = GoRouter(
  initialLocation: '/${AppRoute.login.name}',
  redirect: (BuildContext context, GoRouterState state) {
    final isAuthenticated = context.read<UserViewModel>().state ?? false;
    if (!isAuthenticated) {
      return "/${AppRoute.login.name}";
    }

    if (isAuthenticated && (state.matchedLocation.contains(AppRoute.login.name))) {
      return "/${AppRoute.vulnerableSpecies.name}";
    }

    return null;
  },
  routes: [
    GoRoute(
      path: '/login',
      name: AppRoute.login.name,
      builder: (_, __) => const LoginPage(),
    ),
  ],
);
