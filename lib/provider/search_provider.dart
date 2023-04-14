part of './providers.dart';

class SearchProvider with ChangeNotifier {
  List<StoreModel> _stores = [];
  String querySearched = '';

  List<StoreModel> get getStores => _stores;
  set setStores(List<StoreModel> value) {
    _stores = value;
    notifyListeners();
  }

  String get getQuerySearched => querySearched;
  set setQuerySearched(String value) {
    querySearched = value;
    notifyListeners();
  }
}
