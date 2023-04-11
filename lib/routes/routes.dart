import 'package:flutter/material.dart';
import 'package:WaraShops/pages/pages.dart';

import '../utils/utils.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  /* Register and login  */
  'list_shops': (_) => ShopsListsPage(),
  'gps_request': (_) => AccesoGpsPage(),
  'loading_page': (_) => LoadingPage(),
  'go_url': (context) => WebViewPage(
        loadWeb: ModalRoute.of(context)?.settings.arguments as LoadWeb,
      ),
  'web_view': (context) => InappWeb(
        loadWeb: ModalRoute.of(context)?.settings.arguments as LoadWeb,
      ),
  'action': (_) => ActionPage(),
};
