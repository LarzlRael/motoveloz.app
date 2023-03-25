part of 'utils.dart';

class ThemeChanger with ChangeNotifier {
  bool _isDarkTheme = false;
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

  bool get isDarkTheme => _isDarkTheme;
  set setDarkTheme(bool value) {
    _isDarkTheme = value;
    _currentTheme = isDarkTheme
        ? ThemeData.dark()
        : ThemeData.light()
            .copyWith(appBarTheme: AppBarTheme(color: Color(0xff33b5e5)));
    notifyListeners();
  }
}
