/* import 'package:geolocator/geolocator.dart'; */
import 'package:WaraShops/data/constants.dart';
import 'package:WaraShops/models/models.dart';
import 'package:WaraShops/services/services.dart';
import 'package:WaraShops/widgets/results/future_data_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:WaraShops/data/shop_data.dart';
import 'package:WaraShops/widgets/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import '../dialogs/confirm_dialog.dart';
import '../helpers/helpers.dart';
import '../utils/utils.dart';

part 'shops_lists_page.dart';
part 'web_view_page.dart';
part 'acceso_gps_page.dart';
part 'loading_page.dart';
