import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static initEnviroment() async {
    await dotenv.load(
      fileName: '.env',
    );
  }

  static String serverUrl =
      dotenv.env['SERVER_URL'] ?? 'No está configurado el API_URL';
}
