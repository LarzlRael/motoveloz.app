part of 'services.dart';

class StoreServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future<List<StoreModel>> getAllStores() async {
    final getStoreRequest = await Request.sendRequest(
      RequestType.get,
      '/stores',
    );

    return storeModelFromJson(getStoreRequest.body);
  }

  Future saveDeviceId() async {
    await Request.sendRequest(
      RequestType.get,
      '/notifications/saveDeviceId/' + await _getDeviceToken(),
    );
  }

  Future<String> _getDeviceToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    String tokenString = token!;
    return tokenString;
  }

  Future<List<StoreModel>> getSearchStores(String query) async {
    final getStoreRequest = await Request.sendRequest(
      RequestType.get,
      '/stores/findStoreByName/$query',
    );

    return storeModelFromJson(getStoreRequest.body);
  }
}
