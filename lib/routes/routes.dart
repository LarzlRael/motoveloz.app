import 'package:flutter/material.dart';
import 'package:WaraShops/pages/pages.dart';

import '../utils/utils.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  /* Register and login  */
  'list_shops': (_) => ShopsListsPage(),
  'go_url': (context) => WebViewPage(
        loadWeb: ModalRoute.of(context)?.settings.arguments as LoadWeb,
      ),
};
