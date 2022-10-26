import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConnectivityService {
  static Future<bool> hasConnection() async {
    bool hasWifi = false;
    bool hasMobileConnection = false;
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      hasMobileConnection = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      hasWifi = true;
    }
    return hasWifi || hasMobileConnection;
  }
}
