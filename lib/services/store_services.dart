part of 'services.dart';

class StoreServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future<List<StoreModel>> getAllStores() async {
    final getStoreRequest = await sendRequest(
      '/stores',
      method: RequestType.get,
      token: await FirebaseMessaging.instance.getToken(),
    );

    return storeModelFromJson(getStoreRequest.body);
  }

  Future saveDeviceId() async {
    await sendRequest(
      '/notifications/saveDeviceId/' + await _getToken(),
      method: RequestType.get,
    );
  }

  Future<String> _getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    String tokenString = token!;
    return tokenString;
  }

  Future<List<StoreModel>> getSearchStores(String query) async {
    final getStoreRequest = await sendRequest(
      '/stores/findStoreByName/$query',
      method: RequestType.get,
    );

    return storeModelFromJson(getStoreRequest.body);
  }
}
