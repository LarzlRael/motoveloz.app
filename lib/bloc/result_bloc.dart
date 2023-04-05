import 'dart:async';

import 'package:WaraShops/models/models.dart';

import '../services/services.dart';

class ResultBloc {
  static final ResultBloc _singleton = new ResultBloc._internal();

  factory ResultBloc() {
    return _singleton;
  }

  ResultBloc._internal() {
    // get all scans from database
  }

  getSearchStore(String query) async {
    if (!query.isEmpty) {
      _resultController.sink.add(await StoreServices().getSearchStores(query));
    } else {
      _resultController.sink.add(await StoreServices().getAllStores());
    }
  }

  // add to data stream

  final _resultController = StreamController<List<StoreModel>>.broadcast();

  Stream<List<StoreModel>> get resulStream => _resultController.stream;
  /* Stream<List<ScanModel>> get scansStreamHttp =>
      _scansController.stream.transform(validarHttp);  */
  dispose() {
    _resultController.close();
  }
}
