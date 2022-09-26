import 'package:WaraShops/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:WaraShops/routes/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = UserPreferences();
  await preferences.initPreferences();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeChanger(preferences.getThemeStatus),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).getCurrentTheme;
    return MaterialApp(
      initialRoute: 'list_shops',
      routes: appRoutes,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: appTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
