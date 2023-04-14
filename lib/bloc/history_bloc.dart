import 'dart:async';

import 'package:WaraShops/data/sql_lite_provider.dart';
import 'package:WaraShops/models/models.dart';

class HistoryBloc {
  static final HistoryBloc _singleton = new HistoryBloc._internal();

  factory HistoryBloc() {
    return _singleton;
  }

  HistoryBloc._internal() {
    // get all scans from database
  }

  saveHistory(HistoryModel history) async {
    await DBProvider.db.saveRaw(history);
    getAllHistory();
  }

  getAllHistory() async {
    _scansController.sink.add(await DBProvider.db.getAllHistory());
  }

  deleteHistoryById(int id) async {
    await DBProvider.db.deleteHistoryById(id);
    getAllHistory();
  }

  deleteAllScans() async {
    await DBProvider.db.deleteAll();
    getAllHistory();
  }

  // add to data stream

  final _scansController = StreamController<List<HistoryModel>>.broadcast();

  Stream<List<HistoryModel>> get historyStream => _scansController.stream;
  /* Stream<List<ScanModel>> get scansStreamHttp =>
      _scansController.stream.transform(validarHttp);  */
  dispose() {
    _scansController.close();
  }
}
