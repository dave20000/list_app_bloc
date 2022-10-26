import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';

import '../../presentation/ui/screens/character_detail/character_detail_screen.dart';
import '../../presentation/ui/screens/home/home_screen.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomeScreen,
      initial: true,
      children: [],
    ),
    AutoRoute(
      page: CharacterDetailScreen,
      children: [],
    ),
    RedirectRoute(path: '*', redirectTo: '/')
  ],
)
@Singleton()
class AppRouter extends _$AppRouter {}
