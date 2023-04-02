import 'package:WaraShops/data/constants.dart';
import 'package:WaraShops/services/services.dart';
import 'package:WaraShops/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:WaraShops/routes/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  await UserPreferences.init();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(UserPreferences.isDarkTheme),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeProvider>(context).getCurrentTheme;
    return MaterialApp(
      routes: appRoutes,
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: appTheme,
      initialRoute: 'list_shops',
    );
  }
}
