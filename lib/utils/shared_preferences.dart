part of 'utils.dart';

class UserPreferences {
  //no one this propertyes it is used

  static final UserPreferences _instancia = UserPreferences._internal();

  factory UserPreferences() {
    return _instancia;
  }

  UserPreferences._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get loginEmail {
    return _prefs.getString('loginEmail') ?? '';
  }

  set loginEmail(String value) {
    _prefs.setString('loginEmail', value);
  }

  bool get showInitialSlider {
    return _prefs.getBool('showInitialSlider') ?? true;
  }

  set setShowInitialSlider(bool value) {
    _prefs.setBool('showInitialSlider', value);
  }
}