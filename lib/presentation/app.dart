import 'package:flutter/material.dart';

import '../core/injector/di.dart';
import '../core/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = DI.resolve<AppRouter>();
    return MaterialApp.router(
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
      title: "List App Bloc",
      debugShowCheckedModeBanner: false,
    );
  }
}
