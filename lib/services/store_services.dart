part of 'services.dart';

class StoreServices {
  Future<List<StoreModel>> getHomeworksByUser() async {
    final homeworkRequest = await sendRequest(
      '/stores',
      method: RequestType.get,
      token: await FirebaseMessaging.instance.getToken(),
    );

    return storeModelFromJson(homeworkRequest.body);
  }
}
