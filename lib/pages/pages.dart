/* import 'package:geolocator/geolocator.dart'; */
import 'package:WaraShops/data/constants.dart';
import 'package:WaraShops/data/theme_colors.dart';
import 'package:WaraShops/models/models.dart';
import 'package:WaraShops/services/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:WaraShops/widgets/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'dart:async';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/helpers.dart';
import '../utils/utils.dart';

part 'shops_lists_page.dart';
part 'web_view_page.dart';
part 'acceso_gps_page.dart';
part 'loading_page.dart';
part 'inapp_web.dart';
part 'action.dart';
