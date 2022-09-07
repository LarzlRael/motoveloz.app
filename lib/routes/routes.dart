import 'package:flutter/material.dart';
import 'package:shops_business/pages/pages.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  /* Register and login  */
  'list_shops': (_) => ShopsListsPage(),
};
