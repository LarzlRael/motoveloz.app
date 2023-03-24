part of 'utils.dart';

class ThemeChanger with ChangeNotifier {
  /* final preferences = UserPreferences(); */
  bool isDarkTheme = false;
  bool notifications = false;
  int _currentHomeworksTabIndex = 0;
  late ThemeData _currentTheme;

  int get getCurrentHomeworksTabIndex => _currentHomeworksTabIndex;
  set setCurrentHomeworksTabIndex(int value) {
    _currentHomeworksTabIndex = value;
    notifyListeners();
  }

  get getCurrentTheme => _currentTheme;
  ThemeChanger(bool isDarkTheme) {
    if (isDarkTheme) {
      _currentTheme = ThemeData.dark();
      isDarkTheme = true;
    } else {
      isDarkTheme = false;
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  bool get getDarkTheme => isDarkTheme;
  set setDarkTheme(bool value) {
    isDarkTheme = value;
    if (isDarkTheme) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  bool get getNotifications => notifications;
  set setNotifications(bool value) {
    notifications = value;
    notifyListeners();
  }
}
