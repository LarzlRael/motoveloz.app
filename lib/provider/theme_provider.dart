part of './providers.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkModeEnabled = false;
  bool notifications = false;
  int _currentHomeworksTabIndex = 0;
  late ThemeData _currentTheme;

  int get getCurrentHomeworksTabIndex => _currentHomeworksTabIndex;
  set setCurrentHomeworksTabIndex(int value) {
    _currentHomeworksTabIndex = value;
    notifyListeners();
  }

  get getCurrentTheme => _currentTheme;
  ThemeProvider(bool isDarkTheme) {
    if (isDarkTheme) {
      _currentTheme = ThemeData.dark();
      isDarkTheme = true;
    } else {
      isDarkTheme = false;
      _currentTheme = ThemeData.light()
          .copyWith(appBarTheme: AppBarTheme(color: primaryColor));
    }
    notifyListeners();
  }

  bool get isDarkModeEnabled => _isDarkModeEnabled;
  set setDarkTheme(bool value) {
    _isDarkModeEnabled = value;
    _currentTheme = isDarkModeEnabled
        ? ThemeData.dark()
        : ThemeData.light()
            .copyWith(appBarTheme: AppBarTheme(color: primaryColor));
    notifyListeners();
  }

  ThemeData getTheme() {
    return _isDarkModeEnabled ? ThemeData.dark() : ThemeData.light();
  }
}
