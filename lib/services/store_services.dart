part of 'services.dart';

class StoreServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future<List<StoreModel>> getHomeworksByUser() async {
    final homeworkRequest = await sendRequest(
      '/stores',
      method: RequestType.get,
      token: await FirebaseMessaging.instance.getToken(),
    );

    return storeModelFromJson(homeworkRequest.body);
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
}
