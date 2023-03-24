part of 'utils.dart';

class UserPreferences {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get isDarkTheme => _prefs.getBool('isDarkTheme') ?? false;

  static set isDarkTheme(bool value) {
    _prefs.setBool('isDarkTheme', value);
  }
}
