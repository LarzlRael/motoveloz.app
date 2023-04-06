part of 'services.dart';

/* const _baseURL = 'http://192.168.0.106:4000/api'; */
const _baseURL = 'https://motovelozapi-production.up.railway.app/api';

enum RequestType {
  get,
  post,
  put,
  delete,
}

Future<http.Response> sendRequest(
  String path, {
  required RequestType method,
  Map<String, dynamic>? body,
  String? token,
}) async {
  final uri = Uri.parse('$_baseURL$path');
  final headers = {
    'Content-Type': 'application/json',
    if (token != null) 'Authorization': 'Bearer $token',
  };
  switch (method) {
    case RequestType.get:
      return await http.get(uri, headers: headers);
    case RequestType.post:
      return await http.post(uri, headers: headers, body: jsonEncode(body));
    case RequestType.put:
      return await http.put(uri, headers: headers, body: jsonEncode(body));
    case RequestType.delete:
      return await http.delete(uri, headers: headers);
  }
}
