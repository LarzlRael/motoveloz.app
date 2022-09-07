import 'package:flutter/material.dart';
import 'package:shops_business/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'list_shops',
      routes: appRoutes,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
    );
  }
}
