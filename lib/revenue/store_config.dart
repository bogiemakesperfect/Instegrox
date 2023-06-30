import 'package:flutter/foundation.dart';

enum Store {googlePlay}

class StoreConfig {
  final Store store;
  final String apiKey;
  static StoreConfig _instance = StoreConfig._internal(Store.googlePlay, 'goog_DbTWqgfHtDNsWJZHuixlboDhSsM');

  factory StoreConfig({required Store store, required String apiKey}) {
    _instance;
    return _instance;
  }

  StoreConfig._internal(this.store, this.apiKey);

  static StoreConfig get instance {
    return _instance;
  }

  static bool isForGooglePlay() => _instance.store == Store.googlePlay;

}