import 'package:flutter/material.dart';
import 'package:WaraClick/pages/pages.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  /* Register and login  */
  'list_shops': (_) => ShopsListsPage(),
  'settings_page': (_) => SettingsPage(),
};
