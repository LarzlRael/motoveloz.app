import 'package:WaraShops/data/constants.dart';
import 'package:WaraShops/provider/providers.dart';
import 'package:WaraShops/services/services.dart';
import 'package:WaraShops/theme/app_theme.dart';
import 'package:WaraShops/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:WaraShops/routes/routes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  /* FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding); */
  await PushNotificationService.initializeApp();
  await UserPreferences.init();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProviderNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /* final appTheme = Provider.of<ThemeProvider>(context).getCurrentTheme; */
    final appTheme = context.read<ThemeProviderNotifier>().appTheme;
    /* final AppTheme appTheme = ref.watch(themeNotifierProvider); */
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchProvider()),
      ],
      child: MaterialApp(
        routes: appRoutes,
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: appTheme.getTheme(),
        initialRoute: 'welcome',
      ),
    );
  }
}
