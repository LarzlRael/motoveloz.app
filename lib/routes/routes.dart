import 'package:flutter/material.dart';
import 'package:WaraShops/pages/pages.dart';
import 'package:go_router/go_router.dart';

import '../utils/utils.dart';
import '../widgets/widgets.dart';

/* final Map<String, Widget Function(BuildContext)> appRoutes = {
  /* Register and login  */
  'welcome': (_) => WelcomePage(),
  'list_shops': (_) => ShopsListsPage(),
  'gps_request': (_) => AccesoGpsPage(),
  'loading_page': (_) => LoadingPage(),
  'go_url': (context) => WebViewPage(
        loadWeb: ModalRoute.of(context)?.settings.arguments as LoadWeb,
      ),
  'web_view': (context) => InappWebPage(
        loadWeb: ModalRoute.of(context)?.settings.arguments as LoadWeb,
      ),
  'action': (_) => ActionPage(),
}; */

final appRouter = GoRouter(
  initialLocation: '/',
  /* refreshListenable: goRouterNotifier, */
  routes: [
    ///* Primera pantalla
    GoRoute(
      path: '/',
      builder: (context, state) => InitialPage(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => WelcomePage(),
    ),
    GoRoute(
      path: '/list_shops',
      builder: (context, state) => ShopsListsPage(),
    ),
    GoRoute(
      path: '/gps_request',
      builder: (context, state) => AccesoGpsPage(),
    ),
    GoRoute(
      path: '/loading_page',
      builder: (context, state) => LoadingPage(),
    ),
    /* THIS ROUTES IS NOT USED */
    /* GoRoute(
      path: '/go_url',
      builder: (context, state) {
        final loadWeb = state.extra as LoadWeb;
        return WebViewPage(loadWeb: loadWeb);
      },
    ), */
    GoRoute(
      path: '/web_view',
      pageBuilder: (context, state) {
        final loadWeb = state.extra as LoadWeb;
        return fadeInTransition(
          duration: Duration(milliseconds: 500),
          child: InappWebPage(loadWeb: loadWeb),
        );
      },
    ),
    GoRoute(
      path: '/action',
      builder: (context, state) => ActionPage(),
    ),

    /*  GoRoute(
      path: '/abecedario',
      pageBuilder: (context, state) {
        final pageArgs = state.extra as PageRouteParams;
        return fadeInTransition(
            duration: Duration(milliseconds: 250),
            child: AbecedarioPage(pageArgs: pageArgs));
      },
    ), */
  ],
);
