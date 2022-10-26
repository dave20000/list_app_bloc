import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'core/injector/di.dart';
import 'presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DI.instance.setupInjection();
  HttpOverrides.global = MyHttpOverrides();

  runApp(
    const App(),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
